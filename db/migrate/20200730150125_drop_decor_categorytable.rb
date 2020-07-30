class DropDecorCategorytable < ActiveRecord::Migration[6.0]
  def change
    drop_table :decor_categories
  end
end
