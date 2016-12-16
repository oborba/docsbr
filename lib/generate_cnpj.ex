defmodule Docsbr.GenerateCnpj do
  @moduledoc"""
  Generate valid cnpj numbers
  """

  def generate do
    first_part = Enum.reduce_while(0..3, [], fn(i, result) -> if i < 4, do: {:cont, result ++ [Enum.random(0..9)]} end)
    second_part = Enum.reduce_while(0..7, [], fn(i, result) -> if i < 9, do: {:cont, result ++ [Enum.random(0..9)]} end)

    sums = first_result(first_part, 5, 0) + first_result(second_part, 9, 0)

    second_part = Enum.concat(second_part, [final_digit(sums)])

    first_part = first_part ++ [hd(second_part)]
    second_part = second_part |> tl

    sums = first_result(first_part, 6, 0) + first_result(second_part, 9, 0)

    Enum.concat(first_part, second_part)
    |> Enum.concat([final_digit(sums)])
    |> Enum.join("")
  end

  def final_digit(digit) do
    digit = digit |> rem(11)

    case digit do
      digit when digit < 2 -> 0
      _ -> 11 - digit
    end
  end

  defp first_result([head | tail], n, result) do
    result = result + head * n
    first_result(tail, n - 1, result)
  end
  defp first_result([], _n, result), do: result
end
