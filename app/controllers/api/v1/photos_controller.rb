class Api::V1::PhotosController < ApiController
  before_action :set_photo, except: [:index, :create]
  def index
    @photos = Photo.all
  end

  def show
    if !@photo
      render json: {
        message: "Can't find the photo!",
        status: 400
      }
    # rails will find the template automacically.
    # else
    #   render "api/v1/photos/show"
    end
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: {
        message: "Photo created successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  def update
    if @photo.update(photo_params)
      render json: {
        message: "Photo updated successfully!",
        result: @photo
      }
    else
      render json: {
        errors: @photo.errors
      }
    end
  end

  def destroy
    @photo.destroy
    render json: {
      message: "Photo destroy successfully!"
    }
  end

  private

  def photo_params
    params.permit(:title, :date, :description, :file_location)
  end

  def set_photo
    @photo = Photo.find_by(id: params[:id])
  end
end
