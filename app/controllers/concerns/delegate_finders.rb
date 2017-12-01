module DelegateFinders
  def delegate_single_finder(model, params, valid_params)
    if params["unit_price"]
      model.find_by(unit_price: (params["unit_price"].to_f * 100).round(2))
    else
      model.find_by(valid_params)
    end
  end

  def delegate_multiple_finder(model, params, valid_params)
    if params["unit_price"]
      model.where(unit_price: (params["unit_price"].to_f * 100).round(2))
    else
      model.where(valid_params)
    end
  end
end