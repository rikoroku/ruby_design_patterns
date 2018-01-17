# アブストラクトファクトリ
## 目的/概要
* 矛盾のないオブジェクトの生成を行うためのもの

## 構成
以下の3つのオブジェクトによって構成

1. AbstractFactory(抽象工場): ConcreteFactoryの共通部分の処理を行う
2. ConcreteFactory(具象工場): 実際にオブジェクトの生成を行う
3. Product: ConcreteFactoryによって生成される側のオブジェクト

## メリット
* 関連し合うオブジェクトの集まりを作れる。
* 整合性が必要となるオブジェクトの集まりを間違うことなく作成できる。

## サンプルについて
1. AbstractFactoryとなるOrganismFactoryクラスに処理を委譲している。
2. ConcreteFactoryとなるクラスではどのオブジェクトの組み合わせを作るかしか定義しない。