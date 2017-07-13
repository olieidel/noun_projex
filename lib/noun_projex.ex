defmodule NounProjex do
  @moduledoc """
  [Noun Project](https://thenounproject.com) API Client in Elixir.
  """

  @base_url "http://api.thenounproject.com"
  @consumer_key Application.get_env(:noun_projex, :api_key)
  @consumer_secret Application.get_env(:noun_projex, :api_secret)

  @doc """
  Returns a single collection by id (int).
  """
  def get_collection(id) when is_integer(id) do
    do_request(:get, ["collection", to_string(id)])
  end

  @doc """
  Returns a single collection by slug (string).
  """
  def get_collection(slug) when is_binary(slug) do
    do_request(:get, ["collection", slug])
  end

  def get_collection_icons(id_or_slug, params \\ [])

  @doc """
  Returns a list of icons associated with a collection by id (int).
  """
  def get_collection_icons(id, params) when is_integer(id) do
    params = filter_params(params, [:limit, :offset, :page])

    do_request(:get, ["collection", to_string(id), "icons"], params)
  end

  @doc """
  Returns a list of icons associated with a collection by slug (string).
  """
  def get_collection_icons(slug, params) when is_binary(slug) do
    params = filter_params(params, [:limit, :offset, :page])

    do_request(:get, ["collection", slug, "icons"], params)
  end

  @doc """
  Returns a list of all collections.
  """
  def get_collections(params \\ []) do
    params = filter_params(params, [:limit, :offset, :page])

    do_request(:get, "collections", params)
  end

  @doc """
  Returns a single icon by id (int).
  """
  def get_icon(id) when is_integer(id) do
    do_request(:get, ["icon", to_string(id)])
  end

  @doc """
  Returns a single icon by term (string).
  """
  def get_icon(term) when is_binary(term) do
    do_request(:get, ["icon", term])
  end

  @doc """
  Returns a list of icons by term (string).
  """
  def get_icons(term, params \\ []) when is_binary(term) do
    params = filter_params(params,
      [:limit_to_public_domain, :limit, :offset, :page])

    do_request(:get, ["icons", term], params)
  end

  @doc """
  Returns list of most recently uploaded icons.
  """
  def get_icons_recent_uploads(params \\ []) do
    params = filter_params(params, [:limit, :offset, :page])

    do_request(:get, ["icons", "recent_uploads"], params)
  end

  @doc """
  Returns current oauth usage and limits.
  """
  def get_oauth_usage() do
    do_request(:get, ["oauth", "usage"])
  end

  @doc """
  Returns a single collection associated with a user by user_id (int)
  and slug (string).
  """
  def get_user_collection(user_id, slug)
  when is_integer(user_id) and is_binary(slug) do
    do_request(:get, ["user", to_string(user_id), "collections", slug])
  end

  @doc """
  Returns a list of collections associated with a user by user_id (int).
  """
  def get_user_collections(user_id) when is_integer(user_id) do
    do_request(:get, ["user", to_string(user_id), "collections"])
  end

  @doc """
  Returns a list of uploads associated with a user by username (string).
  """
  def get_user_uploads(username, params \\ []) when is_binary(username) do
    params = filter_params(params, [:limit, :offset, :page])

    do_request(:get, ["user", username, "uploads"], params)
  end

  @doc """
  Execute the request. See do_request/3.
  """
  def do_request(method, path) do
    do_request(method, path, [])
  end

  @doc """
  Execute the request by constructing OAuth headers and the URL
  by the given path.
  """
  def do_request(method, path, params) do
    url = construct_url(path, params)
    headers = [construct_oauth_header(to_string(method), url)]
    case HTTPoison.get(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        case Poison.decode(body) do
          {:ok, decoded} -> {:ok, decoded}
          {:error, error} -> {:error, error}
        end
      {:ok, %HTTPoison.Response{status_code: status_code}} ->
        {:error, status_code}
      {:error, error} ->
        {:error, error}
    end
  end

  defp filter_params(params, params_list) do
    Enum.filter(params, fn {key, _value} ->
      key in params_list
    end)
  end

  @doc """
  Construct the OAuth1.0 header with some serious voodoo.
  """
  def construct_oauth_header(method, url) do
    with creds <- OAuther.credentials(consumer_key: @consumer_key,
             consumer_secret: @consumer_secret),
         params <- OAuther.sign(method, url, [], creds),
         {header, _req_params} <- OAuther.header(params),
      do: header
  end

  defp construct_url(dir) when is_binary(dir) do
    @base_url <> "/" <> dir
  end
  defp construct_url(dirs) when is_list(dirs) do
    @base_url <> "/" <> Enum.join(dirs, "/")
  end
  defp construct_url(dirs, params) do
    construct_url(dirs) <> "?" <> URI.encode_query(params)
  end
end
