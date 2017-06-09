class User < ApplicationRecord
  has_many :orders
  has_many :addresses

  validates :email, uniqueness: true
  validates :password, length: { in: 8..16 }
end
