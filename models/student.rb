require_relative('../db/sql_runner')

require_relative("house.rb")

class Student

  attr_reader :id
  attr_accessor :first_name, :last_name, :house_id, :age

  def initialize(details)
    @id = details['id'].to_i
    @first_name = details['first_name']
    @last_name = details['last_name']
    @house_id = details['house_id'].to_i
    @age = details['age'].to_i
  end

  def pretty_name()
    return "#{@first_name} #{@last_name}"
  end

  def save()
    sql = "INSERT INTO students( first_name, last_name, house_id, age)
    VALUES ($1, $2, $3, $4) RETURNING *"
    values = [@first_name, @last_name, @house_id, @age]
    student_data = SqlRunner.run(sql, values)
    @id = student_data.first()['id'].to_i
  end

  def delete()
    sql = "DELETE FROM students WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE students SET (first_name, last_name, house_id, age) =
    ($1, $2, $3, $4) WHERE id = $5"
    values = [@first_name, @last_name, @house_id, @age, @id]
    SqlRunner.run(sql, values)
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
    result = students.map { |student| Student.new( student ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM students;"
    SqlRunner.run(sql)
  end

  def house()
    sql = "SELECT name FROM houses WHERE id = $1"
    values = [@house_id]
    result = SqlRunner.run(sql, values)
    return House.new(result[0])
  end

end
