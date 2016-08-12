class Person
  def initialize(name)
    @name = name
  end

  def greeting
    "Hi, my name is #{@name}."
  end
end



class Student < Person
  def learn
    puts "I get it!"
  end
end

class Instructor < Person
  def teach
    puts "Everything in Ruby is an object!"
  end
end

chris = Instructor.new("Chris")

puts chris.greeting

christina = Student.new("Christina")

puts christina.greeting

puts chris.teach

puts christina.learn

# christina.teach and chris.learn do not work because they you only inherit from
# parent class not from sibling classes.
