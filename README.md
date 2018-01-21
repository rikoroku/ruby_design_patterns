# Rubyによるデザインパターン
## 基本原則
* 変わるものを変わらないものから分離
* インターフェイスに対してプログラミングし、実装に対して行わない
* 継承より集約
* 委譲、委譲、委譲(delegation)
* YAGNI(You Ain't Gonna Need It) - 必要になるまで作るな

## 一覧

| 名前 | 概要 |
|:---|:---|
| [テンプレートメソッド](https://github.com/rikoroku/ruby_design_patterns/tree/master/template_method) | 2つ以上のとあるコードでやりたいことがほとんど同一の場合、ある一部だけ変えるときに使う。 |
| [ストラテジ](https://github.com/rikoroku/ruby_design_patterns/tree/master/strategy) | 他クラスに処理を「委譲」することにより、処理を切り替えて使用できるようにしたもの |
| [オブザーバ](https://github.com/rikoroku/ruby_design_patterns/tree/master/observer) | オブジェクトの変化を他のオブジェクトに通知するためのもの |
| [コンポジット](https://github.com/rikoroku/ruby_design_patterns/tree/master/composite) | 再帰の構造をクラスで構築できるもの。 |
| [イーテレータ](https://github.com/rikoroku/ruby_design_patterns/tree/master/iterator) | 要素の集まりを持つオブジェクトの各要素に、順番にアクセスする方法を提供するためのもの。 |
| [コマンド](https://github.com/rikoroku/ruby_design_patterns/tree/master/commands) | 内部の処理を知らなくてもコマンドを呼び出せば、正常に処理を行えるようにするためのもの |
| [アダプタ](https://github.com/rikoroku/ruby_design_patterns/tree/master/adapter) | 必要なインターフェイスと既存のオブジェクトの間の違いを吸収するためのもの |
| [プロキシ](https://github.com/rikoroku/ruby_design_patterns/tree/master/proxy) | - |
| [デコレータ](https://github.com/rikoroku/ruby_design_patterns/tree/master/decorator) | - |
| [シングルトン](https://github.com/rikoroku/ruby_design_patterns/tree/master/singleton) | オブジェクトを生成する際、システム内での現存数を一つのみに限定したい場合に用いる |
| [アブストラクトファクトリ](https://github.com/rikoroku/ruby_design_patterns/tree/master/abstract_factory) | 矛盾のないオブジェクトの生成を行うためのもの。 |
| [ファクトリメソッド](https://github.com/rikoroku/ruby_design_patterns/tree/master/factory_method) | 変更/保守がしやすくなるよう、インスタンスの生成と処理を切り離すためのもの |
| [ビルダー](https://github.com/rikoroku/ruby_design_patterns/tree/master/builder) | - |
| [インタプリタ](https://github.com/rikoroku/ruby_design_patterns/tree/master/interpreter) | - |

## 参考
* https://github.com/nipe0324/design_patterns_ruby
* https://github.com/morizyun/ruby_design_pattern_sample
* http://morizyun.github.io/blog/ruby-design-pattern-matome-mokuzi/

## 実行環境
```
$ ruby -v
ruby 2.4.0p0 (2016-12-24 revision 57164) [x86_64-darwin15]
```
