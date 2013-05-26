class AnnotationsController < ApplicationController
  before_filter :authenticate

  def new
    @source = Source.find(params[:source_id])
    @annotation = Annotation.new
  end

  def create
    @source = Source.find(params[:source_id])
    @annotation = @source.annotations.new(params[:annotation])
    @annotation.save!
    respond_to do |format|
      format.html { redirect_to @source }
      format.js
    end
  end

  def edit
    @source = Source.find(params[:source_id])
    @annotation = Annotation.find(params[:id])
  end

  def update
    @source = Source.find(params[:source_id])
    @annotation = Annotation.find(params[:id])
    @annotation.update_attributes!(params[:annotation])
    respond_to do |format|
      format.html { redirect_to @source }
      format.js
    end
  end

  def destroy
    @annotation = Annotation.find(params[:id])
    @annotation.destroy
    respond_to do |format|
      format.html { redirect_to sources_url }
      format.js
    end
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
