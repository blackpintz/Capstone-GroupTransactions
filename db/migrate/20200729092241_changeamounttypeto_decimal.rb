class ChangeamounttypetoDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :transactions, :amount, :decimal, :precision => 10, :scale => 2
  end
end
