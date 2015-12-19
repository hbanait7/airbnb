class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.float :rating
      t.integer :price

      t.timestamps null: false
    end
  end
end
