class A
  FILE_NAME = 'task1-test-input.txt'#'data.txt'
  # @case_count
  # @cases
  def read_data
    @cases = []
    open(FILE_NAME) do |f|
      @case_count = f.gets.to_i
      f.gets
      @case_count.times do |i|
        temp = {
          target: nil,
          tastes: [],
          options: []
        }
        temp[:target] = f.gets.to_i
        f.gets.to_i.times do
          datas = f.gets.split(' ')
          temp[:tastes].push({
            name: datas[0],
            price: datas[1].to_i
          })
        end
        f.gets.to_i.times do
          datas = f.gets.split(' ')
          temp[:options].push({
            name: datas[0],
            price: datas[1].to_i
          })
        end
        @cases.push temp
        f.gets
      end
    end

  end

  def test
    puts "cases: #{@cases}"
  end

  def solution
    @cases.each.with_index(1) do |c, index|
      tastes = c[:tastes]
      options = c[:options]
      options_count = options.count
      prices = []
      tastes.each do |taste|
        p0 = taste[:price]
        prices.push p0 # 0
        options.each.with_index do |option, i| # 1
          prices.push p0+option[:price]
          for j in (i+1)...options_count do
            prices.push p0+option[:price]+options[j][:price]
          end
        end
      end
      distant = prices.max
      result = c[:target]
      prices.each do |p|
        temp = (c[:target] - p).abs.to_i
        if temp < distant
          distant = temp
          result = p
        elsif temp == distant
          if p < result
            result = p
          end
        end
      end
      puts "Case ##{index}: #{result}"
    end
  end

  private
  def get_all_pattern(options)

  end
end

a = A.new
a.read_data
a.solution
