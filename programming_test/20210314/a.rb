# https://www.rco.recruit.co.jp/career/engineer/entry/
# 例1）「A=1 B=4 C=5」だった場合、「A => MIN」で終了します。
#
# 例2）「A=1 B=2 C=4」だった場合、「A => ?, B => MID」で終了します。
# 4, 1, 3
# 4, 3, 1
# 4, 3, 2
@patterns = []
(1..5).each do |i|
  ((i+1)..5).each do |j|
    @patterns.push [i, j]
  end
end
@max = [1, 2]
@min = [4, 5]
@mid = [1, 5]
@normal = @patterns - @max - @min - @mid


def process(ary)
  result = []
  type = [-1, 0, 1] # -1:min 0:mid 1:max

  3.times do |i|
    if i == 0
      pattern = [ary[1], ary[2]].sort
      if @max == pattern
        result.push "max"
      elsif @mid == pattern
        result.push "mid"
      elsif @min == pattern
        result.push "min"
      else
        result.push "?"
      end
      if result[0] != "?"
        break
      end
    elsif i == 1
      exception = []
      [@max, @min, @mid].each do |p|
        if p.include? ary[2]
          np = p.dup
          np.delete(ary[2])
          exception.push np[0]
        end
      end
      exception += [ary[0], ary[2]]
      tmp = []
      ([1, 2, 3, 4, 5] - exception).each do |new|
        tmp.push [new, ary[0], ary[2]].sort.find_index(new)
      end
      ntmp = []
      tmp.each do |p|
        if !ntmp.include? p
          ntmp.push p
        end
      end
      if ntmp.length == 1
        result.push ntmp[0] == 0 ? "min" : (ntmp[0] == 1 ? "mid" : "max")
      else
        result.push "?"
      end
      if result[1] != "?"
        break
      end
    else
      index = ary.sort.find_index(ary[2])
      result.push (index == 0 ? "min" : (index == 1 ? "mid" : "max"))
    end
  end
  return result.join ", "
end


arys = [[1, 4, 5], [1, 2, 4], [4, 1, 3], [4, 3, 1], [4, 3, 2]]
# 4, 1, 3
# 4, 3, 1
# 4, 3, 2

arys.each { |a| puts process(a).to_s }
