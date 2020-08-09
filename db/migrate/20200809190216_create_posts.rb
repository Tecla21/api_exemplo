class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :detalhe
      t.integer :number_of_view, default: 0
      t.integer :status, default: 0
      t.references :category, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
