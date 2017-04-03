class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    @boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    salary * multiplier
  end
end


class Manager < Employee
  attr_reader :employees

  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end

  def add_employee(employee)

    @employees << employee
    self.boss.employees << employee unless self.boss.nil?
  end

  def bonus(multiplier)
    total = 0
    employees.each do |emp|
      total += emp.salary * multiplier
    end
    total
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
