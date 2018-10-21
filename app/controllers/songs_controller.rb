class SongsController < ApplicationController
  def new
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def index
    @songs = Song.all
  end

  def create
    @song = Song.create(song_params)

    if !@song.errors.any?
      redirect_to @song
    else
      render :new
    end

  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
     @song = Song.find(params[:id])
     @song.update(song_params)

    if !@song.errors.any?
      redirect_to @song
    else
      render :edit
    end
  end

  def destroy
     @song = Song.find(params[:id])
     @song.delete
     redirect_to songs_path
  end


  private 

    def song_params
        params.require(:song).permit(:artist_name, :title, :release_year, :released, :genre)
    end
end
