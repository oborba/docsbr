defmodule Docsbr.GenerateCpf do
  @moduledoc"""
  Generate valid cpf numbers
  """

  def generate do
    cpf = Enum.reduce_while(0..8, [], fn i, result -> if i < 9, do: {:cont, result = result ++ [Enum.random(0..9)]}, else: {:halt, result = result ++ [Enum.random(0..9)]} end)

    cpf = cpf ++ [calculate_digit(cpf, 1)]
    cpf = cpf ++ [calculate_digit(cpf, 2)]

    cpf |> Enum.join("")
  end

  def calculate_digit(base, digit) do
    position_digit = 0

    case digit do
      1 -> position_digit = 10
      2 -> position_digit = 11
    end

    base |> first_result(position_digit, 0) |> final_digit
  end

  defp final_digit(digit) do
    digit = digit |> rem(11)

    case digit do
      digit when digit < 2 -> 0
      _ -> 11 - digit
    end
  end

  def first_result([head | tail], n, result) do
    result = result + head * n
    first_result(tail, n - 1, result)
  end

  def first_result([], n, result) do
    result
  end
end
