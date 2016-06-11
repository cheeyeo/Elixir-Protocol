defmodule OddProtocolTest do
  use ExUnit.Case

  test "Odd protocol is implemented" do
    assert Protocol.assert_protocol!(Odd) == :ok
  end

  test "Integers know if they are odd" do
    assert Odd.odd?(1)
    refute Odd.odd?(2)
  end

  test "Floats are odd if their floor is" do
    assert Odd.odd?(1.9)
    assert Odd.odd?(1.1)
    refute Odd.odd?(2.1)
  end

  test "lists are odd based on their element count" do
    refute Odd.odd?([])
    assert Odd.odd?([1])
    refute Odd.odd?([1, 2])
  end

  test "animals are odd if they are hairy" do
    assert Odd.odd?(%Animal{hairy: true})
    refute Odd.odd?(%Animal{hairy: false})
  end


  test "another animal type will always be false" do
    assert Odd.impl_for(%AnotherAnimal{}) == Odd.Any
    refute Odd.odd?(%AnotherAnimal{})
  end

  test "unspecified things aren't odd" do
    refute Odd.odd?(%{})
    refute Odd.odd?("jabow")
    refute Odd.odd?(:poland)
  end

  test "custom animal inspect" do
    assert Protocol.assert_impl!(Inspect, Animal) == :ok
    assert inspect(%Animal{hairy: false}) == Inspect.Animal.inspect(%Animal{hairy: false}, %Inspect.Opts{})
  end
end
