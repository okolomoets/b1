defmodule B1Web.HangmanHTML do
  use B1Web, :html
  import Phoenix.HTML.Link, only: [{:button, 2}]

  embed_templates "hangman_html/*"
end
