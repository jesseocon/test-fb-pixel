class PurchasesController < ApplicationController
  def index
  end

  def create
    @purchase = Purchase.create(price: 9000)
    
    if @purchase
      head :ok
    else
      render nothing: true, status: 500
    end
  end
end