class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :moviedata_id
      t.timestamps
    end
  end
end
