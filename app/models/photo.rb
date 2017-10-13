class Photo < ApplicationRecord

  include ImageUploader::Attachment.new(:image) # adds an `image` virtual attribute

  validates :image_data, :caption,  presence: false
    belongs_to :user
     acts_as_votable
       has_many :comments, dependent: :destroy

    def self.search(search)
      where(['caption LIKE ?', "%#{search}%"])
    end
end
