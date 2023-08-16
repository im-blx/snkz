defmodule Snkz.InStock.InventoryStock do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snkz.Products.Product
  alias Snkz.Accounts.User

  schema "in_stock" do
    field :color
    field :size
    field :price, :decimal
    belongs_to :product, Product
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(inventory_stock, attrs) do
    inventory_stock
    |> cast(attrs, [])
    |> validate_required([])
  end
end
