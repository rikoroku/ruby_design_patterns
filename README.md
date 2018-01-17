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
| [ストラテジ](https://github.com/rikoroku/ruby_design_patterns/tree/master/strategy) | 他クラスに処理を「委譲」することにより、処理を交換できるようにしたもの |
| [オブザーバ](https://github.com/rikoroku/ruby_design_patterns/tree/master/observer) | - |
| [コンポジット](https://github.com/rikoroku/ruby_design_patterns/tree/master/composite) | - |
| [イーテレータ](https://github.com/rikoroku/ruby_design_patterns/tree/master/iterator) | - |
| [コマンド](https://github.com/rikoroku/ruby_design_patterns/tree/master/commands) | - |
| [アダプタ](https://github.com/rikoroku/ruby_design_patterns/tree/master/adapter) | - |
| [プロキシ](https://github.com/rikoroku/ruby_design_patterns/tree/master/proxy) | - |
| [デコレータ](https://github.com/rikoroku/ruby_design_patterns/tree/master/decorator) | - |
| [シングルトン](https://github.com/rikoroku/ruby_design_patterns/tree/master/singleton) | - |
| [アブストラクトファクトリ](https://github.com/rikoroku/ruby_design_patterns/tree/master/abstract_factory) | 矛盾のないオブジェクトの生成を行うためのもの。 |
| [ファクトリメソッド](https://github.com/rikoroku/ruby_design_patterns/tree/master/factory_method) | - |
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
