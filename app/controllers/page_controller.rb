class PageController < ApplicationController
  def preview
    @images = Image.all
    unless (params[:id]).nil?
      @image = Image.find(params[:id])
    else
      @image = @images.first
    end
  end

  def link
    @images = Image.all
    unless (params[:id]).nil?
      @image = Image.find(params[:id])
    else
      @image = @images.first
    end
    @image_id = @image.id
  end
end
