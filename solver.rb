class Solver
  def factorial(number)
    raise 'Number cannot be negative' if number.negative?
    return 1 if number.zero?

    (1..number).reduce(:*) || 1
  end

  def reverse(string)
    string.reverse
  end

  def fizzbuzz(number)
    return 'fizzbuzz' if (number % 15).zero?
    return 'buzz' if (number % 5).zero?
    return 'fizz' if (number % 3).zero?

    number.to_s
  end
end
