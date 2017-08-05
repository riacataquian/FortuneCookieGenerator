defmodule FortuneGenerator.Repo.Migrations.CreateFortuneCookie do
  use Ecto.Migration

  def change do
    create table(:fortune_cookies) do
      add :fortune, :text

      timestamps()
    end

  end
end
