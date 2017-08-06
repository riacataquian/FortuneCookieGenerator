# FortuneGenerator

### Requirements
  * Erlang 19.3
    See [Erlang's installation guide](http://www.erlang.org/downloads).
  * Elixir 1.4.2
    See [Elixir's installation guide](https://elixir-lang.org/install.html).
  * Nodejs v8.1.4
  * PostgreSQL 9.6.3
  * Wallaby, the package used for our browser test, requires `phantomjs`.
  * Phoenix by default, uses [brunch](http://brunch.io/).

### Starting the app

To start the FortuneGenerator app, follow the steps:

  * Install dependencies with `mix deps.get`
  * Be sure to update the database credentials. Run:
  ```
    cp config/database.exs{.sample,}
  ```
  Then, update `config/database.exs` as necessary.

  * Create, migrate and seed your database with `mix ecto.setup`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server` or `iex -S mix phoenix.server` for REPL and server.

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Notes

  * Source code is under `web/` directory.
  * Some helpers can be found at `lib/fortune_generator/`.
  * Seeds data can be found at `priv/fixtures/fortunes.exs`.
  * Run `mix test` to run the tests and `mix test --trace` for a more detailed tests. See `test/` directory to test's source code.
  * Run `mix credo` to run Elixir stylelinter, and `mix credo --strict` for a more stricter linting. Please note: we are not changing auto-generated Elixir and Phoenix's code as requested by credo.
