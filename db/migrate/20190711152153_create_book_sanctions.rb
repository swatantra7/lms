class CreateBookSanctions < ActiveRecord::Migration[5.2]
  def change
    create_table :book_sanctions do |t|
      t.integer :book_id
      t.integer :user_id
      t.integer :quantity
      t.string :status
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
    add_index :book_sanctions, :book_id
    add_index :book_sanctions, :user_id
  end
end
