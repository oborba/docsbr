defmodule Docsbr do
  alias Docsbr.GenerateCpf, as: Cpf

  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    case options[:doc] do
      "cpf" ->  IO.puts Cpf.generate_cpf
      "cnpj" -> IO.puts "Return a valid cnpj"
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
