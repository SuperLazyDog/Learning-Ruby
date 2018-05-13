class DataOperater
  attr_accessor :data, :result
  #----------------------------------------------------------------
  #                    データの初期化と入力取得
  #----------------------------------------------------------------
  def initialize
    # datas
    # {all_people_count: num, consults: []}
    # {
    #   info: {
    #     all_people_count: 100,
    #     cousults_count: n,
    #   }
    #   consults: [
    #     "1 said 3 was an honest person.",
    #     "2 said 3 was a liar.",
    #     ...
    #   ]
    # }
    @datas = {
      info: {
        all_people_count:0,
        cousults_count: 0
        },
      consults:[]
      }
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
      file.each_line.with_index(1) do |line, i|
        data_line = line.chomp
        if i == 1
          datas = data_line.split(' ')
          @datas[:info][:all_people_count] = datas[0].to_i
          @datas[:info][:cousults_count] = datas[1].to_i
        else
          @datas[:consults].push data_line
        end
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
    result_map = Array.new(@datas[:info][:all_people_count]+1) # 0..<@datas[:info][:all_people_count]
    queue = self.build_process_queue
    result = 0
    puts "queue: #{queue}"
    count = recursive(queue, result_map, true)
    puts "recursive: #{count}"
  end

  def build_process_queue
    @datas[:consults]
  end

  def recursive(queue, result_map, consume_situation)
    puts "---------------------------------------"
    puts "result_map: #{result_map.drop(1)}"
    puts "queue: #{queue}"
    countA = 0
    countB = 0
    unless queue.empty?
      current_data = queue.shift
      # A
      result_mapA = result_map
      item = analyze_data current_data, consume_situation
      speaker_index = item[:speaker][:index];speaker_is_honest = item[:speaker][:result]
      target_index = item[:target][:index];target_is_honest = item[:target][:result]
      result_mapA[speaker_index] = speaker_is_honest if result_mapA[speaker_index].nil?
      result_mapA[target_index] = target_is_honest if result_mapA[target_index].nil?
      if result_mapA[speaker_index] != speaker_is_honest || result_mapA[target_index] != target_is_honest
        countA = 0
      else
        countA += recursive queue, result_mapA, consume_situation
      end



      # b
      result_mapB = result_map
      item = analyze_data current_data, !consume_situation
      speaker_index = item[:speaker][:index];speaker_is_honest = item[:speaker][:result]
      target_index = item[:target][:index];target_is_honest = item[:target][:result]
      result_mapB[speaker_index] = speaker_is_honest if result_mapB[speaker_index].nil?
      result_mapB[target_index] = target_is_honest if result_mapB[target_index].nil?
      if result_mapB[speaker_index] != speaker_is_honest || result_mapB[target_index] != target_is_honest
        countB = 0
      else
        countB += recursive queue, result_mapA, !consume_situation
      end
    else
      puts "OKOK"
      count = 0
      puts "result_map: #{result_map.drop(1)}"
      result_map.drop(1).each do |result|
        if result == nil
          count += 1
        end
      end
      return 2**count
    end
  end

  def analyze_data(str, consume_speaker_honest=true)
    # => {speak: {index:, result:}, target: {index:, result:}}
    elements = str.split(' ')
    speaker = elements[0].to_i
    target = elements[2].to_i
    express_thread = elements[4]
    {
      speaker: { index: speaker, result: consume_speaker_honest },
      target: { index: target, result: express_thread.size == 2 }
    }
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
