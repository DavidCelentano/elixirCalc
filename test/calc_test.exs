defmodule CalcTest do
  use ExUnit.Case
  doctest Calc

  test "addition" do
    assert Calc.eval("9 + 9") == 18
  end

  test "subtraction" do
    assert Calc.eval("9 - 9") == 0
  end

  test "multiplication" do
    assert Calc.eval("9 * 9") == 81
  end

  test "division" do
    assert Calc.eval("90 / 9") == 10
  end

  test "parens" do
    assert Calc.eval("50 * (9 + 9)") == 900
  end

  test "bonus" do
    assert Calc.eval("(5 + 4) - (6 * 6)") == -27
  end
end
