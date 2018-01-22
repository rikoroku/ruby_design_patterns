# ConcreteComponent
class SimpleWriter
  def initialize path
    @file = File.open(path, "w")
  end

  def write_line line
    @file.print line
    @file.print "\n"
  end

  def pos
    @file.pos
  end

  def rewind
    @file.rewind
  end

  def close
    @file.close
  end
end

# Decorator(複数のでコレータの共通部分定義。重複コード削減用)
class WriterDecorator
  def initialize real_writer
    @real_writer = real_writer
  end

  def write_line line
    @real_writer.write_line line
  end

  def pos
    @real_writer.pos
  end

  def rewind
    @real_writer.rewind
  end

  def close
    @real_writer.close
  end
end

# Decorator1
class NumberingWriter < WriterDecorator
  def initialize real_writer
    super real_writer
    @line_number = 1
  end

  def write_line line
    @real_writer.write_line "#{@line_number}: #{line}"
  end
end

# Decorator2
class TimestampingWriter < WriterDecorator
  def write_line line
    @real_writer.write_line "#{Time.new}: #{line}"
  end
end

f = NumberingWriter.new SimpleWriter.new("/Users/tomohirokogawa/Desktop/untitled.rb")
f.write_line("Hello, world")
f.close

fs = TimestampingWriter.new SimpleWriter.new("/Users/tomohirokogawa/Desktop/untitled.rb")
fs.write_line("Hello, timestamping")
fs.close

