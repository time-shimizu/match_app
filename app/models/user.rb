class User < ApplicationRecord
  has_many :active_reactions, class_name: "Reaction",
                              foreign_key: "from_user_id",
                              dependent: :destroy
  has_many :likes, through: :active_reactions, source: :to_user
  has_many :passive_reactions, class_name: "Reaction",
                               foreign_key: "to_user_id",
                               dependent: :destroy
  has_many :enlikes, through: :passive_reactions, source: :fron_user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :img_name, ImgNameUploader

  enum sex: { 男: 0, 女: 1 }
end
