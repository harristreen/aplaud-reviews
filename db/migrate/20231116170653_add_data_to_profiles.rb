class AddDataToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :user_id, :string
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :username, :string
    add_column :profiles, :dob, :date
    add_column :profiles, :location, :string
    add_column :profiles, :interests, :string, array: true, default: []
    add_column :profiles, :dietary_preferences, :string, array: true, default: []
  end
end
