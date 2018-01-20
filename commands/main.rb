require 'fileutils'

# Command
class Command
  attr_reader :description

  def initialize description
    @description = description
  end

  def execute
    raise "Called abstract method"
  end

  def undo_execute
    raise "Called abstract method"
  end
end

# ConcreateCommand1
class CreateFile < Command
  def initialize path, contents
    super("Create file: #{path}") # Commandクラスのinitializeを呼び出す
    @path = path
    @contents = contents
  end

  def execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end

  def undo_execute
    File.delete(@path)
  end
end

# ConcreateCommand2
class DeleteFile < Command
  def initialize path
    super("Delete file: #{path}") # Commandクラスのinitializeを呼び出す
    @path = path
  end

  def execute
    if File.exists?(@path)
      @content = File.read(@path)
    end
    File.delete(@path)
  end

  def undo_execute
    f = File.open(@path, "w")
    f.write(@contents)
    f.close
  end
end

# ConcreateCommand3
class CopyFile < Command
  def initialize source, target
    super("Copy file: #{source} to #{target}") # Commandクラスのinitializeを呼び出す
    @source = source
    @target = target
  end

  def execute
    FileUtils.copy(@source, @target)
  end

  def undo_execute
    File.delete(@target)
    if @contents
      f = File.open(@target, "w")
      f.write(@contents)
      f.close
    end
  end
end

# ConcreateCommandをまとめて、複数のコマンドを実行できるようにしたもの
class CompositeCommand < Command
  def initialize
    @commands = Array.new
  end

  def add_command cmd
    @commands << cmd
  end

  def execute
    @commands.each { |cmd| cmd.execute }
  end

  def undo_execute
    @commands.reverse.each { |cmd| cmd.undo_execute }
  end

  def description
    description = ""
    @commands.each { |cmd| description += cmd.description + "\n" }
    description
  end
end

command_list = CompositeCommand.new
command_list.add_command(CreateFile.new("file1.txt", "hello, world\n"))
command_list.add_command(CopyFile.new("file1.txt", "file2.txt"))
command_list.add_command(DeleteFile.new("file1.txt"))

command_list.execute
puts command_list.description

command_list.undo_execute