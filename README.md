# NounProjex

Elixir client for the [Noun Project][noun_project] API.

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

[noun_project]: https://thenounproject.com
[noun_project_api_docs]: http://api.thenounproject.com/documentation.html
