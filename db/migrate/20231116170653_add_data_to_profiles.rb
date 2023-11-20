class AddDataToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth0_id, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :dob, :date
    add_column :users, :location, :string
    add_column :users, :interests, :string, array: true, default: []
    add_column :users, :dietary_preferences, :string, array: true, default: []
  end
end
