class Highlight < ApplicationRecord
	mount_uploader :image, ImageUploader
	def area_enum
    Area.all.map { |c| [c.name, c.id] }
  end
end
