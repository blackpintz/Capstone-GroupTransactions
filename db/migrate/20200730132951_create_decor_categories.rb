class CreateDecorCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :decor_categories do |t|
      t.references :decor, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
