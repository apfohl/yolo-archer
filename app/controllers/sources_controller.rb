class SourcesController < ApplicationController
  def index
    @sources = Source.all
  end

  def show
    @source = Source.find(params[:id])
  end

  def new
    @source = Source.new
  end

  def create
    @source = Source.new(params[:source])
    if @source.save
      flash[:notice] = "Successfully created source."
      redirect_to sources_url
    else
      render action: 'new'
    end
  end

  def edit
    @source = Source.find(params[:id])
  end

  def update
    @source = Source.find(params[:id])
    if @source.update_attributes(params[:source])
      flash[:notice] = "Successfully updated source."
      redirect_to @source
    else
      render action: 'edit'
    end
  end

  def destroy
    @source = Source.find(params[:id])
    @source.destroy
    flash[:notice] = "Successfully destroyed source."
    redirect_to sources_url
  end

  def up
    source = Source.find(params[:id])
    source.increment! :rating
    render json: {rating: source.rating}
  end

  def down
    source = Source.find(params[:id])
    source.decrement! :rating
    render json: {rating: source.rating}
  end
end
