# ruby encoding: utf-8

class InitialData < ActiveRecord::Migration
  def import_prices
    Price.delete_all
    Price.create({"key" => "Travailleur", "value"=>"12€"})
    Price.create({"key" => "Chomeur", "value"=>"5€"})
    Price.create({"key" => "Etudiant", "value"=>"5€"})
    Price.create({"key" => "Enfant", "value"=>"5€"})
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
