defmodule FortuneGenerator.FortuneView do
  use FortuneGenerator.Web, :view

  def format_text(text) when is_binary(text) do
    <<34>> <> text <> <<34>>
  end

  def format_text(text), do: text
end
