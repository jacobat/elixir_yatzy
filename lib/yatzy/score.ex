defmodule Yatzy.Score do

  @doc ~S"""
  upper(n, ds) should return the score for the roll ds used in the slot for n number
  of eyes in the upper section of the score sheet.

  ## Examples
     iex> Yatzy.Score.upper(1, [2,3,1,2,1])
     2
     iex> Yatzy.Score.upper(2, [2,2,2,3,2])
     8
  """
  def upper(n, ds) do
    grouped_ds = Enum.group_by(ds, %{}, fn x -> x end)
    Enum.sum(grouped_ds[n])
  end

  @doc ~S"""
  chance(ds) should return the sum of the eyes on the dice.

  ## Examples
     iex> Yatzy.Score.chance([3,4,2,4,1])
     14
  """
  def chance(ds) do
    Enum.sum(ds)
  end

  @doc ~S"""
  yatzy(ds) should return 50 if all dice are showing the same number of eyes.

  ## Examples
     iex> Yatzy.Score.yatzy([2,3,3,3,3])
     0
     iex> Yatzy.Score.yatzy([4,4,4,4,4])
     50
  """
  def yatzy([x, x, x, x, x]) do
    50
  end
  def yatzy(_) do
    0
  end

  @doc ~S"""
  small_straight(ds) should return 15 for any set of dice containing the
  sequence 1-2-3-4-5 in any order.

  ## Examples
     iex> Yatzy.Score.small_straight([1,2,3,4,6])
     0
     iex> Yatzy.Score.small_straight([2,4,3,1,5])
     15
  """
  def small_straight(ds) do
    if Enum.sort(ds) == [1,2,3,4,5] do
      15
    else
      0
    end
  end

  @doc ~S"""
  large_straight(ds) should return 20 for any set of dice containing the
  sequence 2-3-4-5-6 in any order.

  ## Examples
     iex> Yatzy.Score.large_straight([5,2,3,2,6])
     0
     iex> Yatzy.Score.large_straight([6,2,4,3,5])
     20
  """
  def large_straight(ds) do
    if Enum.sort(ds) == [2,3,4,5,6] do
      20
    else
      0
    end
  end

  @doc ~S"""
  four_of_a_kind(ds) has a value when there are four of a kind in the roll and then
  its value is the total number of eyes on the dice being four of a kind.

  ## Examples
     iex> Yatzy.Score.four_of_a_kind([2,3,3,3,5])
     0
     iex> Yatzy.Score.four_of_a_kind([5,5,5,2,5])
     20
  """
  def four_of_a_kind(ds) do
    n_of_a_kind(ds, 4)
  end

  defp n_of_a_kind(ds, n) do
    ds
    |> group_by_values
    |> select_more_than(n)
    |> List.flatten
    |> List.first
    |> multiply_by_n(n)
  end

  defp group_by_values(ds) do
    ds
    |> Enum.group_by(%{}, fn x -> x end)
    |> Dict.values
  end

  defp select_more_than(ds, n) do
    ds |> Enum.filter(fn x -> length(x) >= n end)
  end

  defp multiply_by_n(nil, _n) do
    0
  end
  defp multiply_by_n(i, n) do
    n * i
  end

  @doc ~S"""
  three_of_a_kind(ds) has a value when there are three of a kind in the roll and then
  its value is the total number of eyes on the dice being three of a kind.

  ## Examples
     iex> Yatzy.Score.three_of_a_kind([2,3,4,3,5])
     0
     iex> Yatzy.Score.three_of_a_kind([4,1,4,2,4])
     12
  """
  def three_of_a_kind(ds) do
    n_of_a_kind(ds, 3)
  end

  @doc ~S"""
  one_pair(ds) has a value when there is a pair in the roll and then
  its value is the total number of eyes on the dice in the pair.

  ## Examples
     iex> Yatzy.Score.one_pair([2,3,4,1,5])
     0
     iex> Yatzy.Score.one_pair([4,6,6,2,5])
     12
     iex> Yatzy.Score.one_pair([4,4,6,6,5])
     12
     iex> Yatzy.Score.one_pair([4,6,6,5,5])
     12
  """
  def one_pair(ds) do
    pairs = ds
    |> pairs
    |> Enum.map(fn list -> List.first(list) * 2 end)

    case pairs do
      [] -> 0
      list -> Enum.max(list)
    end
  end

  defp pairs(ds) do
    ds
    |> group_by_values
    |> Enum.filter(fn list -> length(list) >= 2 end)
  end


  @doc ~S"""
  two_pairs(ds) has a value when there is two pairs in the roll and then
  its value is the total number of eyes on the dice in the two pairs.

  ## Examples
     iex> Yatzy.Score.two_pairs([2,3,3,3,3])
     0

     iex> Yatzy.Score.two_pairs([2,4,6,2,6])
     16
  """
  def two_pairs(ds) do
    pairs = ds |> pairs

    case pairs do
      [] -> 0
      [_x] -> 0
      [x, y] -> (List.first(x) + List.first(y)) * 2
    end
  end

  @doc ~S"""
  full_house(ds) has a value when there is three of a kind and a pair in the roll.
  The value is the sum of the eyes on the dice.

  ## Examples
     iex> Yatzy.Score.full_house([3,3,3,3,3])
     0

     iex> Yatzy.Score.full_house([3,3,3,3,4])
     0

     iex> Yatzy.Score.full_house([3,3,6,3,6])
     21

     iex> Yatzy.Score.full_house([6,3,6,3,6])
     24
  """
  def full_house(ds) do
    grouped = ds
    |> group_by_values
    |> Enum.sort
    |> List.flatten

    case grouped do
      [x, x, x, x, x] -> 0
      [x, x, x, y, y] -> x * 3 + y * 2
      [x, x, y, y, y] -> x * 2 + y * 3
      _ -> 0
    end
  end
end
