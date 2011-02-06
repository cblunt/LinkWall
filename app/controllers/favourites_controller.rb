class FavouritesController < ApplicationController
  respond_to :html

  def create
    link = Link.criteria.id(params[:link_id]).first

    if link
      favourite = current_user.favourites.new(:link_id => params[:link_id])
      
      flash[:notice] = 'Link marked as favourite' if favourite.save
      redirect_to link
    else
      redirect_to root_url, :alert => 'Could not find link'
    end
  end

  def destroy
    favourites = current_user.favourites.where(:link_id => params[:link_id]).destroy_all
    redirect_to link_url(:id => params[:link_id])
  end
end
