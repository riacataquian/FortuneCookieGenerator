defmodule FortuneGenerator.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias FortuneGenerator.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import FortuneGenerator.Router.Helpers
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
