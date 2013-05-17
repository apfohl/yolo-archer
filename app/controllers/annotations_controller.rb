class AnnotationsController < ApplicationController
  def new
    @source = Source.find(params[:source_id])
    @annotation = Annotation.new
  end

  def create
    @source = Source.find(params[:source_id])
    @annotation = @source.annotations.new(params[:annotation])
    if @annotation.save
      flash[:notice] = "Successfully created annotation."
      redirect_to @source
    else
      flash[:alert] = "Failed."
      render action: 'new'
    end
  end

  def edit
    @annotation = Annotation.find(params[:id])
  end

  def update
    @annotation = Annotation.find(params[:id])
    if @annotation.update_attributes(params[:annotation])
      flash[:notice] = "Successfully updated annotation."
      redirect_to @annotation
    else
      render action: 'edit'
    end
  end

  def destroy
    @annotation = Annotation.find(params[:id])
    @annotation.destroy
    flash[:notice] = "Successfully destroyed annotation."
    redirect_to sources_url
  end

  def up
    annotation = Annotation.find(params[:id])
    annotation.increment! :rating
    render json: {rating: annotation.rating}
  end

  def down
    annotation = Annotation.find(params[:id])
    annotation.decrement! :rating
    render json: {rating: annotation.rating}
  end
end
