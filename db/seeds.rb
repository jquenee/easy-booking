# ruby encoding: utf-8

class InitialData < ActiveRecord::Migration[5.2]
  def import_prices
    Price.delete_all
    Price.create({"key" => "Travailleur", "value"=> Rails.configuration.x.full_price.to_s << "€"})
    Price.create({"key" => "Chomeur", "value"=> Rails.configuration.x.reduced_price.to_s << "€"})
    Price.create({"key" => "Etudiant", "value"=> Rails.configuration.x.reduced_price.to_s << "€"})
    Price.create({"key" => "Enfant", "value"=> Rails.configuration.x.reduced_price.to_s << "€"})
  end

  def import_contacts
    Contact.delete_all
    Contact.create({"id" => 1, "name"=>"Contact1", "phone" => "0601010101", "email"=>"contact1.acme@gmail.com"})
    Contact.create({"id" => 2, "name"=>"Contact2", "phone" => "0602020202", "email"=>"contact2.acme@yahoo.com"})
  end
end

seed = InitialData.new
seed.import_prices
seed.import_contacts
