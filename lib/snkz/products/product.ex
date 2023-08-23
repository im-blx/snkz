defmodule Snkz.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  alias Snkz.InStock.InventoryStock
  alias Snkz.Products.Image

  schema "products" do
    field :title
    field :size, {:array, :string}
    field :description
    has_many :in_stock, InventoryStock
    has_many :images, Image

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :description])
    |> validate_required([:title, :description])
  end
end