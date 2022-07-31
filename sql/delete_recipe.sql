DELETE FROM recipe
WHERE recipe_variant = @recipe_variant
    AND output_item = @output_item;
