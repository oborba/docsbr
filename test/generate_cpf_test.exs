defmodule Docsbr.GenerateCpfTest do
  use ExUnit.Case
  doctest Docsbr.GenerateCpf

  @cpf_base [1,1,1,4,4,4,7,7,7]

  ###
  #calculate_digit
  ###

  test "Generate first digit" do
    assert Docsbr.GenerateCpf.calculate_digit(@cpf_base, 1) == 3
  end

  test "Generate second digit" do
    cpf_with_one_digit = @cpf_base |> Enum.concat([3])

    assert Docsbr.GenerateCpf.calculate_digit(cpf_with_one_digit, 2) == 5
  end

  ###
  # .first_result
  ###

  test "Base for First Digit calc" do
    assert Docsbr.GenerateCpf.first_result(@cpf_base, 10, 0) == 162
  end
end
