class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :imagetwo, ImageUploader
	mount_uploader :imagethree, ImageUploader
	belongs_to :user
	belongs_to :shop
	has_many :items, class_name: 'OrderItem'
	has_many :orders, through:  :items
	has_many :previews
	acts_as_commontable
	scope :similar_products, ->(product) { where("id != ? and category = ?", product.id, product.category) }




def original_deal
  price
end

def our_deal
  offerprice
end

def percentage_off
   (Float(original_deal - our_deal) / original_deal * 100).ceil
end

end
