class Article < ApplicationRecord 
  belongs_to :user
  validates :title, presence: true, length: {minimum: 5, maximum: 110}
  validates :description, presence: true, length: {minimum: 5, maximum: 110}
end