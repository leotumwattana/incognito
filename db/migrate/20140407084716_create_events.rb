class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date_time
      t.boolean :complete, default: false
      t.references :user, index: true

      t.timestamps
    end
  end
end
