class CreateStarcrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :starcrafts do |t|
      t.string :name

      t.timestamps
    end
  end
end
