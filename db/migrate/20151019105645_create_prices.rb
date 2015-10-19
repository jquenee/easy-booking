class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.string :key
      t.string :value

      t.timestamps null: false
    end
  end
end
