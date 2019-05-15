class DataOperater
  attr_accessor :data, :result
  #----------------------------------------------------------------
  #                    データの初期化と入力取得
  #----------------------------------------------------------------
  def initialize
    @datas = { assets: 10000, charts: []}
    @result = []
  end

  # デフォルトデータ生成のデバッグ
  def initialize_debug
    puts "initialized @result: #{@result}"
  end
  #　データの初期化
  def initialize_data
    # ファイルによるデータ初期化
    File.open('sample_data.txt') do |file|
      case_temp = []
      is_title = true
      file.each_line do |line|
        new_item = line.chomp.split ' '
        unless is_title
          @datas[:charts].push [new_item[0].to_i, new_item[1].to_i]
        else
          is_title = false
        end
      end
    end
    self.data_build_debug # TODO: delete here
  end

  #　データの初期化のデバッグ
  def data_build_debug
    puts "@datas: #{@datas}"
  end
  #----------------------------------------------------------------
  #                         処理ロジック
  #----------------------------------------------------------------
  #　出力のための処理
  def processer
    # 利用可能な変数
    # var A = 0; // Stock ID
    # var S = 1; // 利用可能な銘柄の数
    # var T = 64; // トータルの期間の長さ


    # API関数
    # buy(stockID, time, quantity); // 購入
    # sell(stockID, time, quantity); // 売却
    # quote(stockID, time); // 価格を取得
    # reset(); // 初めからやり直す
    queue = @datas[:charts].dup
    assets = @datas[:assets]
    rate = 0.1 # レート
    until queue.empty?
      item = queue.shift
      time = item[0]; price = item[1]
      # puts "[#{time}]: #{price}"
      # buy 'A', time
      # sell 'A', time, 10
      # quote 'A', time
      0.upto (@datas[:charts].count-1) do |i|
        puts quote 'A', i
      end


    end

  end

  #----------------------------------------------------------------
  #                         データの出力
  #----------------------------------------------------------------
  def build_result(data)
    # ここに出力のためのデータ@resultを　 に作る
    @result.push data
  end

  def format_output_str(type, stock_id, time, quantity=nil)
    # API関数
    # buy(stockID, time, quantity); // 購入
    # sell(stockID, time, quantity); // 売却
    # quote(stockID, time); // 価格を取得
    # reset(); // 初めからやり直す
    temp_str = ''
    if type != 'quote' && !quantity.nil?
      temp_str = ", #{quantity}"
    end
    str = "#{type}(#{stock_id}, #{time}#{temp_str});"
  end

  def caculate_profit_with_step(step, stock_id, before_location)
    caculate_profit stock_id, before_location, step
  end

  def caculate_profit(stock_id, before_location, after_location)
  end

  def buy(stock_id, time, quantity=nil)
    str = format_output_str 'buy', stock_id, time, quantity
    build_result str
  end

  def sell(stock_id, time, quantity=nil)
    str = format_output_str 'sell', stock_id, time, quantity
    build_result str
  end

  def quote(stock_id, time)
    str = format_output_str 'quote', stock_id, time
    build_result str
    @datas[:charts][time][1]
  end

  def show_result
    puts @result.join "\n"
  end
end

#----------------------------------------------------------------
#                        　 実行
#----------------------------------------------------------------
dataOperater = DataOperater.new
dataOperater.initialize_data
dataOperater.processer
# dataOperater.show_result
