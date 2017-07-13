defmodule NounProjex.Mixfile do
  use Mix.Project

  def project do
    [app: :noun_projex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     # Docs
     name: "NounProjex",
     source_url: "https://github.com/olieidel/noun_projex",
     docs: [main: "NounProjex",
            extras: ["README.md"]]]
  end

  def application do
    []
  end

  defp deps do
    [{:ex_doc, "~> 0.14", only: :dev, runtime: false},
     {:httpoison, "~> 0.12"},
     {:poison, "~> 3.1"},
     {:oauther, "~> 1.1"}]
  end

  defp description do
    """
    Elixir Client for the Noun Project API.
    """
  end

  defp package do
    [
      name: :noun_projex,
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      maintainers: ["Oliver Eidel"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/olieidel/noun_projex"}
    ]
  end
end
