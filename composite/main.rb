require 'byebug'

# Component
class Entry
  def get_name
    raise "Called abstract method"
  end

  def ls_entry prefix
    raise "Called abstract method"
  end

  def remove
    raise "Called abstract method"
  end
end

# Leaf
class FileEntry < Entry
  def initialize name
    @name = name
  end

  def get_name
    @name
  end

  def ls_entry prefix
    puts prefix + "/" + get_name
  end

  def remove
    puts @name + "を削除しました。"
  end
end

# Composite
class DirEntry < Entry
  def initialize name
    @name = name
    @directory = Array.new
  end

  def get_name
    @name
  end

  def add entry
    @directory.push entry
  end

  def ls_entry prefix
    puts prefix + "/" + get_name
    @directory.each do |d|
      d.ls_entry prefix + "/" + get_name
    end
  end

  def remove
    @directory.each do |d|
      d.remove
    end
    puts @name + "を削除しました。"
  end
end

root = DirEntry.new("root")
tmp = DirEntry.new("tmp")
tmp.add(FileEntry.new("conf"))
tmp.add(FileEntry.new("data"))
root.add(tmp)

root.ls_entry("")

root.remove