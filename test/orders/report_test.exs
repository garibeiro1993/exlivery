defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      expected_response =
        "1223231,pizza,1,23.1japonesa,2,20.50,64.10\n" <>
          "1223231,pizza,1,23.1japonesa,2,20.50,64.10\n"

      assert expected_response == response
    end
  end
end
