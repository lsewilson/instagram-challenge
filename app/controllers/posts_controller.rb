class PostsController < ApplicationController

  def index
     flash[:notice] = 'No posts added'
  end
end
