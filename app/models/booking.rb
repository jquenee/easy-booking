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
  validate :check_dates

  def check_prices
   if full_price == 0 and reduced_price == 0
     errors.add(:base, 'Tarif: merci d\'indiquer le nombre de personne')
     return false
  end
  return true
  end

  def check_dates
   if self.end != nil and self.start > self.end
     errors.add(:base, 'Dates: merci de mettre une date de début inférieur ou égale à la date de fin')
     return false
   end
   return true
  end

end
