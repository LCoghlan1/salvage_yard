class Order < ApplicationRecord
  
  belongs_to :user
  has_many :orderitems, dependent: :delete_all

  def order_params
        params.require(:order).permit( :order_date, :user_id, :status)
  end


end
