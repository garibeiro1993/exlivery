defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "When all params are valid, saves the user" do
      params = %{
        name: "Gabriel",
        address: "Rua das Bananeiras",
        email: "email@email.com",
        cpf: "11111111",
        age: 28
      }

      assert {:ok, "User created or updated successfully"} = CreateOrUpdate.call(params)
    end

    test "When there are invalid params, returns an error" do
      params = %{
        name: "Gabriel",
        address: "Rua das Bananeiras",
        email: "email@email.com",
        cpf: "11111111",
        age: 2
      }

      assert {:error, "Invalid parameters"} = CreateOrUpdate.call(params)
    end
  end
end
