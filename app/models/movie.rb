class Movie < ApplicationRecord
  # attr_reader :title

  has_many :bookmarks
  validates :title, uniqueness: true
  validates :overview, :title, presence: true

  # TITLES = Movie.all.map do |m| m.select { |k, id| k == :title }
end
