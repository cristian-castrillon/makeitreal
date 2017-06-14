class InvoicesController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index
    @invoices = Invoice.all
  end

  def new
    @invoice = Invoice.new
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.user = current_user
    if @invoice.save
      redirect_to(invoice_path(@invoice))
    else
      # @errors = @invoice.errors.full_messages
      render :new
    end
  end

  def show
    begin
      @invoice = Invoice.find(params[:id])
    rescue ActiveRecordNotFound
      # 200 :ok
      # 400 :bad_request
      # 404 :not_found
      # render :not_found
      redirect_to(invoices_path)
    end
  end

  def edit
    begin
      @invoice = Invoice.find(params[:id])
    rescue ActiveRecordNotFound
      # 200 :ok
      # 400 :bad_request
      # 404 :not_found
      # render :not_found
      redirect_to(invoices_path)
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    @invoice.total = invoice_params[:total]

    if @invoice.save
      redirect_to(invoice_path(@invoice))
    else
      render :edit
    end
  end

  def destroy
    @invoice = Invoice.destroy(params[:id])
  end

  private

    def invoice_params
      params.require(:invoice).permit(:total, :status, :user_id, :order_id)
    end
end
