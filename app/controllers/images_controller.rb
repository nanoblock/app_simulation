class ImagesController < ApplicationController

  def create
    @image = Project.find(params[:project_id]).images.build(image_params)

    if @image.save
      render status: 200, json: @image, nothing: true
    else
      render action: 'new'
    end

    # if params[:images].nil?
    #   @image = Image.new(image_params)
    #   if @image.save
    #     render status: 200, json: @image, nothing: true
    #   else
    #     render action: "new"
    #   end
    # else
    #   @images = []
    #   params[:images].each { |photo|
    #     image = Image.create(photo: photo)
    #     unless image
    #       render status: 400, nothing: true
    #       return
    #     else
    #       @images << image
    #     end
    #   }
    #   render status: 200, nothing: true
    # end
    
  end

  def new
    @image = Project.find(params[:project_id]).images.build(image_params)
    # @image = Image.new
  end

  def index
    @images = Project.find(params[:project_id]).images.all
    if @images.empty?
      # render status:400, nothing: true
    else
      # render status:200, nothing: true
    end
  end

  def destroy
    @image = Image.find(params[:id])
    puts params[:id]

    @image.destroy
    render nothing: true
  end

  private
  def image_params
    params.require(:image).permit(:photo)
  end

end
