class Institution < ApplicationRecord
  validates_presence_of :name
  has_many :periods

  def school_rate
    rating = self.rating
    if rating >= 5
      "Excellent"
    elsif rating > 3
      "Good"
    else
      "Poor"
    end
  end

  def self.by_name
    order(:name)
  end

  def self.by_rating
    order(:rating)
  end

end
