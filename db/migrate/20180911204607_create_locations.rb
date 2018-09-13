class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.decimal :longitude
      t.decimal :latitude
      t.text :description
      t.string :name
      t.string :contact
      t.boolean :permit
      t.text :notes

      t.timestamps
    end
  end
end
