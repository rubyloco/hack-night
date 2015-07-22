defmodule Recursion do
  require Integer
  # Recursion for star rows
  def print_star_row_pair_n_minus_1_times(n) when n <= 1 do
    print_row AmericanFlag.star_row(IO.ANSI.white_background)
  end

  def print_star_row_pair_n_minus_1_times(n) do
    print_row AmericanFlag.star_row(IO.ANSI.white_background)
    print_row AmericanFlag.star_row(IO.ANSI.red_background)
    print_star_row_pair_n_minus_1_times(n-1)
  end

  # Recursion for color rows
  def print_color_row_n_times(n) when n <= 1 do
    print_row AmericanFlag.color_row(IO.ANSI.white_background)
  end

  def print_color_row_n_times(n) do
    if Integer.is_even n do
      print_row AmericanFlag.color_row(IO.ANSI.red_background)
    else
      print_row AmericanFlag.color_row(IO.ANSI.white_background)
    end
    print_color_row_n_times(n-1)
  end

  # Allow printing of a single row N times
  def print_row_n_times(msg, n) when n <= 1 do
    :ok = IO.write msg <> ansi_reset
  end

  def print_row_n_times(msg, n) do
    :ok = IO.write msg <> ansi_reset
    print_row_n_times(msg, n-1)
  end

  # Helper Methods
  defp ansi_reset do
    "#{IO.ANSI.reset}" <> "\n"
  end

  defp print_row(msg) do
    :ok = IO.write msg <> ansi_reset
  end
end

defmodule AmericanFlag do
  def star_row(background) do
    "#{IO.ANSI.white}#{IO.ANSI.blue_background} *   *   *   *   *   *  " <>
      "#{background}" <> String.duplicate(" ", 45)
  end

  def color_row(color) do
    "#{color}" <> String.duplicate(" ", 69)
  end
end

Recursion.print_star_row_pair_n_minus_1_times(5)
Recursion.print_color_row_n_times(6)
Recursion.print_row_n_times("#{IO.ANSI.white}#{IO.ANSI.black_background}| |", 12)
