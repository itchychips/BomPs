# This file is part of BomPs.
#
# BomPs is free software: you can redistribute it and/or modify it under the
# terms of the GNU Affero Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# BomPs is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU Affero Public License for more details.
#
# You should have received a copy of the GNU Affero Public License along with
# BomPs. If not, see <https://www.gnu.org/licenses/>.
$ErrorActionPreference = "Stop"

Import-Module PSSQlite

$global:BomPsSqlRoot = "$PSScriptRoot\sql"

if (-not $global:BomPsSqliteConnection) {
    $global:BomPsSqliteConnection = $null
}
else {
    Write-Verbose "Open connection at `$global:BomPsSqliteConnection preserved."
}

function ConvertTo-PsPropertyStyle {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory,ValueFromPipeline)]
        [PSObject]$InputObject
    )

    Process {
        $properties = Get-Member @PSBoundParameters | Where-Object { $_.MemberType -eq "NoteProperty" } | Select-Object -Expand Name
        $outputObject = New-Object -Type PSObject

        foreach ($property in $properties) {
            $newProperty = ""
            for ($index = 0; $index -lt $property.Length; $index++) {
                if ($index -eq 0) {
                    $newProperty += [char]::ToUpperInvariant($property[$index])
                }
                elseif ($property[$index] -eq "_") {
                    $index += 1
                    $newProperty += [char]::ToUpperInvariant($property[$index])
                }
                else {
                    $newProperty += $property[$index]
                }
            }
            $outputObject | Add-Member -Type NoteProperty -Name $newProperty -Value $InputObject.$property
        }
        $outputObject
    }
}

function Open-BomRecipeConnection {
    [CmdletBinding()]
    Param(
        [parameter()]
        [string]$DataSource
    )

    if ($global:BomPsSqliteConnection) {
        return $global:BomPsSqliteConnection
    }

    if (-not $DataSource) {
        if ($global:BomPsDefaultDataSource) {
            $DataSource = $global:BomPsDefaultDataSource
            Write-Verbose "Using overridden data source path: '$DataSource' from `$global:BomPsSqliteConnection."
        }
        else {
            $DataSource = "$pwd\BomPs.sqlite"
            Write-Verbose "Using default data source path: '$DataSource'.  Use `$global:BomPsSqliteConnection to override default."
        }
    }

    try {
        $DataSource = Resolve-Path $DataSource
    }
    catch {
        if ($_.Exception.GetType().Name -ne "ItemNotFoundException") {
            throw
        }
        $DataSource = $_.TargetObject
    }
    $global:BomPsSqliteConnection = New-SqliteConnection -DataSource $DataSource
    Write-Verbose "Sqlite connection to '$DataSource' opened."
    $global:BomPsSqliteConnection
}

function Close-BomRecipeConnection {
    [CmdletBinding()]
    Param(
        [parameter(ValueFromPipeline)]
        [PSObject]$SqliteConnection
    )

    if (-not $SqliteConnection) {
        if ($global:BomPsSqliteConnection) {
            $SqliteConnection = $global:BomPsSqliteConnection
        }
        else {
            Write-Verbose "No connection open.  Nothing to do."
            return
        }
    }

    $SqliteConnection.Close()
    $SqliteConnection.Dispose()
    $global:BomPsSqliteConnection = $null
}

function Get-BomQueryScript {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [string]$Name
    )

    $path = "$BomPsSqlRoot\$Name"

    if (-not (Test-Path $path)) {
        throw "No script found for name '$Name': '$path'."
    }

    Get-Content $path -Raw
}

