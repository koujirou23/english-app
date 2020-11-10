class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, presence: true, on: :create, format: { with: VALID_PASSWORD_REGEX,
                                 message: 'Include both letters and numbers' }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, format: { with: VALID_EMAIL_REGEX,
                              message: 'Include (@)' }

  with_options presence: true do
    validates :nickname, format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
  end

  validates :password_confirmation, presence: true, on: :create

  has_many :posts
  has_many :comments
  has_one_attached :avatar
end
