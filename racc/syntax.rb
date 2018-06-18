class SampleParser # 実際に生成されるパーサーのクラス名

token ASSIGNMENT VARIABLE INTEGER # プログラムを構成するトークンの一覧
start statements

rule # ここからendまで規則を表す
  statement  : VARIABLE ASSIGNMENT INTEGER { result = [:assignment, val[0], val[2]] }
  statements : statement { result = [val[0]] }
             | statements statement { result = val[0].push(val[1]) }
end

----inner
# ここに書かれたコードは生成されるクラスの先頭でmodule_evalされる
# ここで実際にパーサーの呼び出し部分を実装する必要がある

def parse(program)
  @tokens = []
  # トークンはそれぞれ[トークンを表すシンボル, 値]の配列の形にする必要がある
  until program.empty? # 字句解析
    case program
    when /\A\s+/
      # nop
    when /\A[A-z][\w]*\b/
      @tokens.push [:VARIABLE, $&.to_sym]
    when /\A\d+\b/
      @tokens.push [:INTEGER, $&.to_i]
    when /\A<-/
      @tokens.push [:ASSIGNMENT, $&]
    else
      raise RuntimeError, 'error: cannot tokenize.'
    end
    program = $' # 正規表現でマッチした部分より後ろを代入
  end
  @tokens.push [false, '$'] # トークン列の終わりを表す
  do_parse() # 自動生成されたパーサーのパース処理が走る。内部でnext_tokenが呼ばれる
end

def next_token()
  @tokens.shift()
end

