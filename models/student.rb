require_relative('../db/sql_runner')

class Student

  def initialize()
    @first_name = first_name
    @second_name = second_name
    @house = house
    @age = age
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students(first_name,last_name,house,age)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house, @age]
    student_date = SqlRunner.run(sql, values)
    @id = student_date.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [id]
    student = SqlRunner.run(sql, values)
    return Student.new(student.first)
  end

  def self.all()
    sql = "SELECT * FROM students;"
    students = SqlRunner.run( sql )
    result = students.map { |student| PizzaOrder.new( student ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

end
