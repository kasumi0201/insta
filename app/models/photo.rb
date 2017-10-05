class Photo < ApplicationRecord
  belongs_to :user
   include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute
# validates :description, presence: true



end
