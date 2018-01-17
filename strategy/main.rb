require 'byebug'

# ストラテジクラス
# 同じ目的をもった一連のオブジェクトを抽象化したもの
class Formatter
  def output_report title, text
    raise "Called abstract method"
  end
end

# 具象ストラテジ1
class HTMLFormatter < Formatter
  def output_report report
    puts "<html><head><title>#{report.title}</title></head><body>"
    report.text.each { |line| puts "<p>#{line}</p>" }
    puts "</body></html>"
  end
end

# 具象ストラテジ2
class PlainTextFormatter < Formatter
  def output_report report
    puts "******* #{report.title} *******"
    report.text.each { |line| puts line }
  end
end

# コンテキスト
# ストラテジの利用者
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize formatter
    @title = "Title"
    @text = %w(text1 text2 text3)
    @formatter = formatter
  end

  def output_report
    @formatter.output_report self
  end
end

html_report = Report.new HTMLFormatter.new
html_report.output_report

plain_report = Report.new PlainTextFormatter.new
plain_report.output_report