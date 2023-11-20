class AddDataToBusinessUserRelationships < ActiveRecord::Migration[7.0]
  def change
    add_reference :business_user_relationships, :user, null: false, foreign_key: true
    add_reference :business_user_relationships, :business, null: false, foreign_key: true
    add_column :business_user_relationships, :role, :string
    add_column :business_user_relationships, :verified, :boolean
  end
end
