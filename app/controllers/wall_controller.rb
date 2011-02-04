class WallController < ApplicationController
  respond_to :html

  def index
    respond_with(@links = Link.all)
  end
end
