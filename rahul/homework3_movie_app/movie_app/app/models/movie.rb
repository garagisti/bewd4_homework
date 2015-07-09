class Movie < ActiveRecord::Base
  validates_presence_of :title,
                        :description,
                        :year_released
  validates :year_released, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1800 }

  def self.search(query)
    where('title LIKE ?', "%#{query}%")
  end
end
