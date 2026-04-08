defmodule Counter do
  def main do
    IO.puts("Введите N")
    n = IO.gets("") |> String.trim() |> String.to_integer()
    IO.puts("Введите массив до N")
    numbers = read_numbers(n, [])
    IO.puts("Введенный массив")
    IO.puts(Enum.join(numbers, " "))
    result = count_elements(numbers)
    IO.puts("\nКоличество элементов, равных предыдущему: #{result}")
  end

  defp read_numbers(0, acc), do: Enum.reverse(acc)
  defp read_numbers(n, acc) do
    line = IO.gets("")
    case line do
      nil -> read_numbers(n, acc)
      str ->
        case Integer.parse(String.trim(str)) do
          {num, ""} -> read_numbers(n - 1, [num | acc])
          _ -> read_numbers(n, acc)
        end
    end
  end

  defp count_elements([]), do: 0
  defp count_elements([_]), do: 0
  defp count_elements([first, second | rest]) do
    count = if first == second, do: 1, else: 0
    count + count_elements([second | rest])
  end
end

Counter.main()
