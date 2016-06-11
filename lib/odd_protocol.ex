defprotocol Odd do
  @doc "Returns true if the data is considered odd"
  @fallback_to_any true
  def odd?(data)
end

defimpl Odd, for: Integer do
  require Integer

  def odd?(num) do
    Integer.is_odd(num)
  end
end

defimpl Odd, for: Float do
  def odd?(num) do
    Odd.odd?(trunc(num))
  end
end

defimpl Odd, for: List do
  def odd?(data) do
    Odd.odd?(Enum.count(data))
  end
end

defimpl Odd, for: Animal do
  def odd?(%Animal{hairy: true}), do: true
  def odd?(_), do: false
end

defimpl Inspect, for: Animal do
  def inspect(animal, _opts) do
    # search for `elixir convert struct to map` in google
    # convert animal struct to map:
    attr_str = Map.delete(animal, :__struct__)
               |> Enum.reduce("", fn({k,v}, acc) -> acc <> "* #{k} -> #{v}" end)

    """
    Animal has the following attrs:

    #{attr_str}
    """
  end
end

defimpl Odd, for: Any do
  def odd?(_), do: false
end
