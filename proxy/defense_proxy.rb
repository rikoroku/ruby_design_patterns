# Subject
class BankAccount
  attr_reader :balance

  def initialize balance
    @balance = balance
  end

  def deposit amount
    @balance += amount
  end

  def withdraw amount
    @balance -= amount
  end
end

require 'etc'

# Proxy(ユーザー認証を担当する防御プロキシ)
class BackAccountProxy
  def initialize real_object, owner_name
    @real_object = real_object
    @owner_name = owner_name
  end

  def balance
    check_access
    @real_object.balance
  end

  def deposit amount
    check_access
    @real_object.deposit amount
  end

  def withdraw amount
    check_access
    @real_object.withdraw amount
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end

end

account = BankAccount.new 100
proxy = BackAccountProxy.new account, `logname`
puts proxy.deposit 60
puts proxy.withdraw 10

# -------------------------------------
# method_missingによる以上により記述を簡略化出来る。
# ただしソースコードが追いづらくなるので非推奨

class BankAccountProxyVer2
  def initialize real_object, owner_name
    @real_object = real_object
    @owner_name = owner_name
  end

  def method_missing name, *args
    check_access
    @real_object.send name, *args
  end

  def check_access
    if Etc.getlogin != @owner_name
      raise "Illegal access: #{@owner_name} cannot access account."
    end
  end
end