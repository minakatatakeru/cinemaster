class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.references :customer, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :moviedata_id

      t.timestamps
    end
  end
end
