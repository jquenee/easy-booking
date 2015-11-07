class Booking < ActiveRecord::Base
  belongs_to :contact

  validates :name, :presence => true
  validates :phone, :presence => true
  validates :phone, length: { is: 10 }
  validates :start, :presence => true
  validates :end, :presence => true
  validates :full_price, :presence => true
  validates :reduced_price, :presence => true

  validate :check_prices

  def check_prices
   if full_price == 0 and reduced_price == 0
     errors.add(:base, 'Tarif: merci d\'indiquer le nombre de personne')
     return false
  end
  return true
 end

end
