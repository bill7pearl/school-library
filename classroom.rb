class Classroom
  attr_accessor :label
  attr_reader :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students << student
    student.classroom = self
  end
end

class Student < Person
  attr_accessor :classroom

  def initialize(name, age, parent_permission: true, classroom: nil)
    super(name, age, parent_permission)
    @classroom = classroom
    classroom&.add_student(self)
  end
end

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end

class Rental
  attr_accessor :date
  attr_reader :person, :book

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date
    person.rentals << self
    book.rentals << self
  end
end
