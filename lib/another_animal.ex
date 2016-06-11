defmodule AnotherAnimal do
  @derive Odd # this has no effect since @fallback_to_any is already set to true in Odd protocol
  defstruct [:name]
end
