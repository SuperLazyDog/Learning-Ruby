class DataOperater
  attr_accessor :data, :result
  def initialize
    @data = { # {test_count:   datas: [{user_location: store_count: stores:[{x, y}]}
      test_count: 0,
      datas: []
    }
    @result = []

  end
  #　データの初期化
  def initialize_data
    File.open('sample_data_of_A.txt') do |file|
      case_temp = []
      is_new_case = true
      file.each_line.with_index(1) do |line, i|
        temp_line = line.chomp
        @data[:test_count] = temp_line.to_s if i == 1
        if i>2
          if temp_line == ""
            is_new_case = true
            next
          end
          datas = temp_line.split(' ')
          if is_new_case
            @data[:datas].push({ user_location: { x: datas[0].to_i, y: datas[1].to_i } })
            is_new_case = false
          else
            if datas.count == 1
              @data[:datas].last[:store_count] = datas[0].to_i
            else
              @data[:datas].last[:stores] = [] if @data[:datas].last[:stores].nil?
              @data[:datas].last[:stores].push({ x: datas[0].to_i, y: datas[1].to_i })
            end
          end
        end
      end
    end
    self.data_initialize_debug # TODO: delete here
  end
  #　データの初期化のデバッグ
  def data_initialize_debug
    puts "@data: #{@data}"
  end

  #　出力のための処理
  def processer
    @data[:datas].each.with_index do |data, i|
      user_location = data[:user_location]
      distances = []
      data[:stores].each do |store_location|
        puts "store_location: #{store_location}"
        distanceX = (user_location[:x] - store_location[:x])
        distanceY = (user_location[:y] - store_location[:y])
        distances.push Math.sqrt(distanceX*distanceX + distanceY*distanceY)
      end
      puts "distances: #{distances}"
      maximun = distances.max
      @result.push format_output i, distances.index(maximun), maximun
    end
  end

  def format_output(case_index, store_index, distance)
    #Case #1: 2 44.72135955
    str = "Case ##{case_index+1}: #{store_index+1} #{distance}\n"
  end

  def show_result
    puts @result.join ""
  end
end

dataOperater = DataOperater.new
dataOperater.initialize_data
dataOperater.processer
dataOperater.show_result
