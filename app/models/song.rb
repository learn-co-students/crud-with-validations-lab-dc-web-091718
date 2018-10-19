class Song < ActiveRecord::Base
  validates :title, presence: true
  validate :repeated_title


  #title cant be repeated by the same artist in the same year
  validates :released, inclusion: {in: [true, false]}
  validates :release_year, presence: true,
    unless: Proc.new {|attribute| attribute.released == false}
  validate :release_year_must_be_valid,
    unless: Proc.new {|attribute| attribute.release_year.blank? }

  #release_year is optional if released is false
  #release_year must not be blank if released is true
  #release_year must be less than or equal to the current year
  validates :artist_name, presence: true

  def release_year_must_be_valid
    if self.release_year > Date.today.year
      errors.add(:release_year, "must be before #{Date.today.year}")
    end
  end


  def repeated_title
    if !(self.artist_name.blank?)
      artist_songs = Song.where("artist_name = ?", self.artist_name)
      repeats = artist_songs.select do |song|
        song.artist_name == self.artist_name && song.release_year == self.release_year && song.title == self.title
      end

      if repeats.length > 0
        errors.add(:title, "an artist cannot release the same song twice in one year")
      end
    end
  end



end
