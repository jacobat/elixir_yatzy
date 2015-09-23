defmodule Yatzy.ScoreTest do
  use ExUnit.Case
  doctest Yatzy.Score

  test "four_of_a_kind handles five of a kind" do
    assert Yatzy.Score.four_of_a_kind([5,5,5,5,5]) == 20
  end

  test "one pair selects the largest pair when the pair comes first" do
    assert Yatzy.Score.one_pair([1, 2, 3, 2, 1]) == 4
  end

  test "one pair selects the largest pair when the pair comes last" do
    assert Yatzy.Score.one_pair([1, 1, 2, 3, 2]) == 4
  end
end
