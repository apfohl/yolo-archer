class SourcesController < ApplicationController
  before_filter :authenticate, except: [:index, :show, :up, :down]

  def index
    if params[:query]
      @sources = Source.text_search(params[:query])
    elsif params[:tag]
      @sources = Source.tagged_with(params[:tag]).order('rating DESC').page(params[:page]).per_page(params[:view].nil? ? 10 : 20)
    else
      @sources = Source.order('rating DESC').page(params[:page]).per_page(params[:view].nil? ? 10 : 20)
    end
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
    @source = Source.find(params[:id])
    if session["has_voted_source_#{@source.id}".to_sym] != true
      @source.increment! :rating
      session["has_voted_source_#{@source.id}".to_sym] = true
    end
    respond_to do |format|
      format.js
    end
  end

  def down
    @source = Source.find(params[:id])
    if session["has_voted_source_#{@source.id}".to_sym] != true
      @source.decrement! :rating
      session["has_voted_source_#{@source.id}".to_sym] = true
    end
    respond_to do |format|
      format.js
    end
  end
end
