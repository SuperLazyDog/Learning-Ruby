class DataOperater
  attr_accessor :data, :result
  #----------------------------------------------------------------
  #                    データの初期化と入力取得
  #----------------------------------------------------------------
  def initialize
    @datas = []
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
      is_new_case = true
      file.each_line do |line|
        @datas.push line.chomp
      end
    end
    self.data_build_debug # TODO: delete here

    # stdinによるデータ初期化
    # @datas.push $stdin.gets
    # self.data_build_debug # TODO: delete here
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
  end

  #----------------------------------------------------------------
  #                         データの出力
  #----------------------------------------------------------------
  def build_result(data)
    # ここに出力のためのデータ@resultを　 に作る
  end
  def format_output_str(count)
    # count
    str = "count\n"
  end

  def show_result
    puts @result.join ""
  end
end

#----------------------------------------------------------------
#                        　 実行
#----------------------------------------------------------------
dataOperater = DataOperater.new
dataOperater.initialize_data
dataOperater.processer
dataOperater.show_result
