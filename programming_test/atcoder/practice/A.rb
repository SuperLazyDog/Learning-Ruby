class DataOperater
  attr_accessor :data, :result
  #----------------------------------------------------------------
  #                    データの初期化と入力取得
  #----------------------------------------------------------------
  def initialize
    @datas = {num: [], str: ''}
    @result = []
  end

  # デフォルトデータ生成のデバッグ
  def initialize_debug
    puts "initialized @result: #{@result}"
  end
  #　データの初期化
  def initialize_data
    # # ファイルによるデータ初期化
    File.open('sample_data.txt') do |file|
      file.each_line.with_index do |line, i|
        data = line.chomp
        if i == 0
          @datas[:num] = [data.to_i]
        elsif i == 1
          @datas[:num] += data.split(' ').map { |i| i.to_i }
        elsif i == 2
          @datas[:str] = data
        end
      end
    end

    # stdinによるデータ初期化
    # $stdin.each_line.with_index do |line, i|
    #   data = line.chomp
    #   if i == 0
    #     @datas[:num] = [data.to_i]
    #   elsif i == 1
    #     @datas[:num] += data.split(' ').map { |i| i.to_i }
    #   elsif i == 2
    #     @datas[:str] = data
    #   end
    # end
  end

  #　データの初期化のデバッグ
  def data_build_debug
    # puts "@datas: #{@datas}"
  end
  #----------------------------------------------------------------
  #                         処理ロジック
  #----------------------------------------------------------------
  #　出力のための処理
  def processer
    sum = @datas[:num].inject(:+)
    @result.push format_output_str(sum, @datas[:str])
  end

  #----------------------------------------------------------------
  #                         データの出力
  #----------------------------------------------------------------

  def format_output_str(sum, str)
    str = "#{sum} #{str}\n"
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
