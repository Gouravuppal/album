class PicturesController < ApplicationController
  def index
    @album=Album.find(params[:album_id])
    @picture=@album.pictures.all

  end
  def new
     @album = Album.find(params[:album_id])
  end

  
  def show 
    @album=Album.find(params[:album_id])
    @picture=@album.pictures.find(params[:id])
  end
  
  def edit 
    @album=Album.find(params[:album_id])
    @picture=@album.pictures.find(params[:id])
  end
  
  def create
    @album=Album.find(params[:album_id])
    @picture=@album.pictures.create(picture_params)
    redirect_to album_path(@album)
  end
   def update
     @album=Album.find(params[:album_id])
    @picture=@album.pictures.find(params[:id])
    if @picture.update(picture_params)
      redirect_to album_path(@album)
    else
      render 'edit'
    end
  end

  def destroy
    @album = Album.find(params[:album_id])
    @picture = @album.pictures.find(params[:id])
    @picture.destroy
    redirect_to album_path(@album)
  end
  
  private
    def picture_params
      params.require(:picture).permit(:name,:image)
    end
end
