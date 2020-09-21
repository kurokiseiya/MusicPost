class MusicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @musics = params[:tag_id].present? ? Tag.find(params[:tag_id]).musics : Music.all
  end

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def create
    @music = Music.new(music_params)
    @music.user_id = current_user.id

    url = params[:music][:youtube_url]
    url = url.last(11)
    @music.youtube_url = url

    if @music.save
      redirect_to music_path(@music), notice: "投稿に成功しました"
    else
      render :new
    end
  end

  def edit
    @music = Music.find(params[:id])
    if @music.user != current_user
      redirect_to music_path, alert: "不正なアクセスです。"
    end
  end

  def update
    @music = Music.find(params[:id])
    if @music.update(music_params)
      redirect_to music_path(@music), notice: "更新に成功しました"
    else
      render :edit
    end
  end

  def destroy
    music = Music.find(params[:id])
    music.destroy
    redirect_to musics_path
  end

  private
  def music_params
    params.require(:music).permit(:title, :singer, :body, :youtube_url, tag_ids: [])
  end
end
