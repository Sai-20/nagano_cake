class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    @order = @order_detail.order
    # chenge_statusの関数を読み込む
    change_status(@order_detail, @order)

    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_details_params
    params.require(:order_detail).permit(:production_status)
  end
    #status処理
  def change_status(order_detail,order)
    #制作ステータスが制作中になったら発注も変わる
    #制作ステータスが制作中であるかを確認
    if order_detail.production_status == 'under_construction'
      #注文ステータスを制作中に更新
       order.update(status:  'under_construction')
    end
    #一つの注文情報を一つずつ取り出す
    order.order_details.each do |order_detail|
      #制作ステータスが制作完了かを確認
      if order_detail.production_status != 'production_completed'
        #制作ステータスが一つでも制作完了ではなければ、関数（change_status）から抜ける
         return
      end
    end
    #注文ステータスを発送準備中に更新
    order.update(status: 'preparing_to_ship')

  end

end
