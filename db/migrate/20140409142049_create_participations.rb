class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
      t.boolean :is_owner
      t.string :status
    end
  end
end
