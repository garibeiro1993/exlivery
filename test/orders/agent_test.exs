defmodule Exlivery.Orders.AgentTest do
  use ExUnit.Case

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "save/1" do
    test "saves the order" do
      order = build(:order)

      OrderAgent.start_link(%{})
      assert {:ok, _uuid} = OrderAgent.save(order)
    end
  end

  describe "get/1" do
    setup do
      OrderAgent.start_link(%{})

      :ok
    end

    test "when the order is found, returns the Order" do
      {:ok, uuid} =
        :order
        |> build()
        |> OrderAgent.save()

      assert {:ok, %Order{}} = OrderAgent.get(uuid)
    end

    test "when the order is not found, returns an error" do
      assert {:error, "order not found"} = OrderAgent.get("12809218-snjaoishja-218019280")
    end
  end
end
