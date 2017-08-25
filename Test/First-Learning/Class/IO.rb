#IO Class Test

#2017/05/15    20:00~21:02
#2017/05/17    02:14~03:20
#2017/05/18    02:12~03:00
#2017/05/18    13:30~14:34
#              15:01~17:05
#              18:39~19~39
#              19:48~20:50
#              23:50~00:47
#2017/05/19    01:50:~03:35
#2017/05/19    10.10~13：05 p248



#2017/05/19    14.33~

#2017/05/20    10:38~13:27
#2017/05/20    17:28~20:03

#p223 誤字　少数
#p230 誤値

#-------------------------------------------------------------
#                         library
#-------------------------------------------------------------
#-------------------------------------------------
#                 close file safely
#-------------------------------------------------
#lib
def closeFileSafely(file)
  if !file.closed?()
    file.close()
  end
end

def isFileClosed(file)
  if file.closed?()
    puts("closed")
  else
    puts("wrong: cannot close file")
  end
end

#-------------------------------------------------
#                 show file
#-------------------------------------------------
def showFile(file)
  file.each_line() do |line|
    printf("%3d: %s", file.lineno, line)
  end
end

def showFileWithClose(file)
  file.each_line() do |line|
    printf("%3d: %s", file.lineno, line)
  end
  closeFileSafely(file)
end

def showFilebyName(file)
  file = File.open(file, "r")
  file.each_line() do |line|
    printf("%3d: %s", file.lineno, line)
  end
end

def showFileWithClosebyName(file)
  puts("start")
  file = File.open(file, "r")
  file.each_line() do |line|
    printf("%3d: %s", file.lineno, line)
  end
  closeFileSafely(file)
  puts("end")
end
#lib over
#-------------------------------------------------------------
#                         IO Class
#-------------------------------------------------------------
3.times do |temp|
  $stdout.puts("#{Random.rand(100)}")
  $stderr.puts "count : #{temp + 1}"
  STDOUT.puts("just a test")
end


if STDIN.tty?
  puts("stdin is now connectedd with stdin")
else
  puts("wrong")
end


#-------------------------------------------------------------
#                         File Class
#-------------------------------------------------------------
#creat and  close
file = File.open("test.txt", "r+")
file.puts("hello, Weida")
file.close()
if file.closed?()
  puts("closed")
else
  puts("not closed")
end

#read
str = "Line: "
strEnd = " "
count = 1

while line = STDIN.gets()
  lineTmp = line.chomp!()
  if lineTmp == "q"
    #puts(lineTmp)
    break
    puts("breaked")
  end
  puts(str + "#{STDIN.lineno}" + strEnd + line)
  count += 1
end
#puts("isEnd? #{STDIN.eof?()}")



file = File.open("test.txt", "r")
p(file.gets())
file.close()
closeFileSafely(file)
isFileClosed(file)



puts("---------------------------------------")
puts("              getc")
puts("---------------------------------------")
count = 1
p("count: #{count}")
file = File.open("test.txt", "a+")
file.getc()
file.ungetc("                SSSSSSSSSSSSSSSSSSSS                     over")
showFileWithClose(file)



puts("---------------------------------------")
puts("              io.write")
puts("---------------------------------------")
temp = STDOUT.write("test")
puts(temp)
puts("fkjldshkljasdhfads".length)
str << "a" << "b" << "c"
File.write("test.txt", str)
showFileWithClosebyName("test.txt")
