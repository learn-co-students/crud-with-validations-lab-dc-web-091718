require 'pry'
# class MyValidator < ActiveModel::Validator
#   def validate(song)
#     if song.released == false
#
#       validate :release_year, presence: false
#
#     else
#
#       validate :release_year, presence: true
#     end
#   end
# end

class Song < ActiveRecord::Base
  # include ActiveModel::Validations
  # validates_with MyValidator

  validates :released, inclusion: {in:[true, false]}
  validates :artist_name, presence: true
  validate :release_year, :validate_release_year
  # validates :title, uniqueness: { scope: :year,
  #   message: "should happen once per year" }
  validates_uniqueness_of :title, :scopes => [:year, :artist], presence: true
  validates_presence_of :title

  def validate_release_year
    # Paul's example from class
    # if !(self.year_established > 1800 && self.year_established <= Date.today.year)
    #   errors.add(:year_established, "must be between 1800 and #{Date.today.year}")

    if (self.released == true && release_year == nil)
      errors.add(:release_year, "you must enter a year")
    elsif (self.released == true && release_year > Date.today.year)
      errors.add(:release_year, "cannot put a year in the future")
    end

  end

  # def validates_title
  #     if !(self.title != nil)
  #       errors.add(:title,"You cant use the same title twice in a year")
  #     elsif (self.year.uniq)
  #       errors.add(:title, "You cant have the same title for an artist in that same year")
  #     end
  # end
end
