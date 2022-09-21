class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true, length: { maximum: 6 }
  validates :first_name, presence: true, format: { with: (/\A[ぁ-んァ-ヶ一-龥々]+\z/)}
  validates :last_name, presence: true, format: { with: (/\A[ぁ-んァ-ヶ一-龥々]+\z/)}
  validates :first_name_kana, presence: true, format: { with: (/\A[ァ-ヶ]+\z/)}
  validates :last_name_kana, presence: true, format: { with: (/\A[ァ-ヶ]+\z/)}
  validates :birthday, presence: true
  PASSWORD_REGEX = (/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
  validates :password, presence: true, format: { with: PASSWORD_REGEX}, allow_blank: true

  has_many :items
  belongs_to :Purchase
end
