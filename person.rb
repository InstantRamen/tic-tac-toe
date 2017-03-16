class Person
  def initialize(id = 1, name = nil)
    id > 0 ? @id = id : id = 1
    @name = name
  end
end