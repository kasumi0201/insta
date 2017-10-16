class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :remember_token, :activation_token
  before_save   :downcase_email
  # before_create :create_activation_digest
  validates :name,  presence: true, length: { maximum: 50 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :photos, dependent: :destroy
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "follower_id",
                                  dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_one :profile




  has_many :active_relationships,class_name:  "Relationship", foreign_key: "following_id", dependent: :destroy


  has_many :passive_relationships, class_name: "Relationship", foreign_key: "following_id", dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true, length: { maximum: 50 }

  has_many :comments



  # ユーザーをフォローする
  # def follow(other_user)
  #   active_relationships.create(followed_id: other_user.id)
  # end
  #
  # # ユーザーをフォロー解除する
  # def unfollow(other_user)
  #   active_relationships.find_by(followed_id: other_user.id).destroy
  # end
  #
  # # 現在のユーザーがフォローしてたらtrueを返す
  # def following?(other_user)
  #   following.include?(other_user)
  # end
  private

    # メールアドレスをすべて小文字にする
    def downcase_email
      self.email = email.downcase
    end

    # 有効化トークンとダイジェストを作成および代入する
    # def create_activation_digest
    #   # self.activation_token  = User.new_token
    #   self.activation_digest = User.digest(activation_token)
    # end



end
