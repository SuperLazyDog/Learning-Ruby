# 修正する時間がないが、問題のある箇所はコメントしました
class DataOperater
  attr_accessor :data, :result
  def initialize
    @data = [] # [{main_function:, target_function:, definition_count:, 関数名: 呼び出されるもの}]
    @result = []

  end
  #　データの初期化
  def initialize_data
    File.open('sample_data_of_B.txt') do |file|
      case_temp = []
      is_new_case = true
      file.each_line.with_index(1) do |line, i|
        temp_line = line.chomp
        if i>2
          if temp_line == ""
            is_new_case = true
            next
          end
          datas = temp_line.split(' ')
          if is_new_case
            new_data = { main_function: datas[0], target_function: datas[1] }
            @data.push new_data
            is_new_case = false
          else
            if datas.count == 1
              @data.last[:definition_count] = datas[0].to_i
            else
              @data.last[datas[0].to_sym] = datas.drop(2)
            end
          end
        end
      end
    end
    self.data_initialize_debug
  end
  #　データの初期化のデバッグ
  def data_initialize_debug
    puts "@data: #{@data.join '\n'}"
  end

  #　出力のための処理
  def processer
    @data.each.with_index do |data, i|
      # main = data[:main_function].to_s
      main = data.delete(:main_function).to_s
      # target = data[:target_function].to_s
      target = data.delete(:target_function).to_s
      definition_count = data.delete(:definition_count).to_i
      queue = []
      queue += data[main.to_sym]
      puts "queue: #{queue}"
      count = 0
      while !queue.empty?
        now_function = queue.shift
        count += 1 if now_function == target
        queue = data[now_function.to_sym] + queue if !data[now_function.to_sym].nil?
      end
      @result.push format_output i, count
    end
  end

  def format_output(case_index, called_count)
    str = "Case ##{case_index+1}: #{called_count}\n"
  end

  def show_result
    puts @result.join ""
  end
end

dataOperater = DataOperater.new
dataOperater.initialize_data
dataOperater.processer
dataOperater.show_result
