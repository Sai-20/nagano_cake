class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!


  def new
    @genre = Genre.new
  end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "genre was successfully created."
      redirect_to admin_genres_path
    else
      flash[:alret] = "投稿に失敗しました。"
      @genre = Genre.all
      render "index"#
    end
end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
     @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to admin_genres_path(@genre.id)
    else
      render :index
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end