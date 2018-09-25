class Places < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :longitude
      t.decimal :latitude
      t.string :venue
      t.string :contactName
      t.string :contactPhone
      t.string :email
      t.text :description
      t.boolean :permit
      t.string :fileName
      t.string :GPSLatitudeRef
      t.string :GPSLongitudeRef
    end
  end
end
