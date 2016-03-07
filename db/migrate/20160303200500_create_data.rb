class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :loan_number
      t.text :product_description
      t.string :type_product
      t.string :census_tract
      t.string :income_level
      t.string :state
      t.string :county
      t.integer :state_fips
      t.integer :county_fips
      t.text :purpose
      t.text :property_type
      t.integer :fico
      t.datetime :application_date

      t.timestamps null: false
    end
  end
end
