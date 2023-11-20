class AddDataToBusinesses < ActiveRecord::Migration[7.0]
  def change
    add_column :businesses, :name, :string
    add_column :businesses, :location, :string
    add_column :businesses, :address, :string
    add_column :businesses, :lat, :float
    add_column :businesses, :long, :float
    add_column :businesses, :business_type, :string
    add_column :businesses, :user_assigned, :boolean , default: false
    add_column :businesses, :is_validated, :boolean, default: false
    add_column :businesses, :description, :text
    add_column :businesses, :tags, :string, array: true, default: []
  end
end
