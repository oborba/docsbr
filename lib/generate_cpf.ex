defmodule Docsbr.GenerateCpf do
  @moduledoc"""
  Generate valid cpf numbers
  """

  def generate do
    (for _n <- 1..9, do: Enum.random(0..9))
    |> (&(Kernel.++(&1, [calculate_digit(&1, 1)]))).()
    |> (&(Kernel.++(&1, [calculate_digit(&1, 2)]))).()
    |> Enum.join("")
  end

  def calculate_digit(base, digit) do
    position_digit = case digit do
      1 -> 10
      2 -> 11
    end

    base |> first_result(position_digit, 0) |> final_digit
  end

  defp final_digit(digit) do
    result = digit |> rem(11)

    case result do
      result when result < 2 -> 0
      _ -> 11 - result
    end
  end

  def first_result([head | tail], n, result) do
    result = result + head * n
    first_result(tail, n - 1, result)
  end

  def first_result([], _n, result), do: result
end
