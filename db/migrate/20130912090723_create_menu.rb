class CreateMenu < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :name, :null => false
      t.text :description
      t.datetime :start_at, :null => false
      t.datetime :end_at
    end
  end
end
