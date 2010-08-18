# To change this template, choose Tools | Templates
# and open the template in the editor.

Paperclip.interpolates :product_name do |attachment, style|
  attachment.instance.product.name.downcase
end

Paperclip.interpolates :product_category do |attachment, style|
  attachment.instance.product.primaryCategoryName.downcase
end

Paperclip.interpolates :product_size do |attachment, style|
  attachment.instance.product.sizeName.downcase
end