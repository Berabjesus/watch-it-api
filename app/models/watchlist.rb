class Watchlist < ApplicationRecord
  belongs_to :user
  validates :title, :link, :content, :date, presence: true
  validates :title, length: { minimum: 2, maximum: 30 }
  validates :content, length: { minimum: 2, maximum: 300 }
end
