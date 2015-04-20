class EssentialsController < ApplicationController
  def basics_1
    # Strings, integers, variables
    # Simple methods, string interpolation

    # The essential pattern in Ruby:
    #    variable = object.method
    first = "raghu".capitalize
    last = "betina".capitalize

    full = first + " " + last
    lucky_number = rand(1..100) + 7

    # Adding strings together with the + operator
    @message1 = "Howdy, " + full + ". Your lucky number for today is " + lucky_number.to_s + "."
    # is harder than with String Interpolation
    @message2 = "Howdy, #{full}. Your lucky number for today is #{lucky_number}."
  end

  def arrays_2
    # Arrays

    # Creating Arrays
    @students = ["Jocelyn", "Trenton", "Tom", "Lindsey"]

    # Adding an element to an Array:
    @students.push("Roz")
  end

  def hashes_3
  end

  def nested_lists_4
  end

  def each_5
  end

  def methods_6
  end

  def arguments_7
  end

  def return_values_8
  end

  def classes_9
  end

  def challenge_10
  end

  def friendbc_11
  end
end
