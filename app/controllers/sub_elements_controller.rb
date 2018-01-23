class SubElementsController < ApplicationController
  def index
    @sub_elements = SubElement.all
  end

  def show
    @sub_element = SubElement.find(params[:id])
  end

  def new
    @sub_element = SubElement.new
  end

  def edit
    @sub_element = SubElement.find(params[:id])
  end

  def create
    @sub_element = SubElement.new(sub_element_params)

    if @sub_element.save
      flash[:notice] = "SubElement was saved successfully."
      redirect_to @sub_element
    else
      flash.now[:alert] = "Error creating SubElement. Please try again."
      render :new
    end
  end

  def update
    @sub_element = SubElement.find(params[:id])
    @sub_element.assign_attributes(sub_element_params)

    if @sub_element.save
      flash[:notice] = "sub_element was updated successfully."
      redirect_to @sub_element
    else
      flash.now[:alert] = "Error updated sub_element. Please try again."
      render :edit
    end
  end

  def destroy
    @sub_element = SubElement.find(params[:id])

    if @sub_element.destroy
      flash[:notice] = "\"#{@sub_element.sub_element}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the sub_element."
      render :show
    end
  end

  def import
    SubElement.import(params[:file])
    redirect_to sub_elements_path, notice: 'Subelements imported.'
  end

  private

  def sub_element_params
    params.require(:sub_element).permit!
  end
end
