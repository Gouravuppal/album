class AlbumsController < ApplicationController
  def index
    @albums=current_author.albums.paginate(:page => params[:page], :per_page =>4)
  end
  def new
    @album=Album.new
  end
  def show
    @album = Album.find(params[:id])
    end

  def create
    @album = Album.new(album_params)
    if @album.save 
    redirect_to @album
    else
      render 'new'
    end
end
  
  def destroy
      @album=Album.find(params[:id])
      @album.destroy
      redirect_to albums_path
    
  end

private
  def album_params
    params.require(:album).permit(:name,:author_id)
  end
  
  
end
