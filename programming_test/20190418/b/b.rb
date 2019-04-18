class B
  FILE_NAME = 'task2-test-input.txt'#'data.txt'
  # @cases_count
  # @cases
  def read_data
    @cases = []
    open(FILE_NAME) do |f|
      @cases_count = f.gets.to_i
      f.gets
      @cases_count.times do |i|
        limit = f.gets.to_i
        temp = []
        (limit+1).times.with_index(0) do |i|
          temp[i] = Array.new
        end
        temp[0] = nil
        (limit-1).times do
          datas = f.gets.split(' ').map {|i|i.to_i}
          temp[datas[0]].push(datas[1]) unless temp[datas[0]].include? datas[1]
          temp[datas[1]].push(datas[0]) unless temp[datas[1]].include? datas[0]
        end
        f.gets
        @cases.push temp
      end
    end
  end

  def test
    @cases.each do |c|
      puts "#{c}"
    end
  end

  def solution
    @cases.each.with_index(1) do |c, i|
      dxs = []
      count = c.count
      (1...count).each do |i|
        dis = []
        search c, i, nil, dis, 0
        dxs.push dis.max
      end
      puts "Case ##{i}: #{dxs.min}"
    end
  end

  private
  def search(graph, node, pre_node, datas, length)
    current_node = node
    if graph[current_node] == [pre_node]
      datas.push length
    end
    (graph[current_node]-[pre_node]).each do |next_node|
      search(graph, next_node, current_node, datas, length+1)
    end
  end
end

b = B.new
b.read_data
# b.test
b.solution
