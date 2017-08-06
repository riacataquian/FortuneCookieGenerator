# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs

defmodule Seed do
  require Logger

  alias FortuneGenerator.{
    Repo,
    FortuneCookie
  }

  def run do
    clear_data()
    start()
  end

  defp clear_data do
    Logger.info "Clearing all data.."

    Repo.delete_all FortuneCookie
  end

  defp start do
    Logger.info "Reading all data.."

    case File.read("priv/fixtures/fortunes") do
      {:ok, body} ->
        body
        |> parse()
        |> persist()
      {:error, reason} -> raise "Encountered an error on seeds: #{inspect reason}"
    end
  end

  defp parse(body) when is_binary(body) do
    body
    |> String.split(~r{\n}) # Split with new lines
    |> Stream.reject(& &1 === "") # Removes extra white space
  end

  defp persist(list) do
    Logger.info "Persisting all data.."

    {:ok, records} =
      Repo.transaction(fn ->
        Enum.each(list, &insert/1)
      end)
  end

  defp insert(fortune) do
    # Intenionally raise an error when something fails
    Repo.insert!(%FortuneCookie{fortune: fortune})
  end
end

Seed.run
