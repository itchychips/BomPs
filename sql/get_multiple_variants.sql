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
        input(recipe_variant, output_item, input_item) AS (
            SELECT recipe_variant, output_item, input_item
            FROM recipe
            WHERE recipe_variant = @recipe_variant
                AND output_item = @output_item
            UNION
            SELECT next.recipe_variant, next.output_item, next.input_item
            FROM recipe next, input current
            WHERE next.output_item = current.input_item
        )
    SELECT DISTINCT recipe_variant, output_item
    FROM input i
)
SELECT output_item, COUNT(*) AS variant_count
FROM cte
GROUP BY output_item
HAVING COUNT(*) > 1;

-- Naive way; will produce recipe outside of the BOM tree.
-- WITH cte AS (
--     SELECT DISTINCT recipe_variant, output_item
--     FROM recipe
-- )
-- SELECT output_item, COUNT(*)
-- FROM cte
-- GROUP BY output_item
-- HAVING COUNT(*) > 1;
