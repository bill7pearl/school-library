class Nameable
  def correct_name
    raise NotImplementedError, 'This method needs to be implemented in a subclass'
  end
end

class Person < Nameable
  attr_reader :id, :age
  attr_accessor :name

  def initialize(age, parent_permission: true, name: 'Unknown')
    super()
    @id = rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
