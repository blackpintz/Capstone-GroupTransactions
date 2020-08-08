class AddCatagoryIdToDecorTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :decors, :category
  end
end
