class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :uuid
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :website
      t.string :created_at

      t.timestamps null: false
    end
  end
end
