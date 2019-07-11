class Book < ApplicationRecord

  validates :name, :quantity, presence: true

  validates :quantity, numericality: { only_integer: true }

  has_many :book_sanctions

  belongs_to :user

  scope :sanctionable, -> { where("quantity > ?", 0) }

  def total_quantity
    quantity + book_sanctions.sanctioned.sum(:quantity)
  end

end
