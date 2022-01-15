class Actor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :favorites, dependent: :destroy
   attachment :image

  # 名前とメールアドレスのバリデーション
  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # ------お気に入り機能-----------
   def favorited_by?(client)
     favorites.where(client_id: client.id).exists?
   end

  # -----トラッキング機能（PV数）------
  is_impressionable counter_cache: true
end
