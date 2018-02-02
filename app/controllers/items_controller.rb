class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    #@invoice = Invoice.find(params[:invoice_id])
    @item = Item.new(itemizable_id: params[:itemizable_id])
  end

  def create
    #@invoice = Invoice.find(params[:invoice_id])
    #@item = @invoice.items.build(item_params)
    #@new_item = Item.new 
    @item = Item.new(item_params)

    if @item.save

      flash[:notice] = "Item was saved successfully."
      # if params[:redirect_location] == ':edit'
      #   render :edit
      # else
      #   redirect_to @item.invoice
      # end
    else
      flash.now[:alert] = "Error creating item. Please try again."
      # render :edit
    end
    render :edit
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.assign_attributes(item_params)

    if @item.save
      flash[:notice] = "Item was updated successfully."
    else
      flash.now[:alert] = "Error updated item. Please try again."
    end
    #redirect_to edit_invoice_item_path(@item.invoice, @item)
    render :edit
  end

  def destroy
    #@invoice = Invoice.find(params[:invoice_id])
    #@item = @invoice.items.find(params[:id])
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end
    #redirect_to @item.invoice
    redirect_to :index
  end

  # def import
  #   Item.import(params[:file])
  #   redirect_to items_path
  #   flash[:notice] = "Items successfully imported."
  # end
  #
  # def create_skus
  #   @item = Item.find(params[:id])
  #   if params[:sku_range].blank?
  #     redirect_to invoice_item_path(@item.invoice, @item)
  #     flash[:alert] = "Sku range can't be blank."
  #   else
  #     if invalid_sku_range_msg.present?
  #       redirect_to invoice_item_path(@item.invoice, @item)
  #       flash[:alert] = "#{invalid_sku_range_msg}"
  #     else
  #       new_skus
  #       #@first_sku = Item.where(sku: sku_arr[0])
  #       flash[:notice] = "Skus successfully created."
  #       redirect_to edit_invoice_item_path(@item.invoice, @item)
  #       #redirect_to @item.invoice
  #     end
  #   end
  # end

  private

  def item_params
    params.require(:item).permit!
  end
end
