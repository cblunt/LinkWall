class CommentsController < ApplicationController
  before_filter :fetch_link
  respond_to :html

  def new
    respond_with(@comment = @link.comments.new)
  end

  def create
    @comment = @link.comments.new(params[:comment])
    @comment.user = current_user

    flash[:notice] = 'Comment added' if @comment.save
    respond_with(@comment, :location => link_url(@link))
  end

protected
  def fetch_link
    @link = Link.criteria.id(params[:link_id]).first
    redirect_to root_url, :alert => 'Could not find link' if @link.nil?
  end
end
