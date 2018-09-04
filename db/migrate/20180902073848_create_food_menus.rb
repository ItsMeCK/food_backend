class CreateFoodMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :food_menus do |t|
      t.date :serve_date
      t.integer :food_id
      t.string :menu_type 
      t.timestamps
    end
  end
end
