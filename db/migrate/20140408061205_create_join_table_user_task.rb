class CreateJoinTableUserTask < ActiveRecord::Migration
  def change
      create_table :tasks_users do |t|
      t.integer :user_id
      t.integer :task_id
      # t.index [:user_id, :task_id]
      # t.index [:task_id, :user_id]
    end
  end
end