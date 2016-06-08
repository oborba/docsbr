defmodule Docsbr do
  @moduledoc"""
  Main module, parse the options and generate a required document
  """

  alias Docsbr.GenerateCpf, as: Cpf
  alias Docsbr.GenerateCnpj, as: Cnpj

  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    case options[:doc] do
      "cpf" ->  IO.puts Cpf.generate
      "cnpj" -> IO.puts Cnpj.generate
      _ -> IO.puts "Usage: $ docsbr --doc=<cpf | cnpj>"
    end
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [doc: :string]
    )
    options
  end
end
