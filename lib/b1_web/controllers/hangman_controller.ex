defmodule B1Web.HangmanController do
  use B1Web, :controller

  def index(conn, _params) do
    render(conn, :index)
  end

  def new(conn, _params) do
    game_pid = Hangman.new_game()
    tally = Hangman.tally(game_pid)
    put_session(conn, :game, game_pid)

    render(conn, :game, tally: tally)
  end
end
