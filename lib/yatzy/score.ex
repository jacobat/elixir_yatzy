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
    :undefined
  end

  @doc ~S"""
  chance(ds) should return the sum of the eyes on the dice.

  ## Examples
     iex> Yatzy.Score.chance([3,4,2,4,1])
     14
  """
  def chance(ds) do
    :undefined
  end

  @doc ~S"""
  yatzy(ds) should return 50 if all dice are showing the same number of eyes.

  ## Examples
     iex> Yatzy.Score.yatzy([2,3,3,3,3])
     0
     iex> Yatzy.Score.yatzy([4,4,4,4,4])
     50
  """
  def yatzy(ds) do
    :undefined
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
    :undefined
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
    :undefined
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
    :undefined
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
    :undefined
  end

  @doc ~S"""
  one_pair(ds) has a value when there is a pair in the roll and then
  its value is the total number of eyes on the dice in the pair.

  ## Examples
     iex> Yatzy.Score.one_pair([2,3,4,1,5])
     0
     iex> Yatzy.Score.one_pair([4,6,6,2,5])
     12
  """
  def one_pair(ds) do
    :undefined
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
    :undefined
  end

  @doc ~S"""
  full_house(ds) has a value when there is three of a kind and a pair in the roll.
  The value is the sum of the eyes on the dice.

  ## Examples
     iex> Yatzy.Score.full_house([3,3,3,3,3])
     0
     iex> Yatzy.Score.full_house([3,3,6,3,6])
     21
  """
  def full_house(ds) do
    :undefined
  end


end
