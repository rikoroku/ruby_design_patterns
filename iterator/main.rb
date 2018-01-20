require 'byebug'

# 集約オブジェクト内の要素
class Article
  def initialize title
    @title = title
  end

  attr_reader :title
end

# 集約オブジェクト
class Blog
  def initialize
    @articles = Array.new
  end

  def get_article_at index
    @articles[index]
  end

  def add_article article
    @articles << article
  end

  def length
    @articles.length
  end

  def iterator
    BlogIterator.new self
  end
end

# 外部イーテレータ
class BlogIterator
  def initialize blog
    @blog = blog
    @index = 0
  end

  def has_next?
    @index < @blog.length
  end

  def next_article
    article = self.has_next? ? @blog.get_article_at(@index) : nil
    @index += 1
    article
  end
end

blog = Blog.new
blog.add_article(Article.new("記事1"))
blog.add_article(Article.new("記事2"))
blog.add_article(Article.new("記事3"))
blog.add_article(Article.new("記事4"))

iterator = blog.iterator
while iterator.has_next?
  article = iterator.next_article
  puts article.title
end

puts "Enumerable---------------------------------------------"

# ---------------------------------------------
# Rubyの標準モジュール、Enumerableを使うと集約オブジェクト向けの便利なメソッドを使うことができる。
class Account
  attr_accessor :name, :balance

  def initialize name, balance
    @name = name
    @balance = balance
  end

  def <=> other
    @balance <=> other.balance
  end
end

class Portfolio
  include Enumerable

  def initialize
    @accounts = Array.new
  end

  def each(&block)
    @accounts.each(&block)
  end

  def add_account account
    @accounts << account
  end
end

portfolio = Portfolio.new
portfolio.add_account(Account.new("アカウント1", 1000))
portfolio.add_account(Account.new("アカウント2", 2000))
portfolio.add_account(Account.new("アカウント3", 3000))
portfolio.add_account(Account.new("アカウント4", 4000))

puts portfolio.any? { |account| account.balance > 3000 }

puts portfolio.all? { |account| account.balance > 1000 }