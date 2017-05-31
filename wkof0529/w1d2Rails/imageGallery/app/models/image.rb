# == Schema Information
#
# Table name: images
#
#  id                 :integer          not null, primary key
#  image              :string
#  image_title        :string
#  image_file_size    :string
#  image_content_type :string
#  image_description  :string
#  category_id        :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :category,
    primary_key: :id,
    foreign_key: :category_id,
    class_name: :Category

  mount_uploader :image, ImageUploader
	before_save :update_image_attributes

	private
	def update_image_attributes
		if image.present? && image_changed?
			self.image_content_type = image.file.content_type
			self.image_file_size = image.file.size
		end
	end
end
