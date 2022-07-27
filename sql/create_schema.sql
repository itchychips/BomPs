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
CREATE TABLE IF NOT EXISTS recipe (
    recipe_variant INTEGER,
    output_item STRING,
    output_quantity REAL,
    input_item STRING,
    input_quantity REAL,
    PRIMARY KEY(recipe_variant, output_item, input_item));
