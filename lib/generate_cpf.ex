defmodule Docsbr.GenerateCpf do
  def generate_cpf do
    cpf = Enum.reduce_while(0..8, [], fn i, result -> if i < 9, do: {:cont, result = result ++ [Enum.random(0..9)]}, else: {:halt, result = result ++ [Enum.random(0..9)]} end)

    cpf = cpf ++ [calculate_digit(cpf, 1)]
    cpf = cpf ++ [calculate_digit(cpf, 2)]
    Enum.join(cpf, "")
  end

  def calculate_digit(base, digit) do
    position_digit = 0

    case digit do
      1 -> position_digit = 10
      2 -> position_digit = 11
    end

    remaining = base |> first_result(position_digit, 0) |> rem 11

    case remaining do
      remaining when remaining < 2 -> 0
      _ -> 11 - remaining
    end
  end

  def first_result([head | tail], n, res) do
    res = res + head * n
    first_result(tail, n - 1, res)
  end

  def first_result([], n, res) do
    res
  end
end
