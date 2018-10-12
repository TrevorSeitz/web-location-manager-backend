class AddLikesToPlace < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :likes, :integer
  end
end
