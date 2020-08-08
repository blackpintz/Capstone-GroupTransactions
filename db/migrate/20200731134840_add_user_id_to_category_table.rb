class AddUserIdToCategoryTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :user
  end
end
