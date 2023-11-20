class CreateBusinessUserRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :business_user_relationships do |t|

      t.timestamps
    end
  end
end
