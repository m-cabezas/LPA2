class Burger < ApplicationRecord
    def nutriments
        require 'openfoodfacts'

        # Browse a product
        code = self.code
        product = Openfoodfacts::Product.get(code, locale: 'fr')
        
        if product == nil
            product = [["Unknow"], [""]]
        else
            product = product.nutriments
        end        
    end
end