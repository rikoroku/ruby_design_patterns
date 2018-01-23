# Subject
class BankAccount
  attr_reader :balance

  def initialize balance
    puts "BankAccountを作成しました"
    @balance = balance
  end

  def deposit amount
    @balance += amount
  end

  def withdraw amount
    @balance -= amount
  end
end

# Proxy(仮想プロキシ。パフォーマンス向上のためBankAccountの生成を遅らせる)
class VirtualAccountProxy
  def initialize starting_balance
    puts "VirtualAccountProxyを生成しました。BankAccountはまだ生成していません。"
    @starting_balance = starting_balance
  end

  def balance
    subject.balance
  end

  def deposit amount
    subject.deposit amount
  end

  def withdraw amount
    subject.withdraw amount
  end

  def announce
    "VirtualAccountProxyが担当するアナウンスです"
  end

  def subject
    @subject || (@subject = BankAccount.new(@starting_balance))
  end
end

proxy = VirtualAccountProxy.new 100
puts proxy.announce

puts proxy.deposit 50

puts proxy.withdraw 10