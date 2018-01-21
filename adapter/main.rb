# Target
class Printer
  def initialize obj
    @obj = obj
  end

  def print_weak
    @obj.print_weak
  end

  def print_strong
    @obj.print_strong
  end
end

# Adaptee
class OldPrinter
  def initialize string
    @string = string.dup
  end

  def show_with_paren
    puts "(#{@string})"
  end

  def show_with_aster
    puts "*#{@string}*"
  end
end

# Adapter
class Adapter
  def initialize string
    @old_printer = OldPrinter.new string
  end

  def print_weak
    @old_printer.show_with_paren
  end

  def print_strong
    @old_printer.show_with_aster
  end
end

# Client
p = Printer.new Adapter.new("Hello,world")
p.print_weak
p.print_strong

# -------------------------------------------
# 特異メソッドを使用した場合

# Target
class Printer
  def initialize obj
    @obj = obj
  end

  def print_weak
    @obj.print_weak
  end

  def print_strong
    @obj.print_strong
  end
end

# Adaptee
class OldPrinter
  def initialize string
    @string = string.dup
  end

  def show_with_paren
    puts "(#{@string})"
  end

  def show_with_aster
    puts "*#{@string}*"
  end
end

# Adapterの役割を特異メソッドにて実装
text = OldPrinter.new "HELLO"
def text.print_weak
  show_with_paren
end
def text.print_strong
  show_with_aster
end

p = Printer.new text
p.print_weak
p.print_strong