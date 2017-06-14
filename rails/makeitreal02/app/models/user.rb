class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :addresses
  has_many :invoices

  validates :email, uniqueness: true
  validates :password, length: { in: 8..16 }

  before_validation :sanitize
  before_create :creating

  # scope :with_orders, -> (id) {
  #   includes(:orders).find(id).orders
  # }

  private
    def sanitize
      username.downcase!
      email.downcase!
    end

    def creating
      puts "Creando usuario"
    end
end
