# NounProjex [![Hex.pm](http://img.shields.io/hexpm/v/noun_projex.svg?style=flat)](https://hex.pm/packages/noun_projex)

Elixir client for the [Noun Project][noun_project] API.
- Hex.pm: https://hex.pm/packages/noun_projex
- Docs: https://hexdocs.pm/noun_projex/NounProjex.html
- Blog post: [Writing a HTTP client in Elixir for the Noun Project][noun_projex_blog_post]

## Installation

```elixir
def deps do
  [{:noun_projex, "~> 0.1"}]
end
```

## Usage

Every Noun Project API endpoint has a very similarly named
function. Check the [API docs][noun_project_api_docs] and the NounProjex Docs.

Query parameters are passed as a keyword list.

## Examples

``` elixir
iex(1)> NounProjex.get_collection(123)
# ...

iex(2)> NounProjex.get_collection_icons(123, limit: 20, offset: 10)
# ...
```

## License

MIT

[noun_projex_blog_post]: http://www.eidel.io/2017/07/13/http-api-client-elixir-noun-project/
[noun_project]: https://thenounproject.com
[noun_project_api_docs]: http://api.thenounproject.com/documentation.html
