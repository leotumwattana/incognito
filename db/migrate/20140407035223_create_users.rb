class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :salt
      t.string :fugu
      t.string :code

      t.timestamps
    end
  end
end
