class Address < ApplicationRecord
  belongs_to :user

  validates :zip, :country, :line1, :city, presence: true
  validates :line1, :line2, :city, length: { maximum: 50 }
  validates :zip, length: { maximum: 10 }
  validates :country, length: { is: 2 }
  validates :state, presence: true, if: :us?
  validates :country, inclusion: { in: %w(co us) }

  def us?
    country == "us"
  end
end
