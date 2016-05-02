class AddMetaToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :meta, :string
  end
end
