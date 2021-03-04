defmodule Docsbr.GenerateCpf do
  def generate do
    base_cpf()
    |> verification_digit
    |> verification_digit
    |> Enum.join()
  end

  defp base_cpf do
    0..8
    |> Enum.map(fn _x -> Enum.random(0..9) end)
  end

  def verification_digit(base) when is_binary(base) do
    base |> String.graphemes() |> Enum.map(fn x -> String.to_integer(x) end) |> verification_digit
  end

  def verification_digit(base) do
    digit =
      base
      |> Enum.count()
      |> case do
        9 -> 10..2
        10 -> 11..2
      end
      |> Enum.map(fn x -> x end)
      |> multiply_by_index(base, 0)

    Enum.concat(base, digit)
  end

  defp multiply_by_index([h1 | t1], [h2 | t2], acc) do
    result = h1 * h2 + acc

    multiply_by_index(t1, t2, result)
  end

  defp multiply_by_index([], [], acc) do
    format_digit(rem(acc * 10, 11))
  end

  defp format_digit(digit) when digit != 10, do: [digit]
  defp format_digit(10), do: [0]
end
