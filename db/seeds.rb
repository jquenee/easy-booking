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

  def import_settings
    Settings.delete_all
    Settings.create({"key" => "website_url", "vtype" => "string", "value" => Rails.configuration.x.website_url})
    Settings.create({"key" => "website_name", "vtype" => "string", "value" => Rails.configuration.x.name})
    Settings.create({"key" => "website_password", "vtype" => "string", "value" => Rails.configuration.x.password})
    Settings.create({"key" => "maxroom", "vtype" => "integer", "value" => Rails.configuration.x.maxroom.to_s})
    Settings.create({"key" => "full_price", "vtype" => "integer", "value" => Rails.configuration.x.full_price.to_s})
    Settings.create({"key" => "reduced_price", "vtype" => "integer", "value" => Rails.configuration.x.reduced_price.to_s})
    Settings.create({"key" => "smtp_domain", "vtype" => "string", "value" => Rails.configuration.x.email_smtp_domain})
    Settings.create({"key" => "smtp_ip", "vtype" => "string", "value" => Rails.configuration.x.email_smtp_ip})
    Settings.create({"key" => "smtp_port", "vtype" => "integer", "value" => Rails.configuration.x.email_smtp_port.to_s})
    Settings.create({"key" => "smtp_ttls", "vtype" => "boolean", "value" => Rails.configuration.x.email_smtp_ttls.to_s})
    Settings.create({"key" => "smtp_login", "vtype" => "string", "value" => Rails.configuration.x.email_smtp_login})
    Settings.create({"key" => "smtp_password", "vtype" => "string", "value" => Rails.configuration.x.email_smtp_password})
    Settings.create({"key" => "smtp_debug", "vtype" => "boolean", "value" => Rails.configuration.x.email_debug.to_s})
  end
end

seed = InitialData.new
seed.import_prices
seed.import_contacts
seed.import_settings
