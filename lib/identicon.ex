defmodule Identicon do
  def main(input) do
    input |>
    hash_input |>
    pick_color
  end

  # can PM multiple args -> def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image, {height, width} = size) do #pick_color({2,3}) where tuple is a second argument
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
