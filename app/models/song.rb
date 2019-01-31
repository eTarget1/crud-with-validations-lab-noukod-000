class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: {
    scope: [:release_year, :artist_name],
    message: "Cannot be repeated by the same artist in the same year"
  }
  validates :released, inclusion: { in: [true, false] }
  validate :release_year_presence
  validates :artist_name, presence: true

  def release_year_presence
    if self.released
      unless self.release_year
        errors.add(:release_year, "Released Song must have a released year.")
      else
        now = Time.new
        if now.year < self.release_year
          errors.add(:release_year, "Release year is in the future.")
        end
      end
    end
  end

  # validates_presence_of :release_year, :if => :released?
  # validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, :if => :released?
  # validates :artist_name, presence: true
end
