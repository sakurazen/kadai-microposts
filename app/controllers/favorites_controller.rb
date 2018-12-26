class FavoritesController < ApplicationController
  before_action :require_user_logged_in
  def create
    user = current_user
    fav_micropost = Micropost.find(params[:micropost_id])
    if Favorite.create(user_id: user.id, micropost_id:fav_micropost.id)
      redirect_back(fallback_location: root_path)
      # redirect_to root_url
      flash[:success] = 'お気に入りに登録しました。'
    else
      redirect_to root_url
    end
  end

  def destroy
    user = current_user
    fav_micropost = Micropost.find(params[:micropost_id])
    if favorite = Favorite.find_by(user_id: user.id, micropost_id:fav_micropost.id)
      favorite.delete
      redirect_back(fallback_location: root_path)
      flash[:success] = 'お気に入りを解除しました。'
    else
      redirect_to root_url
    end
  end
end
