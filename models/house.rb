require_relative('../db/sql_runner')
require('pry')

require_relative("student.rb")

class House

  attr_reader :id, :name, :color

  def initialize(details)
    @id = details['id'].to_i
    @name = details['name']
    @color = ""
  end

  def save()
    sql = "INSERT INTO houses (name) VALUES ($1) RETURNING id"
    values = [@name]
    house_data = SqlRunner.run(sql, values)
    @id = house_data.first()['id'].to_i
  end

  def color()
    case @name
      when 'Gryffindor'
        @color = 'orange'
      when 'Ravenclaw'
        @color = 'green'
      when 'Hufflepuff'
        @color = 'yellow'
      when 'Slytherin'
        @color = 'blue'
      end
  end

  def self.all()
    sql = "SELECT * FROM houses"
    houses = SqlRunner.run( sql )
    result = houses.map { |house| House.new( house ) }
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end

end