function Register-BomRecipeSchema {
    [CmdletBinding()]
    Param(
        [parameter()]
        [PSObject]$SqliteConnection
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "create_schema.sql"

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query
}

function Unregister-BomRecipeSchema {
    [CmdletBinding()]
    Param(
        [parameter()]
        [PSObject]$SqliteConnection
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "drop_schema.sql"

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query
}

function Add-BomRecipe {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [int]$RecipeVariant,
        [parameter(Mandatory)]
        [string]$OutputItem,
        [parameter(Mandatory)]
        [double]$OutputQuantity,
        [parameter(Mandatory)]
        [string]$InputItem,
        [parameter(Mandatory)]
        [double]$InputQuantity
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "insert_recipe.sql"

    $sqlParameters = @{
        "recipe_variant"=$RecipeVariant
        "output_item"=$OutputItem
        "output_quantity"=$OutputQuantity
        "input_item"=$InputItem
        "input_quantity"=$InputQuantity
    }

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query -SqlParameters $sqlParameters
}

function Get-BomRecipe {
    [CmdletBinding()]
    Param(
        [parameter()]
        [string]$OutputItem="*",
        [parameter()]
        [string]$InputItem="*"
    )

    $OutputName = $OutputItem -replace "\*","%"
    $InputName = $InputItem -replace "\*","%"

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "get_recipe.sql"

    $sqlParameters = @{
        "output_item"=$OutputName
        "input_item"=$InputName
    }

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query -SqlParameters $sqlParameters -OutVariable results | ConvertTo-PsPropertyStyle

    if (-not $results) {
        Write-Warning "No results found."
    }
}

function Get-BomRecipeVariant {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [int]$RecipeVariant,
        [parameter(Mandatory)]
        [string]$OutputItem
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "get_multiple_variants.sql"

    $sqlParameters = @{
        "recipe_variant"=$RecipeVariant
        "output_item"=$OutputItem
    }

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query -SqlParameters $sqlParameters -OutVariable results
}

function Get-BomMaterial {
    [CmdletBinding(DefaultParameterSetName="Deep")]
    Param(
        [parameter(Mandatory)]
        [int]$RecipeVariant,
        [parameter(Mandatory)]
        [string]$OutputItem,
        [parameter(ParameterSetName="Deep")]
        [double]$Quantity=1,
        [parameter()]
        [HashTable]$VariantChoices,
        [parameter(ParameterSetName="Flat")]
        [switch]$Flat
    )

    if ($Flat) {
        $PSBoundParameters.Remove("Flat")
        Get_BomMaterialFlat @PSBoundParameters
    }
    else {
        Get_BomMaterial @PSBoundParameters
    }
}

function Get_BomMaterialFlat {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [int]$RecipeVariant,
        [parameter(Mandatory)]
        [string]$OutputItem
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $query = Get-BomQueryScript "get_bom_flat.sql"

    $sqlParameters = @{
        "recipe_variant"=$RecipeVariant
        "output_item"=$OutputItem
    }

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query -SqlParameters $sqlParameters -OutVariable results | ConvertTo-PsPropertyStyle
}

function Get_BomMaterial {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [int]$RecipeVariant,
        [parameter(Mandatory)]
        [string]$OutputItem,
        [parameter()]
        [HashTable]$VariantChoices=@{},
        [parameter()]
        [double]$Quantity=1
    )

    if (-not $SqliteConnection) {
        $SqliteConnection = Open-BomRecipeConnection
    }

    $queryHeader = Get-BomQueryScript "get_bom_deep_header.sql"
    $queryFooter = Get-BomQueryScript "get_bom_deep_footer.sql"

    $PSBoundParameters.Remove("VariantChoices") | Out-Null
    $PSBoundParameters.Remove("Quantity") | Out-Null

    $possibleVariants = Get-BomRecipeVariant @PSBoundParameters

    $sqlWhereAddendum = ""

    $variantCount = 0

    $sqlParameters = @{
        "recipe_variant"=$RecipeVariant
        "output_item"=$OutputItem
        "output_quantity"=$Quantity
    }

    foreach ($possibleVariant in $possibleVariants) {
        if (-not $VariantChoices.ContainsKey($possibleVariant.OutputItem)) {
            $choice = Read-BomUserVariant -OutputItem $possibleVariant.OutputItem
            $VariantChoices[$choice.OutputItem] = $choice.RecipeVariant
            #throw "No variant defined for $($possibleVariant.output_item)."
        }
        #--AND (next.output_item <> 'Iron ingot' OR (next.output_item = 'Iron ingot' AND next.recipe_variant = 1))
        $sqlWhereAddendum += "
                AND (next.output_item <> @output_item_$variantCount OR (next.output_item = @output_item_$variantCount AND next.recipe_variant = @recipe_variant_$variantCount))"

        $sqlParameters["output_item_$variantCount"] = $possibleVariants.OutputItem
        $sqlParameters["recipe_variant_$variantCount"] = $VariantChoices[$possibleVariants.OutputItem]
    }

    $query = "$queryHeader$sqlWhereAddendum`n$queryFooter"
    Write-Debug $query

    Invoke-SqliteQuery -SqliteConnection $SqliteConnection -Query $query -SqlParameters $sqlParameters -OutVariable results

    if (-not $results) {
        throw "No results."
    }
}

function Read-BomUserVariant {
    [CmdletBinding()]
    Param(
        [parameter(Mandatory)]
        [string]$OutputItem
    )

    $recipes = Get-BomRecipe @PSBoundParameters
    if (-not $recipes) {
        throw "No variants for recipe '$OutputItem' found."
    }

    $variants = $recipes | Select-Object -Unique -Expand RecipeVariant

    Write-Host "Recipe for $($recipes[0].OutputItem) has the following possible inputs:"
    foreach ($variant in $variants) {
        $variantRecipes = $recipes | Where-Object { $_.RecipeVariant -eq $variant }
        Write-Host "`t$variant (produces $($variantRecipes[0].OutputQuantity)):"
        foreach ($variantRecipe in $variantRecipes) {
            Write-Host "`t`t$($variantRecipe.InputItem) x$($variantRecipe.InputQuantity)"
        }
    }

    [int]$variant = Read-Host -Prompt "Please select which variant"
    $output = New-Object -Type PSObject
    $output | Add-Member -Type NoteProperty -Name RecipeVariant -Value $variant
    $output | Add-Member -Type NoteProperty -Name OutputItem -Value $OutputItem
    $output
}
