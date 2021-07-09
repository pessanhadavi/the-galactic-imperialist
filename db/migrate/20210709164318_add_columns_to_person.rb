class AddColumnsToPerson < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :hair, :string
    add_column :people, :skin, :string
    add_column :people, :eye, :string
    add_column :people, :gender, :string
    add_column :people, :picture_url, :string
  end
end
