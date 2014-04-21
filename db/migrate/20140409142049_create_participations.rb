class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.boolean :is_owner
      t.string :status
      t.references :user, index: true
      t.references :event, index: true
    end
  end
end
