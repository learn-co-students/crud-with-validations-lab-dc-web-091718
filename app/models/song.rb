class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :release_year}
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  #optional if released if false
  #must not be blank if released is true
  with_options if: :released do |s|
    s.validates :release_year, presence: true
    s.validates :release_year, numericality: { only_integer: true,
    less_than_or_equal_to: Date.current.year}
    #https://stackoverflow.com/questions/35227759/current-year-in-ruby-on-rails
  end

end
