class TotalRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    (object.total_revenue(scope[:date]) / 100.0 ).to_s
  end
end