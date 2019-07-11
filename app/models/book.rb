class Book < ApplicationRecord

  belongs_to :user

  validates :name, :quantity, presence: true

  validates :quantity, numericality: { only_integer: true }

end
