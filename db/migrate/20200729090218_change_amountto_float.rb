class ChangeAmounttoFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :amount, :float
  end
end
