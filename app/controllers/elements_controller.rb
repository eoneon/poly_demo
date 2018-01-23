class ElementsController < ApplicationController
  def index
    @elements = Element.all
  end

  def show
    @element = Element.find(params[:id])
  end

  def new
    @element = Element.new #(sub_element_ids: params[:sub_element_ids])
  end

  def edit
    @element = Element.find(params[:id])
  end

  def create
    @element = Element.new(element_params)

    if @element.save
      flash[:notice] = "Element was saved successfully."
      redirect_to @element
    else
      flash.now[:alert] = "Error creating Element. Please try again."
      render :edit
    end
  end

  def update
    @element = Element.find(params[:id])
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
    Element.import(params[:file])
    redirect_to elements_path, notice: 'Element imported.'
  end

  def destroy
    @element = Element.find(params[:id])

    if @element.destroy
      flash[:notice] = "\"#{@element.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the element."
      render :show
    end
  end

  private

  def element_params
    params.require(:element).permit!
  end
end
