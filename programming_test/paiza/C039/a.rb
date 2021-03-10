lines = readlines
# lines = <<~EOS
# <///////+<<</+////
# EOS
# lines = lines.split('\n')

def parser(e, i)
  if i < e.length
    case e[i]
    when "<"
      return 10+parser(e, i+1)
    when '/'
      return 1+parser(e, i+1)
    end
  else
    return 0
  end

end
elements = lines[0].chomp.split('+')
num = 0
elements.each do |e|
  num += parser(e, 0)
end
puts num
