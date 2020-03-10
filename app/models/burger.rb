class Burger < ApplicationRecord
    def nutriments
        # USE -> product.nutriments
        # Send nutiments to controler
        # Make controler give it to the view (display only the "show burger" view)
        # add it to json
        require 'openfoodfacts'

        # Browse a product
        code = self.code
        product = Openfoodfacts::Product.get(code, locale: 'fr')
        @nut = product.nutriments
        @nutrs = ["energy" => @nut.energy_100g, "fat" => @nut.fat_100g, "fat_unit" => @nut.fat_unit, "salt" => @nut.salt_100g, "salt_unit" => @nut.salt_unit, "proteins" => @nut.proteins_100g, "proteins_unit" => @nut.proteins_unit]
    end
end