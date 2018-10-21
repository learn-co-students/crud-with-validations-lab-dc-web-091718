class Song < ActiveRecord::Base

	validates :title, presence: true, uniqueness: true
	validates :artist_name, presence: true
	validate :is_valid_released?



	def is_valid_released?
		if released && release_year
			if !(release_year > 1900 && release_year < 2018)
				errors.add(:released, "cannot be set in the future or before 1900")
			end
		else
			if(released)
			errors.add(:released, "cannot be true without a released year")
		end
		end
	end


end
