class UpdateTypeInMeal < ActiveRecord::Migration[5.2]
  def change
    rename_column :meals, :type, :meal_type
  end
end
