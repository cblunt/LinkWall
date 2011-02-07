class LinksController < ApplicationController
  before_filter :fetch_link, :only => [:show, :destroy]
  respond_to :html

  def index
    @links = current_user.links.all
    @comments = current_user.comments
    @favourites = current_user.favourites.links

    respond_with(@links)
  end

  def show
    @comments = @link.comments.desc(:created_at)

    respond_with(@link)
  end

  def new
    respond_with(@link = Link.new)
  end

  def create
    @link = current_user.links.new(params[:link])

    flash[:notice] = 'Link added' if @link.save
    respond_with(@link, :location => links_url)
  end

  def destroy
    flash[:notice] = 'Link deleted' if @link.destroy
    respond_with(@link.destroy, :location => links_url)
  end

protected
  def fetch_link
    @link = Link.criteria.id(params[:id]).first
    redirect_to links_url, :notice => 'Link deleted' and return if @link.nil?
  end
end
