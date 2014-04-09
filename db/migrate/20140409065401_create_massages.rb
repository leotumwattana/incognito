class CreateMassages < ActiveRecord::Migration
  def change
    create_table :massages do |t|
      t.string :content
      t.integer :user_id
      t.integer :event_id

      t.timestamps

    end
  end
end
