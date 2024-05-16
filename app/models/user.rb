class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password_digest
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  validates :password, presence: true, length: { minimum: 6, message: "doit comporter au moins 6 caractères" }
  has_many :borrows
end
