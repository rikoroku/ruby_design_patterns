require 'singleton'

# シングルトン
class SingletonObj
  # instanceメソッドが定義され、コンストラクタがprivateに設定される。
  include Singleton

  attr_accessor :counter

  def initialize
    @counter = 0
  end
end

obj1 = SingletonObj.instance
obj1.counter += 1
puts obj1.counter

obj2 = SingletonObj.instance
obj2.counter += 3
puts obj2.counter

# newメソッドがprivateになっているため呼び出せない。instanceメソッドでのみ生成可能。
# instanceメソッドで生成時、インスタンスは一つのみになっている。
obj3 = SingletonObj.new