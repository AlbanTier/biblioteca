class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password_digest
  validates :email, format: URI::MailTo::EMAIL_REGEXP
  has_many :borrows
end
