class DataOperater
  attr_accessor :data, :result
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
    File.open('sample_data_of_A.txt') do |file|
      case_temp = []
      is_new_case = true
      file.each_line do |line|
        @datas.push line.chomp
      end
    end
    self.data_initialize_debug # TODO: delete here

    # stdinによるデータ初期化
    # @datas.push $stdin.gets
    # self.data_initialize_debug # TODO: delete here
  end
  #　データの初期化のデバッグ
  def data_initialize_debug
    puts "@datas: #{@datas}"
  end

  #　出力のための処理
  def processer
    letters = ('a'..'z').to_a
    numbers = (0..9).to_a
    numbers_strs = ('0'..'9').to_a
    brackets = ['(', ')']
    is_letter = Proc.new { |char| letters.include? char }
    is_number = Proc.new { |char| numbers_strs.include? char }
    is_bracket = Proc.new { |char| brackets.include? char }
    get_flag = Proc.new { |char|
      next 0 if is_letter.call char
      next 1 if is_number.call char
      next 2 if char == brackets[0]
      next 3 if char == brackets[1]
    }
    result_temp = {}
    reset_result_temp = Proc.new {
      letters.each do |letter|
        result_temp[letter] = 0
      end
    }
    build_result = Proc.new {
      result_temp.each do |k, v|
        @result.push format_output(k, v)
      end
    }
    @datas.each do |data|
      operater_temp = []
      queue = data.split ''
      number_str = ''
      reset_number_str = Proc.new {
        number_str = ''
      }
      reset_result_temp.call
      # 文字列から演算単位の配列へ変換
      while !queue.empty?
        char = queue.shift
        case get_flag.call char # 0: letter, 1: number, 2: ( 3: )
        when 0
          operater_temp.push char
        when 1
          number_str << char
          while get_flag.call(queue.first) == 1
            char = queue.shift
            number_str << char
          end
          operater_temp.push number_str
          reset_number_str.call
        when 2
          operater_temp.push char
        when 3
          operater_temp.push char
        end
      end
      # puts "operater_temp: #{operater_temp}"

      # 演算単位の配列から計算
      count_letters operater_temp, result_temp
    end
    build_result.call
  end

  # 演算単位の配列から計算
  def count_letters(operater_temp, result_temp)
    puts "operater_temp: #{operater_temp}"
    letters = ('a'..'z').to_a
    numbers = (0..9).to_a
    numbers_strs = ('0'..'9').to_a
    brackets = ['(', ')']
    is_letter = Proc.new { |char| letters.include? char }
    is_bracket = Proc.new { |char| brackets.include? char }
    get_flag = Proc.new { |char|
      next 0 if is_letter.call char
      next 2 if char == brackets[0]
      next 3 if char == brackets[1]
      next 1
    }
    operaters = {}
    coefficient = 1
    while true
      break if operater_temp.empty?
      item = operater_temp.shift
      flag =  get_flag.call item  # 0: letter, 1: number, 2: ( 3: )
      if flag == 2 # (...)の処理
        level = 1
        number_queue = []
        level_index = []
        while level > 0 # 絶対キューの範囲内なので、emptyチェックなしで
          item = operater_temp.shift
          flag =  get_flag.call item
          case flag
          when 0 # letter
            puts "level_index[#{level}]: #{level_index[level]}"
            result_temp[item] += coefficient
            coefficient = coefficient/level_index[level] unless level_index[level].nil?
            level_index.delete_at level
          when 1 # number
            item_num = item.to_i
            level_index[level] = item_num
            number_queue.push item_num
            coefficient *= item_num
          when 2 # (
            level += 1
            # 12 (
          when 3 # )
            coefficient /= level_index[level-1] unless level_index[level-1].nil?
            level -= 1
            level_index.delete_at level
          end
          puts "--------------------------------------"
          puts "level: #{level}"
          puts "item: #{item}"
          puts "result_temp[#{item}]: #{result_temp[item]}" unless result_temp[item].nil?
          puts "level_index: #{level_index}"
          # puts "number_queue: #{number_queue}"
          puts "coefficient: #{coefficient}"
        end
        coefficient = 1
      elsif flag == 0
        result_temp[item] += coefficient
        coefficient = 1
      elsif flag == 1
        coefficient *= item.to_i
      end
      # puts "item: #{item}, coefficient: #{coefficient}"
    end
    # while !operater_temp.empty?
    #   item = operater_temp.shift
    #   flag =  get_flag.call item  # 0: letter, 1: number, 2: ( 3: )
    #   if flag == 2
    #   else
    #   end
    # end
    puts "result_temp: #{result_temp}"
  end

  def format_output(alpha, count)
    #Case #1: 2 44.72135955
    str = "#{alpha} #{count}\n"
  end

  def show_result
    puts @result.join ""
  end
end

dataOperater = DataOperater.new
dataOperater.initialize_data
dataOperater.processer
dataOperater.show_result
