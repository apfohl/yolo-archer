class AnnotationsController < ApplicationController
  def new
    @annotation = Annotation.new
  end

  def create
    @annotation = Annotation.new(params[:annotation])
    if @annotation.save
      flash[:notice] = "Successfully created annotation."
      redirect_to @annotation
    else
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
end
