require 'observer'

# サブジェクト
class Employee
  include Observable # オブザーバの役割となるものがRubyの標準モジュールで用意されている

  attr_reader :name, :title, :salary

  def initialize name, title, salary
    @name = name
    @title = title
    @salary = salary
    # 以下2メソッドで通知先オブジェクト設定
    add_observer Payroll.new
    add_observer TaxMan.new
  end

  def salary=(new_salary)
    @salary = new_salary
    # 以下2メソッドでConcreateOvserverに変更を通知している。
    changed
    notify_observers self
  end
end

# 具象オブザーバ1
class Payroll
  def update changed_employee
    puts "彼の給料は#{changed_employee.salary}になりました。#{changed_employee.title}のために新しい小切手を切ります。"
  end
end

# 具象オブザーバ2
class TaxMan
  def update changed_employee
    puts "#{changed_employee.name}に新しい税金の請求書を送ります。"
  end
end

taro = Employee.new "たろう", "部長", 5000
taro.salary = 2000
taro.salary = 5000