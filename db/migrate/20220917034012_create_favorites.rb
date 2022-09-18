class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.integer :moviedata_id
      t.integer :customers_id

      t.timestamps
    end
  end
end
