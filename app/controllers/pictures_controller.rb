class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.page(params[:page]).per(10).order('id DESC')
    #binding.pry
  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
    else
      @picture = Picture.new
    end
  end

  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "Pictureを登録しました！"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "Pictureを更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "Pictureを削除しました！"
  end

  def confirm
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    render :new if @picture.invalid?
  end

  private
    def pictures_params
      params.require(:picture).permit(:comment, :image, :image_cache, :remove_image, :id)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
