class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :review, presence: true, length: { maximum: 250 }
  validates :user_id, uniqueness: { scope: :book_id, message: "has already recommended this book" }

end
