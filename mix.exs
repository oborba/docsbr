defmodule Docsbr.Mixfile do
  use Mix.Project

  def project do
    [app: :docsbr,
     version: "0.0.1",
     elixir: "~> 1.2",
     escript: [main_module: Docsbr],
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end
end
