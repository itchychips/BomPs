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

# Ensure we start with a clean table state.
Unregister-BomRecipeSchema
Register-BomRecipeSchema

# Base materials
Add-BomRecipe -RecipeVariant 1 -OutputItem "Silicon Wafers" -OutputQuantity 1 -InputItem "Silicon" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Teladianium" -OutputQuantity 1 -InputItem "Ore" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Refined Metals" -OutputQuantity 1 -InputItem "Ore" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Water" -OutputQuantity 1 -InputItem "Ice" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Graphene" -OutputQuantity 1 -InputItem "Methane" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Superfluid Coolant" -OutputQuantity 1 -InputItem "Helium" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Antimatter Cells" -OutputQuantity 1 -InputItem "Hydrogen" -InputQuantity 1

# Intermediate materials
Add-BomRecipe -RecipeVariant 1 -OutputItem "Scanning Arrays" -OutputQuantity 1 -InputItem "Silicon Wafers" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Scanning Arrays" -OutputQuantity 1 -InputItem "Teladianium" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Scanning Arrays" -OutputQuantity 1 -InputItem "Silicon Wafers" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Scanning Arrays" -OutputQuantity 1 -InputItem "Refined Metals" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Smart Chips" -OutputQuantity 1 -InputItem "Silicon Wafers" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Microchips" -OutputQuantity 1 -InputItem "Silicon Wafers" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Composites" -OutputQuantity 1 -InputItem "Teladianium" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Composites" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Advanced Composites" -OutputQuantity 1 -InputItem "Refined Metals" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Advanced Composites" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Hull Parts" -OutputQuantity 1 -InputItem "Teladianium" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Hull Parts" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Hull Parts" -OutputQuantity 1 -InputItem "Refined Metals" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Hull Parts" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Quantum Tubes" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Quantum Tubes" -OutputQuantity 1 -InputItem "Superfluid Coolant" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Plasma Conductors" -OutputQuantity 1 -InputItem "Graphene" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Plasma Conductors" -OutputQuantity 1 -InputItem "Superfluid Coolant" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Turret Components" -OutputQuantity 1 -InputItem "Scanning Arrays" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Turret Components" -OutputQuantity 1 -InputItem "Microchips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Turret Components" -OutputQuantity 1 -InputItem "Quantum Tubes" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Antimatter Converters" -OutputQuantity 1 -InputItem "Microchips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Antimatter Converters" -OutputQuantity 1 -InputItem "Advanced Composites" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Missile Components" -OutputQuantity 1 -InputItem "Advanced Composites" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Missile Components" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Electronics" -OutputQuantity 1 -InputItem "Microchips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Electronics" -OutputQuantity 1 -InputItem "Quantum Tubes" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Weapon Components" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Weapon Components" -OutputQuantity 1 -InputItem "Plasma Conductors" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Engine Parts" -OutputQuantity 1 -InputItem "Teladianium" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Engine Parts" -OutputQuantity 1 -InputItem "Antimatter Cells" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Engine Parts" -OutputQuantity 1 -InputItem "Refined Metals" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Engine Parts" -OutputQuantity 1 -InputItem "Antimatter Cells" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Field Coils" -OutputQuantity 1 -InputItem "Quantum Tubes" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Field Coils" -OutputQuantity 1 -InputItem "Plasma Conductors" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Shield Components" -OutputQuantity 1 -InputItem "Quantum Tubes" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Shield Components" -OutputQuantity 1 -InputItem "Plasma Conductors" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Drone Components" -OutputQuantity 1 -InputItem "Scanning Arrays" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Drone Components" -OutputQuantity 1 -InputItem "Microchips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Drone Components" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Drone Components" -OutputQuantity 1 -InputItem "Engine Parts" -InputQuantity 1

# End materials
Add-BomRecipe -RecipeVariant 1 -OutputItem "Satellites" -OutputQuantity 1 -InputItem "Scanning Arrays" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Satellites" -OutputQuantity 1 -InputItem "Scanning Arrays" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Advanced Satellites" -OutputQuantity 1 -InputItem "Advanced Electronics" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Resource Probe" -OutputQuantity 1 -InputItem "Scanning Arrays" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Resource Probe" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Drones" -OutputQuantity 1 -InputItem "Drone Components" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Drones" -OutputQuantity 1 -InputItem "Smart Chips" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Laser Towers" -OutputQuantity 1 -InputItem "Drone Components" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Laser Towers" -OutputQuantity 1 -InputItem "Smart Chips" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Missiles" -OutputQuantity 1 -InputItem "Smart Chips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Missiles" -OutputQuantity 1 -InputItem "Missile Components" -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem "Missiles, unguided" -OutputQuantity 1 -InputItem "Missile Components" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Mines" -OutputQuantity 1 -InputItem "Smart Chips" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Mines" -OutputQuantity 1 -InputItem "Weapon Components" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Turret Weapons" -OutputQuantity 1 -InputItem "Turret Components" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Turret Weapons" -OutputQuantity 1 -InputItem "Advanced Electronics" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Engines" -OutputQuantity 1 -InputItem "Antimatter Converters" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Engines" -OutputQuantity 1 -InputItem "Engine Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Engines, basic" -OutputQuantity 1 -InputItem "Engine Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Thrusters" -OutputQuantity 1 -InputItem "Antimatter Converters" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Thrusters" -OutputQuantity 1 -InputItem "Engine Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Thrusters, basic" -OutputQuantity 1 -InputItem "Engine Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Fixed Weapons" -OutputQuantity 1 -InputItem "Advanced Electronics" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Fixed Weapons" -OutputQuantity 1 -InputItem "Weapon Components" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Nav Beacons" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Ship Hulls" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Shields" -OutputQuantity 1 -InputItem "Field Coils" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Shields" -OutputQuantity 1 -InputItem "Shield Components" -InputQuantity 1

Add-BomRecipe -RecipeVariant 2 -OutputItem "Shields, Basic" -OutputQuantity 1 -InputItem "Shield Components" -InputQuantity 1

Add-BomRecipe -RecipeVariant 1 -OutputItem "Station Modules" -OutputQuantity 1 -InputItem "Hull Parts" -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem "Station Modules" -OutputQuantity 1 -InputItem "Claytronics" -InputQuantity 1

# If you don't care about Refined Metals vs Teladianium, since they muddy the
# variants a bit, use one of these commands to remove one of them:
#
# Get-BomRecipe | Where-Object { $_.InputItem -eq "Refined Metals" } | Remove-BomRecipe
# Get-BomRecipe | Where-Object { $_.InputItem -eq "Teladianium" } | Remove-BomRecipe
