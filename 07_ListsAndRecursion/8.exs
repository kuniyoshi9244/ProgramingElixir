defmodule Orders do
  def get_orders_with_total_amount(orders, tax_rates) do
    Enum.map(orders, fn order -> order ++ get_total_amount(order, tax_rates) end)
  end

  defp get_total_amount(order, tax_rates) do
    [ total_amount: Keyword.get(order, :net_amount) * get_tax_rate(order, tax_rates) ]
  end

  defp get_tax_rate(order, tax_rates) do
    ship_to = Keyword.get(order, :ship_to)
    Keyword.get(tax_rates, ship_to, 1.0)
  end
end

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount: 35.50 ],
  [ id: 125, ship_to: :TX, net_amount: 24.00 ],
  [ id: 126, ship_to: :TX, net_amount: 44.00 ],
  [ id: 127, ship_to: :NC, net_amount: 25.00 ],
  [ id: 128, ship_to: :MA, net_amount: 10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount: 50.00 ]
]

tax_rates = [ NC: 0.075, TX: 0.88 ]

Orders.get_orders_with_total_amount(orders, tax_rates) |> IO.inspect
