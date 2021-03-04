defmodule Docsbr.GenerateCpfTest do
  use ExUnit.Case

  alias Docsbr.GenerateCpf

  test "Generate a valid cpf" do
    cpf = GenerateCpf.generate

    assert String.length(cpf) == 11
    assert cpf
      |> String.slice(0..-3) |> GenerateCpf.verification_digit |> GenerateCpf.verification_digit |> Enum.join == cpf
  end

  test "Generate valid digits" do
    cpf_with_first_digit = GenerateCpf.verification_digit("213460810")

    assert cpf_with_first_digit |> Enum.join == "2134608102"

    cpf = GenerateCpf.verification_digit(cpf_with_first_digit) # 26

    assert cpf |> Enum.join == "21346081026"
  end
end
