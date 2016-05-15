defmodule Docsbr do
  def main(args) do
    args |> parse_args |> process
  end

  def process(options) do
    case options[:doc] do
      "cpf" -> IO.puts "Return a valid cpf"
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
