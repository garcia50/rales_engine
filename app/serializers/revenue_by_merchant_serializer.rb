class RevenueByMerchantSerializer < ActiveModel::Serializer
  attributes :revenue

  def revenue
    (object.total_revenue(scope[:date]) / 100.0 ).to_s
  end
end
