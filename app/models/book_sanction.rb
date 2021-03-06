class BookSanction < ApplicationRecord

  include AASM

  validates :user_id, :quantity, :user_name,:book_id, :start_date, :end_date, :status, presence: true

  validate :check_book_quantity, :check_start_and_end_date

  belongs_to :user
  belongs_to :book

  delegate :name, to: :book, prefix: true, allow_nil: true
  delegate :quantity, to: :book, prefix: true, allow_nil: true


  aasm column: :status, whiny_transitions: false do

    state :sanctioned, initial: true
    state :cancelled

    event :cancel, after: :recalculate_remaining_quantity do
      transitions from: :sanctioned, to: :cancelled
    end

  end

  after_save :calculate_remaining_quantity

  def can_cancel?
    self.sanctioned? && self.start_date > Date.today
  end

  private

  def recalculate_remaining_quantity
    book.quantity = book.quantity + quantity
    book.save
  end

  def calculate_remaining_quantity
    book.quantity = book.quantity - quantity
    book.save
  end

  def check_book_quantity
    if book_quantity.present? && self.quantity
      unless book_quantity >= self.quantity
        errors.add(:quantity, 'Book Quanity In Stock is Less than Issued Quanity')
      end
    end
  end

  def check_start_and_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:start_date, 'Start Date Cannot Be Greater than EndDate')
    end
  end

end
