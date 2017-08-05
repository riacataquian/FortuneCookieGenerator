defmodule FortuneGenerator.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      # import Wallaby.Query, only: [link: 1, css: 1, button: 1]
      import Ecto.Query, only: [from: 2]
      import FortuneGenerator.Router.Helpers
      alias FortuneGenerator.Repo

      # NOTE: These macros assume that the Wallaby convention
      # of naming the Wallaby.Session struct as `session`
      # is being followed.
      defmacro assert_in_body(session, expected) do
        quote do
          expected = unquote(expected)
          session = unquote(session) |> find("body")

          assert has_text?(session, expected), """
          Did not find "#{expected}" in:

          #{session |> text}
          """
        end
      end

      defmacro refute_in_body(session, expected) do
        quote do
          expected = unquote(expected)
          session = unquote(session) |> find("body")

          refute has_text?(session, expected), """
          Found "#{expected}" in:

          #{session |> text}
          """
        end
      end

    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(FortuneGenerator.Repo)
    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(FortuneGenerator.Repo, {:shared, self()})
    end
    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(FortuneGenerator.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
