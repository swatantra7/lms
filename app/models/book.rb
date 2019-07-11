class Book < ApplicationRecord

  validates :name, :quantity, presence: true

  validates :quantity, numericality: { only_integer: true }

  has_many :book_sanctions

  belongs_to :user

  def total_quantity
    book_sanctions.sanctioned.sum(:quantity)
  end

end
