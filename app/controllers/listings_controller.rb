class ListingsController < ApplicationController

  before_filter :load_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end

  def show

  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      flash[:notice] = 'Listing Successfully Created!'
      redirect_to @listing
    else
      flash.now[:alert] = 'Invalid Listing!'
      render 'new'
    end
  end

  def edit

  end

  def update
    @listing = Listing.update_attributes(listing_params)
    if @listing.save
      flash[:notice] = 'Listing Successfully Updated!'
      redirect_to @listing
    else
      flash.now[:alert] = 'Invalid Listing!'
      render 'edit'
    end    
  end

  def destroy
    @listing.destroy
    flash[:notice] = 'Listing Successfully Deleted!'
    redirect_to root_path
  end


  private

  def load_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:title, :description, :price)
  end

end
