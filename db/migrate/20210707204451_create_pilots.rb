class CreatePilots < ActiveRecord::Migration[6.0]
  def change
    create_table :pilots do |t|
      t.references :person, null: false, foreign_key: true
      t.references :starcraft, null: false, foreign_key: true

      t.timestamps
    end
  end
end
