class ElementFieldsController < ApplicationController
  def index
    @element_fields = ElementField.all
    respond_to do |format|
      format.html
      format.csv { send_data @element_fields.to_csv }
      format.xls { send_data @element_fields.to_csv(col_sep: "\t") }
    end
  end

  def show
    @element_field = ElementField.find(params[:id])
  end

  def new
    @element_field = ElementField.new
  end

  def edit
    @element_field = ElementField.find(params[:id])
  end

  def create
    @element_field = ElementField.new(element_field_params)

    if @element_field.save
      flash[:notice] = "ElementField was saved successfully."
      #redirect_to @element_field
      render :edit
    else
      flash.now[:alert] = "Error creating ElementField. Please try again."
      render :new
    end
  end

  def update
    @element_field = ElementField.find(params[:id])
    @element_field.assign_attributes(element_field_params)

    if @element_field.save
      flash[:notice] = "element_field was updated successfully."
      redirect_to @element_field
    else
      flash.now[:alert] = "Error updated element_field. Please try again."
      render :edit
    end
  end

  def destroy
    @element_field = ElementField.find(params[:id])

    if @element_field.destroy
      flash[:notice] = "\"#{@element_field.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the element_field."
      render :show
    end
  end

  def import
    ElementField.import(params[:file])
    redirect_to element_fields_path, notice: 'ElementField imported.'
  end

  private

  def element_field_params
    params.require(:element_field).permit!
  end
end
