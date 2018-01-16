class Report

  def initialize
    @title = "html report title"
    @text = ["report line 1", "report line 2", "report line 3"]
  end

  # 出力に必要な順にメソッド呼び出し
  def output_report
    # 以下3つのメソッドはフックメソッドと呼ぶ
    # サブクラスでオーバーライドしてもしなくてもどちらでも良いメソッド
    output_start
    output_body
    output_end
  end

  def output_start
  end

  def output_body
    @text.each do |line|
      output_line line
    end
  end

  def output_end
  end

  private

  def output_line line
    # 実際の処理を行う「サブクラス」でオーバーライドしていなければ
    # 現状のまま処理が走るためraiseによって例外が発生。
    # ここは確実に処理をサブクラスで変えてねというものを定義するやり方
    # 各サブクラスで確実に変化してくるものに設定する
    raise "Called abstracy method"
  end

end