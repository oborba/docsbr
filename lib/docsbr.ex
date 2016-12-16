defmodule Docsbr do
  @moduledoc"""
  Main module, parse the options and generate a required document
  """

  alias Docsbr.GenerateCpf, as: Cpf
  alias Docsbr.GenerateCnpj, as: Cnpj

  def main(args), do: args |> parse_args |> process

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [doc: :string]
    )
    options[:doc]
  end

  defp process("cpf"), do: IO.puts Cpf.generate
  defp process("cnpj"), do: IO.puts Cnpj.generate
  defp process(_), do: IO.puts "Usage: $ docsbr --doc=<cpf | cnpj>"
end
