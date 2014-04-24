class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.integer :user_id
      t.integer :event_id
      t.references :user, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
