defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Rafael",
      email: "rafael@banana.com",
      cpf: "1223231",
      age: 28,
      address: "Rua das Bananeiras"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de peperoni",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("23.1")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Bananeiras",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de atum",
          category: :japonesa,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("64.10"),
      user_cpf: "1223231"
    }
  end
end
