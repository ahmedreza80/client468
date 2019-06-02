class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	mount_uploader :imagetwo, ImageUploader
	mount_uploader :imagethree, ImageUploader
	belongs_to :user
	belongs_to :shop
	has_many :items, class_name: 'OrderItem'
	has_many :orders, through:  :items
	acts_as_commontable
	ratyrate_rateable 'pro'
end
