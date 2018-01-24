class ElementsController < ApplicationController
  def index
    @elements = element_type.all
  end

  def show
    @element = element_type.find(params[:id])
  end

  def new
    @element = element_type.new #(sub_element_ids: params[:sub_element_ids])
  end

  def edit
    @element = element_type.find(params[:id])
  end

  def create
    @element = element_type.new(element_params)

    if @element.save
      flash[:notice] = "element_type was saved successfully."
      redirect_to @element
    else
      flash.now[:alert] = "Error creating element_type. Please try again."
      render :edit
    end
  end

  def update
    @element = element_type.find(params[:id])
    @element.assign_attributes(element_params)

    if @element.save
      flash[:notice] = "element was updated successfully."
      render :edit
    else
      flash.now[:alert] = "Error updated element. Please try again."
      render :edit
    end
  end

  def import
    element_type.import(params[:file])
    redirect_to elements_path, notice: 'element_type imported.'
  end

  def destroy
    @element = element_type.find(params[:id])

    if @element.destroy
      flash[:notice] = "\"#{@element.name}\" was deleted successfully"
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the element."
      render :show
    end
  end

  private

  def element_types
    ["EditionType", "MediumType"]
  end

  def element_type
    params[:type].constantize if params[:type].in? element_types
  end

  def element_params
    params.require(:element).permit!
  end
end
