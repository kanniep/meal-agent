class ChangeNameToNotNullInShops < ActiveRecord::Migration[5.2]
  def change
    change_column :shops, :name, :string, null: false
    change_column :meals, :name, :string, null: false
    add_column :meals, :price, :float, null: false, default: 0
  end
end
