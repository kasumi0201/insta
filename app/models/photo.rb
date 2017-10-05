class Photo < ApplicationRecord

   include ImageUploader[:image] # adds an `image` virtual attribute
# validates :description, presence: true
  belongs_to :user


end
