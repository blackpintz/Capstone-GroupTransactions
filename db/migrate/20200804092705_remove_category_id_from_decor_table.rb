class RemoveCategoryIdFromDecorTable < ActiveRecord::Migration[6.0]
  def change
    remove_reference :decors, :category
  end
end
