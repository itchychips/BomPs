-- This file is part of BomPs.
--
-- BomPs is free software: you can redistribute it and/or modify it under the
-- terms of the GNU Affero Public License as published by the Free Software
-- Foundation, either version 3 of the License, or (at your option) any later
-- version.
--
-- BomPs is distributed in the hope that it will be useful, but WITHOUT ANY
-- WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
-- A PARTICULAR PURPOSE. See the GNU Affero Public License for more details.
--
-- You should have received a copy of the GNU Affero Public License along with
-- BomPs. If not, see <https://www.gnu.org/licenses/>.
WITH cte AS (
    WITH RECURSIVE
        input(recipe_variant, output_item, output_quantity, input_item, input_quantity) AS (
            SELECT recipe_variant, output_item, @output_quantity*output_quantity, input_item, @output_quantity*input_quantity
            FROM recipe
            WHERE output_item = @output_item
                AND recipe_variant = @recipe_variant
            UNION
            SELECT next.recipe_variant, next.output_item, current.input_quantity, next.input_item, (current.input_quantity / next.output_quantity * next.input_quantity)
            FROM input current
                JOIN recipe next
                ON next.output_item = current.input_item
            WHERE 1=1
                -- Add a line for each variant you have.  Then concatenate the footer.
                --
                -- Example line:
                --AND (next.output_item <> 'Iron ingot' OR (next.output_item = 'Iron ingot' AND next.recipe_variant = 1))
