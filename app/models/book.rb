class Book < ApplicationRecord
  has_many :borrows

  def available?
    Borrow.where(book_id: self.id, ended_at: nil).empty?
  end
end
