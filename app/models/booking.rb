class Booking < ActiveRecord::Base
  belongs_to :contact

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :phone, length: { is: 10 }
  validates :start, :presence => true
  validates :end, :presence => true
  validates :full_price, :presence => true
  validates :reduced_price, :presence => true
end
