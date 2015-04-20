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

    render('basics_1.html.erb')
  end

  def arrays_2
    # Arrays

    # Creating Arrays
    @students = ["Jocelyn", "Trenton", "Tom", "Lindsey"]

    # Adding an element to an Array:
    @students.push("Roz")

    render('arrays_2.html.erb')
  end

  def hashes_3
    # Hashes

    # Creating Hashes
    @person1 = { "first_name" => "Raghu", "last_name" => "Betina" }
    @person2 = { "first_name" => "Michael", "last_name" => "Arthur" }

    # Adding a key/value pair to a Hash:
    @person2["role"] = "Student"
    @person1["role"] = "Instructor"

    render('hashes_3.html.erb')
  end

  def nested_lists_4

    render('nested_lists_4.html.erb')
  end

  def each_5

    render('each_5.html.erb')
  end

  def methods_6

    render('methods_6.html.erb')
  end

  def arguments_7

    render('arguments_7.html.erb')
  end

  def return_values_8

    render('return_values_8.html.erb')
  end

  def classes_9

    render('classes_9.html.erb')
  end

  def challenge_10

    render('challenge_10.html.erb')
  end

  def friendbc_11

    render('friendbc_11.html.erb')
  end
end
