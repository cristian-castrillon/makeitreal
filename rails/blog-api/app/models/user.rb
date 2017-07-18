class User < ApplicationRecord
  has_many :articles

  validates :username, :full_name, presence: true
end
