class Food < ApplicationRecord
	has_many :foods
	has_attached_file :food_image
	validates_attachment_content_type :food_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
