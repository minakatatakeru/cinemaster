class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.integer :moviedata_id
      t.text :movie_content
      t.string :star
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
