# コンテキスト
class Report
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize &formatter
    @title = "Title"
    @text = %w(text1 text2 text3)
    @formatter = formatter
  end

  def output_report
    @formatter.call self
  end

end

# 具象ストラテジ1
HTML_FORMATTER = lambda do |context|
    puts "<html><head><title>#{context.title}</title></head><body>"
    context.text.each { |line| puts "<p>#{line}</p>" }
    puts "</body></html>"
end

# 具象ストラテジ2
PLAIN_TEXT_FORMATTER = lambda do |context|
    puts "******* #{context.title} *******"
    context.text.each { |line| puts line }
end

html_report = Report.new(&HTML_FORMATTER)
html_report.output_report

plain_report = Report.new(&PLAIN_TEXT_FORMATTER)
plain_report.output_report