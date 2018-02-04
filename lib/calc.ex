defmodule Calc do
  
  def main() do
    input = IO.gets "Please enter an equation\n"
    trimmedInput = String.trim(input)
    output = eval(trimmedInput)
    IO.puts "#{output}\n"
    main() 
  end

  def eval(str) do
    str2 = str |> String.split("(")
    str3 = Enum.map(str2, fn(x) -> x |> String.split(")") end)
    str4 = List.flatten(str3, [])

    eqs = Enum.map(str4, fn(x) -> x |> String.split("") end)
    eqs = Enum.map(eqs, fn(x) -> Enum.filter(x, fn(y) -> y != " " end) end)
    eqs = Enum.map(eqs, fn(x) -> Enum.filter(x, fn(y) -> y != "" end) end)
    eqs = Enum.filter(eqs, fn(x) -> length(x) > 0 end)
    IO.inspect eqs
    [first | rest] = eqs
    solve(first, 0, rest)
  end

  def solve(eq, val, eqs) do
    IO.puts "Starting with eq #{eq}"
    if length(eq) == 1 do
      lastChar = Enum.at(eq, 0)
      IO.puts "Last Char #{lastChar}"
      if length(eqs) == 0 do
        IO.puts "No more eqs"
        lastChar |> String.to_integer
      else
        [first | rest] = eqs
        IO.puts "Calling #{first}"
        cond do
          lastChar == "+" ->
            val + solve(first, 0, rest)
          lastChar == "-" ->
            val - solve(first, 0, rest)
          lastChar == "*" ->
            val * solve(first, 0, rest)
          lastChar == "/" ->
            val / solve(first, 0, rest)
          true ->
            solve(first, lastChar |> String.to_integer, rest)
        end
      end
    else
      IO.puts "Splitting eq #{eq}"
      [head | tail] = eq
      IO.puts "Evaluating #{head}"
      cond do
        head == "+" ->
          val + solve(tail, val, eqs)
        head == "-" ->
          val - solve(tail, val, eqs)
        head == "/" ->
          val / solve(tail, val, eqs)
        head == "*" ->
          val * solve(tail, val, eqs)
        true ->
          solve(tail, head |> String.to_integer, eqs)
      end
    end
  end

end
