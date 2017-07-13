use Mix.Config

dev_secret_path = Path.expand("config/dev.secret.exs")

if Mix.env in [:dev, :test] do
  if File.exists?(dev_secret_path) do
    import_config "dev.secret.exs"
  end
end
