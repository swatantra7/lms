class AddColumnUserNameToBookSanctions < ActiveRecord::Migration[5.2]
  def change
    add_column :book_sanctions, :user_name, :string
  end
end
