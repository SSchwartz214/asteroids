class Api::V1::User::FavoritesController < ApplicationController

  def index
    api_key = ApiKey.find_by_value(params[:api_key])
    #.where(value: params[:api_key]).first
    user = api_key.user
    render json: user.favorites
  end

  def create
    api_key = ApiKey.find_by_value(params[:api_key])
    user = api_key.user

    favorite = user.favorites.create(neo_reference_id: params[:neo_reference_id])
    render json: favorite
  end
end
