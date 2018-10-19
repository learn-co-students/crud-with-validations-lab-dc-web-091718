class SongsController < ApplicationController

  before_action :find_song, only: [:edit, :show, :update, :destroy]

  def index
    @songs = Song.all
  end

  def show
  end

  def edit
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)

    if @song.errors.any?
      render :new
    else
      redirect_to song_path(@song)
    end
  end

  def update
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end

  def find_song
    @song = Song.find(params[:id])
  end


end
