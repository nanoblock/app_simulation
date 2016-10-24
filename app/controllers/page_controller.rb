class PageController < ApplicationController
  def preview
    @images = Image.all
  end

  def link
    @images = Image.all
    @image = Image.find(params[:id])
    @image_id = params[:id]
  end
end
