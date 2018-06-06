require_relative('../models/student')
require_relative('../models/house')

Student.delete_all()
House.delete_all()

house1 = House.new({"name" => "Gryffindor"})
house2 = House.new({"name" => "Ravenclaw"})
house3 = House.new({"name" => "Hufflepuff"})
house4 = House.new({"name" => "Slytherin"})
house1.save()
house2.save()
house3.save()
house4.save()

student1 = Student.new({
  "first_name" => "Harry",
  "last_name" => "Potter",
  "house_id" => house1.id,
  "age" => 12
})

student2 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 12
})

student3 = Student.new({
  "first_name" => "Ron",
  "last_name" => "Weasley",
  "house_id" => house1.id,
  "age" => 12
})

student4 = Student.new({
  "first_name" => "Luna",
  "last_name" => "Lovegood",
  "house_id" => house2.id,
  "age" => 12
})

student5 = Student.new({
  "first_name" => "Marcus",
  "last_name" => "Flint",
  "house_id" => house4.id,
  "age" => 16
})

student6 = Student.new({
  "first_name" => "Draco",
  "last_name" => "Malfoy",
  "house_id" => house4.id,
  "age" => 12
})

student7 = Student.new({
  "first_name" => "Cedric",
  "last_name" => "Diggory",
  "house_id" => house3.id,
  "age" => 17
})

student1.save()
student2.save()
student3.save()
student4.save()
student5.save()
student6.save()
student7.save()
