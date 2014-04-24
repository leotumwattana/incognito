class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :points
      t.references :user, index: true

      t.timestamps
    end
  end
end
