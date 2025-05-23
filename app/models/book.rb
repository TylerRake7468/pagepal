class Book < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :title, :author, :description, presence: true
  has_many :recommendations, dependent: :destroy

end
