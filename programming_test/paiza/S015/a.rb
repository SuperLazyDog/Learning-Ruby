# 整数 k に対して、レベル k の ABC 文字列を次で定義します。
#
# ・レベル 1 の ABC 文字列は "ABC" です。
# ・レベル k の ABC 文字列は "A" + (レベル k - 1 の ABC 文字列) + "B" + (レベル k - 1 の ABC 文字列) + "C" です。
# 　・例 : レベル 2 の ABC 文字列は "A" + "ABC" + "B" + "ABC" + "C" = "AABCBABCC" となります。
#
# レベル k の ABC 文字列の s 文字目から t 文字目までを求めてください。
data = readlines[0].split(' ').map { |s| s.to_i }

# def build_str(k)
#   if k <= 1
#     return "ABC"
#   else
#     return "A" + build_str(k-1) + "B" + build_str(k-1) + "C"
#   end
# end
#
# puts build_str(data[0])[(data[1]-1)..(data[2]-1)]

ss = ['A', 'B', 'C']
def build_str(k)
  if k <= 1
    return [0,1,2]
  else
    return [0] + build_str(k-1) + [1] + build_str(k-1) + [2]
  end
end

puts build_str(data[0])[(data[1]-1)..(data[2]-1)].map { |i|  ss[i] }.join
