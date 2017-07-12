use Mix.Config

if Mix.env in [:dev, :test] do
  if File.exists?("dev.secret.exs") do
    import_config "dev.secret.exs"
  end
end
