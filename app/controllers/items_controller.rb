class ItemsController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Product.search(keyword: params[:keyword])
    end
  end

  def create
    current_user.items.create!(name: params[:name], genre: params[:genre], image: params[:image])
    redirect_to user_path(current_user)
  end
end
