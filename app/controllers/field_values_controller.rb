class FieldValuesController < ApplicationController
  def index
    @field_values = FieldValue.all
    respond_to do |format|
      format.html
      format.csv { send_data @field_values.to_csv }
      format.xls { send_data @field_values.to_csv(col_sep: "\t") }
    end
  end

  def show
    @field_value = FieldValue.find(params[:id])
  end

  def new
    @field_value = FieldValue.new
  end

  def edit
    @field_value = FieldValue.find(params[:id])
  end

  def create
    # @field_field = FieldField.find(params[:field_field_id])
    # @field_value = @field_field.field_values.build(field_value_params)
    @field_value = FieldValue.new(field_value_params)

    if @field_value.save
      flash[:notice] = "FieldValue was saved successfully."
      #redirect_to @field_value
      #redirect_to edit_invoice_field_path(@field_value.invoice, @field_value)
    else
      flash.now[:alert] = "Error creating FieldValue. Please try again."
      #render :new
      #redirect_to edit_invoice_field_path(@field_value.invoice, @field_value)
    end
    render :edit
  end

  def update
    @field_value = FieldValue.find(params[:id])
    @field_value.assign_attributes(field_value_params)

    if @field_value.save
      flash[:notice] = "field_value was updated successfully."
      #redirect_to @field_value
      #redirect_to edit_invoice_field_path(@field_value.invoice, @field_value)
    else
      flash.now[:alert] = "Error updated field_value. Please try again."
      #render :edit
      #redirect_to edit_invoice_field_path(@field_value.invoice, @field_value)
    end
    render :edit
  end

  def destroy
    #@field_field = FieldField.find(params[:field_field_id])
    #@field_value = @field_field.field_values.find(params[:id])
    @field_value = FieldValue.find(params[:id])

    if @field_value.destroy
      flash[:notice] = "\"#{@field_value.name}\" was deleted successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the field_value."
      render :show
    end
  end

  def import
    FieldValue.import(params[:file])
    redirect_to field_values_path, notice: 'FieldValue imported.'
  end

  private

  def field_value_params
    params.require(:field_value).permit!
  end
end
