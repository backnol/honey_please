class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string   :points
      t.datetime :due_at
      t.integer  :status, default: 0
      t.string   :title
    end

    add_index :tasks, :points
    add_index :tasks, :due_at
    add_index :tasks, :status
  end
end
