defmodule NounProjexTest do
  use ExUnit.Case, async: true
  doctest NounProjex

  @collection_id 26590
  @collection_slug "bike"
  @icon_id 800298
  @icon_slug "bicycle"
  @icon_search_term "bicycle"
  @author_id 1913957
  @author_username "latyshevaoksana"

  test "get collection by id" do
    assert {:ok, _result} = NounProjex.get_collection(@collection_id)
  end

  test "get collection by slug" do
    assert {:ok, _result} = NounProjex.get_collection(@collection_slug)
  end

  test "get collection icons by id" do
    assert {:ok, _result} =
      NounProjex.get_collection_icons(@collection_id)
  end

  test "get collection icons by slug" do
    assert {:ok, _result} =
      NounProjex.get_collection_icons(@collection_slug)
  end

  test "get collections" do
    assert {:ok, _result} =
      NounProjex.get_collections()
  end

  test "get icon by id" do
    assert {:ok, _result} =
      NounProjex.get_icon(@icon_id)
  end

  test "get icon by slug" do
    assert {:ok, _result} =
      NounProjex.get_icon(@icon_slug)
  end

  test "get icons by search term" do
    assert {:ok, _result} =
      NounProjex.get_icons(@icon_search_term)
  end

  test "get recently uploaded icons" do
    assert {:ok, _result} =
      NounProjex.get_icons_recent_uploads()
  end

  test "get OAuth usage" do
    assert {:ok, _result} =
      NounProjex.get_oauth_usage()
  end

  test "get user collection" do
    assert {:ok, _result} =
      NounProjex.get_user_collection(@author_id, @collection_slug)
  end

  test "get user collections" do
    assert {:ok, _result} =
      NounProjex.get_user_collections(@author_id)
  end

  test "get user uploads" do
    assert {:ok, _result} =
      NounProjex.get_user_uploads(@author_username)
  end
end
