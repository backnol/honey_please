class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :honey_id
    end

    add_index :relationships, :user_id
    add_index :relationships, :honey_id
  end
end
