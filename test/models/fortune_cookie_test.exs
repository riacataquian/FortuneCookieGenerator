defmodule FortuneGenerator.FortuneCookieTest do
  use FortuneGenerator.ModelCase

  alias FortuneGenerator.FortuneCookie

  @valid_attrs %{fortune: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = FortuneCookie.changeset(%FortuneCookie{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = FortuneCookie.changeset(%FortuneCookie{}, @invalid_attrs)
    refute changeset.valid?
  end
end
