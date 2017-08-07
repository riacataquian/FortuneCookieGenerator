# FortuneGenerator

### Requirements
  * Erlang 19.3
    See [Erlang's installation guide](http://www.erlang.org/downloads).
  * Elixir 1.4.2
    See [Elixir's installation guide](https://elixir-lang.org/install.html).
  * Nodejs v8.1.4
  * PostgreSQL 9.6.3
  * [Wallaby](Wallaby), the package used for our browser test, requires `phantomjs`.
  * Phoenix by default, uses [brunch](http://brunch.io/).

### For [asdf](https://github.com/asdf-vm/asdf) users
  There is a [.tool-versions](https://github.com/riacataquian/FortuneCookieGenerator/blob/master/.tool-versions) artifact on the project's root directory. To install the plugins, run:
  ```
  asdf install
  ```

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

### References
  * [Credo Lint](https://github.com/rrrene/credo)
  * [RSCSS - Reasonable System for CSS Stylesheet Structure](https://github.com/rstacruz/rscss)

### Notes

  * Source code is under `web/` directory.
  * Some helpers can be found at `lib/fortune_generator/`.
  * Seeds data can be found at `priv/fixtures/fortunes`.
  * Run `mix test` to run the tests and `mix test --trace` for a more detailed tests. See `test/` directory to view test's source code.
  * Run `mix credo` to run Elixir stylelinter, and `mix credo --strict` for a more stricter linting. 
    Please note: Credo's strict linting warns about readability issues with Elixir and Phoenix's auto-generated code.
    <img width="696" alt="screen shot 2017-08-07 at 10 21 35 am" src="https://user-images.githubusercontent.com/7468021/29011587-dbbcd4c2-7b66-11e7-8575-10ea2d177c2b.png">

