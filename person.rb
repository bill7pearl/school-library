class Nameable
  def correct_name
    raise NotImplementedError, 'Correct name'
  end
end

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(name, age, parent_permission: true)
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end
end

class NameDecorator < Nameable
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

person = Person.new(28, 'Bill')
puts person.correct_name

class CapitalizeDecorator < NameDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end

class TrimmerDecorator < NameDecorator
  def correct_name
    @nameable.correct_name[0...10]
  end
end
