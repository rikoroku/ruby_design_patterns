# AbstractExpression
class Expression
  def | other
    Or.new self, other
  end

  def & other
    And.new self, other
  end
end

require 'find'

# TerminalExpression1
class All < Expression
  def evaluate dir
    results = Array.new
    Find.find(dir) do |d|
      next unless File.file? d
      results << d
    end
    results
  end
end

# TerminalExpression2
class FileName < Expression
  def initialize pattern
    @pattern = pattern
  end

  def evaluate dir
    results = Array.new
    Find.find(dir) do |d|
      next unless File.file? d
      name = File.basename(d)
      results << d if File.fnmatch(@pattern, name)
    end
    results
  end
end

# TerminalExpression3
class Bigger < Expression
  def initialize size
    @size = size
  end

  def evaluate dir
    results = Array.new
    Find.find(dir) do |d|
      next unless File.file? d
      results << d if File.size(d) > @size
    end
    results
  end
end

# TerminalExpression4
class Writable < Expression
  def evaluate dir
    results = Array.new
    Find.find(dir) do |d|
      next unless File.file? d
      results << d if File.writable?(d)
    end
    results
  end
end

# NonterminalExpression1
class Not < Expression
  def initialize expression
    @expression = expression
  end

  def evaluate dir
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end

# NonterminalExpression2
class Or < Expression
  def initialize expression1, expression2
    @expression1, @expression2 = expression1, expression2
  end

  def evaluate dir
    result1 = @expression1.evaluate dir
    result2 = @expression2.evaluate dir
    (result1 + result2).sort.uniq
  end
end

# NonterminalExpression3
class And < Expression
  def initialize expression1, expression2
    @expression1, @expression2 = expression1, expression2
  end

  def evaluate dir
    result1 = @expression1.evaluate dir
    result2 = @expression2.evaluate dir
    (result1 & result2)
  end
end

complex_expression = All.new
puts complex_expression.evaluate('/Users/tomohirokogawa/Desktop/temp')