defmodule B1Web.HangmanHTML do
  use B1Web, :html

  embed_templates "hangman_html/*"

  @status_fields %{
    initializing: {"initializing", "Guess the word, a letter at a time"},
    good_guess: {"good-guess", "Good guess!"},
    bad_guess: {"bad-guess", "Sorry, that's a bad guess!"},
    won: {"won", "You won!"},
    lost: {"lost", "Sorry, you lost!"},
    already_used: {"already-used", "You already used that letter!"}
  }

  def move_status(status) do
    {class, msg} = Map.get(@status_fields, status)
    "<div class='status #{class}'>#{msg}</div>"
  end

  def continue_or_try_again(_conn, status) when status in [:won, :lost] do
    "<a href='/hangman' data-method='post' data-to='/hangman' class='phx-submit-loading:opacity-75 rounded-lg bg-zinc-900 hover:bg-zinc-700 py-2 px-3 text-sm font-semibold leading-6 text-white active:text-white/80'>Try again!</a>" |> raw
  end

  def continue_or_try_again(conn, _) do
    form_for(conn, "/hangman", [as: "make_move", method: :put], fn form ->
      [text_input(form, :guess), submit("Apply")]

    end)
  end

  def figure_for(0) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|\\  │
     / \\  │
          │
    ══════╧══
    }
  end

  def figure_for(1) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|\\  │
     /    │
          │
    ══════╧══
    }
  end

  def figure_for(2) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|\\  │
          │
          │
    ══════╧══
    }
  end

  def figure_for(3) do
    ~s{
      ┌───┐
      │   │
      O   │
     /|   │
          │
          │
    ══════╧══
    }
  end

  def figure_for(4) do
    ~s{
      ┌───┐
      │   │
      O   │
      |   │
          │
          │
    ══════╧══
    }
  end

  def figure_for(5) do
    ~s{
      ┌───┐
      │   │
      O   │
          │
          │
          │
    ══════╧══
    }
  end

  def figure_for(6) do
    ~s{
      ┌───┐
      │   │
          │
          │
          │
          │
    ══════╧══
    }
  end

  def figure_for(7) do
    ~s{
      ┌───┐
          │
          │
          │
          │
          │
    ══════╧══
    }
  end
end
