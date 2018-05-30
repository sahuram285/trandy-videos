class VideosController < ApplicationController
  before_action :check_user, only: [:edit, :new, :create, :destroy]
  before_action :set_video, only: [:show, :edit, :update, :destroy]
  after_action :set_views, only: [:show]

  def index
    @videos = Video.all
  end

  def show;end

  def new
    @video = current_user.videos.new
  end

  def edit;end

  def create
    @video = current_user.videos.new(video_params)

    if @video.save
      redirect_to @video, notice: 'Video was successfully created.'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to @video, notice: 'Video was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_url, notice: 'Video was successfully destroyed.'
  end

  def my_videos
    @videos = current_user.videos
  end

  private
    def check_user
      return true if user_signed_in?
      redirect_to root_path, notice: 'Signup or login to access the page!'
    end

    def set_video
      @video = Video.find(params[:id])
    end

    def set_views
      @video.views += 1
      @video.save
    end

    def video_params
      params.require(:video).permit(:name, :description, :file)
    end
end
