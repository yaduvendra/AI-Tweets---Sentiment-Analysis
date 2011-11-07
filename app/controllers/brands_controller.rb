class BrandsController < ApplicationController
  def index
    @brands = Brand.all
    # TODO: only pull actives? 
    # @brands = Brand.where(:active => true)
  end

  def show
    @brand = Brand.find(params[:id])
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(params[:brand])
    if @brand.save
      response = { :status => 'success', :message => 'Brand added' }
    else
      response = { :status => 'error', :message => make_error(@brand) }
    end

    respond_to do |format|
      format.html { redirect_to brands_path, flash[:notice] => response }
      format.js { render :json => response }
    end
  end

  def edit
    @brand = Brand.find(params[:id])
  end

  def update
    @brand = Brand.find(params[:id])
    if @brand.update_attributes(params[:brand])
      response = { :status => 'success', :message => 'Brand updated' }
    else
      response = { :status => 'error', :message => make_error(@brand) }
    end

    respond_to do |format|
      format.html { redirect_to brands_path, flash[:notice] => response }
      format.js { render :json => response }
    end
  end

  def destroy
    @brand = Brand.find(params[:id])
    @brand.destroy
    # TODO: cleanup tweets or something
    redirect_to brands_path
  end

end
