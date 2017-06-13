class User < ApplicationRecord
  has_many :orders
  has_many :addresses
  has_many :invoices

  validates :email, uniqueness: true
  validates :password, length: { in: 8..16 }

  before_validation :sanitize
  before_create :creating

  private
    def sanitize
      username.downcase!
      email.downcase!
    end

    def creating
      puts "Creando usuario"
    end
end
