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
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Wood plank' -OutputQuantity 4 -InputItem 'Log' -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Stick' -OutputQuantity 4 -InputItem 'Wood plank' -InputQuantity 2
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Ladder' -OutputQuantity 3 -InputItem 'Stick' -InputQuantity 6
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Ladder' -OutputQuantity 3 -InputItem 'Wood plank' -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Stone pickaxe' -OutputQuantity 1 -InputItem 'Stick' -InputQuantity 2
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Stone pickaxe' -OutputQuantity 1 -InputItem 'Cobblestone' -InputQuantity 3
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Iron ingot' -OutputQuantity 1 -InputItem 'Iron ore' -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Iron ingot' -OutputQuantity 1 -InputItem 'Coal' -InputQuantity 0.125
Add-BomRecipe -RecipeVariant 2 -OutputItem 'Iron ingot' -OutputQuantity 1 -InputItem 'Iron dust' -InputQuantity 1
Add-BomRecipe -RecipeVariant 2 -OutputItem 'Iron ingot' -OutputQuantity 1 -InputItem 'Dusty coal' -InputQuantity 0.125
Add-BomRecipe -RecipeVariant 3 -OutputItem 'Iron ingot' -OutputQuantity 0.5 -InputItem 'Iron dust' -InputQuantity 1
Add-BomRecipe -RecipeVariant 3 -OutputItem 'Iron ingot' -OutputQuantity 1 -InputItem 'Coal' -InputQuantity 0.125
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Dusty coal' -OutputQuantity 8 -InputItem 'Coal' -InputQuantity 0.5
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Iron dust' -OutputQuantity 2 -InputItem 'Iron ore' -InputQuantity 1
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Iron track' -OutputQuantity 8 -InputItem 'Iron ingot' -InputQuantity 6
Add-BomRecipe -RecipeVariant 1 -OutputItem 'Iron track' -OutputQuantity 8 -InputItem 'Stick' -InputQuantity 1
