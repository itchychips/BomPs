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
SELECT recipe_variant,
    output_item,
    output_quantity,
    input_item,
    input_quantity
FROM recipe r
WHERE r.output_item LIKE @output_item
    AND r.input_item LIKE @input_item;
