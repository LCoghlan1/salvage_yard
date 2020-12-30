class StaticPagesController < ApplicationController

  def home
    @categories = Category.all
  end

  def help
  end

  def about
  end
  
  def aboutSend
   @order = Order.find(params[:id])
   @order.update_attribute(:status, "Paid with Paypal")
  end
  
  def category
    catName = params[:title]
    @items = Item.where("category like ? ", catName)
  end
  
end
