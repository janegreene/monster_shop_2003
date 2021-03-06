class Merchant::ItemOrdersController < Merchant::BaseController
  def update
    item_order = ItemOrder.find(params[:id])
    item = Item.find(params[:item_id])
    order = Order.find(item_order.order_id)
      item.update_attribute(:inventory, item.inventory - item_order.quantity)
      item_order.update_attribute(:status, "fulfilled")
      flash[:success] = "You have fulfilled #{item.name}"
      order.packaged_check
    redirect_to "/merchant/orders/#{item_order.order_id}"
  end
end
