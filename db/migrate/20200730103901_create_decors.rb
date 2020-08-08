class CreateDecors < ActiveRecord::Migration[6.0]
  def change
    create_table :decors do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.string :name
      t.timestamps
    end
  end
end
