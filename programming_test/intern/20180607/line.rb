def main(argv)
  argv.each_index do |i|
    v = argv[i]
    puts "argv[#{i}]: #{v}"
  end
end

# スケジュール
TIMETABLE_A = {
    A1: [],
    A2: [],
    A3: [],
    A4: [],
    A5: [],
    A6: [],
    A7: [],
    A8: [],
    A9: [],
    A10: [],
    A11: [],
    A12: [],
    A13: []
}

TIMETABLE_B = {
    B1: [],
    B2: [],
    B3: [],
    B4: [],
    B5: [],
    A7: []
}
COST_A = [0, 3, 5, 2 ,3, 4, 3, 4, 2, 2, 3, 6 ,2] # 上り順 An-2
COST_B = [0, 4, 3, 3, 2, 3] # Bn-2
def init_A1
    time = get_time_from 5, 55
    over_time = get_time_from 11, 0
    is_a7 = true
    while lt time, over_time
      i = 0
      puts "is_a7: #{is_a7}"
      offset = 0
      TIMETABLE_A.each do |k, v|
        offset += COST_A[i]
        puts "is_a7 && i>=7: #{is_a7 && i>=7}"
        if is_a7 && i>=7
          break
        end
        v.push time_up_by(0, offset, time)
        i += 1
      end
      is_a7 = !is_a7
      time = time_up_by 0, 5, time
    end
end

def init_A7_A
  time = get_time_from 6, 6
  over_time = get_time_from 11, 0
  a7_a1_count = 31
  count = 0
  while count <= a7_a1_count
    offset = 0
    (1..7).to_a.reverse.each do |index|
      TIMETABLE_A["A#{index}".to_sym].push time_up_by(0, offset, time)
      offset += COST_A[index-1]
    end
    count += 1
    time = time_up_by 0, 10, time
  end


  time = get_time_from 6, 10
  offset = 0
  (7..13).to_a.each do |index|
    TIMETABLE_A["A#{index}".to_sym].push time_up_by(0, offset, time)
    offset += COST_A[index] if index < 13
  end
end

def init_A13
  time = get_time_from 5, 52
  over_time = get_time_from 11, 0
  while lt time, over_time
    next_time = time_up_by 0, 10, time
    offset = 0
    (1..13).to_a.reverse.each do |index|
      break if !lt(next_time, over_time) && index <= 6
      TIMETABLE_A["A#{index}".to_sym].push time_up_by(0, offset, time)
      offset += COST_A[index-1]
    end
    time = next_time
  end
end

def init_B1
  time = get_time_from 6, 0
  over_time = get_time_from 11, 0
  while lt time, over_time
    offset = 0
    i = 0
    TIMETABLE_B.each do |k, v|
      offset += COST_B[i]
      i += 1
      v.push time_up_by 0, offset, time
    end
    time = time_up_by 0, 6, time
  end
end

def init_A7_B
  time = get_time_from 6, 11
  over_time = get_time_from 11, 0
  fixed_count = 50
  count = 0
  while count <= 2#fixed_count
    offset = 0
    i = 5
    TIMETABLE_B.each do |k, v|
      v.push time_up_by 0, offset, time
      offset += COST_B[i]
      i -= 1
    end
    count += 1
    time = time_up_by 0, 6, time
  end
end

# 時刻の処理
# [hour, min]
def get_time_from(hour, min)
    return [hour, min]
end

def time_up_by(hour, min, t)
    t_ = t.dup
    t_[1] += min
    t_[0] += (hour+t_[1]/60)
    t_[1] %= 60
    t_
end

def get_str_of(time)
    t = time.dup
    if t[0] < 10
        t[0] = '0'+t[0].to_s
    end
    if t[1] < 10
        t[1] = '0'+t[1].to_s
    end
    t.join ':'
end

def distance(t1, t2)
    h = t1[0]-t2[0]
    m = t1[1]-t2[1]
    h += m/60
    m %= 60
    [h, m]
end

def get_second_of(t)
    t[0]*60 + t[1]
end

def bt(t1, t2) # bigger than
    get_second_of(t1) > get_second_of(t2)
end

def lt(t1, t2) # less than
  get_second_of(t1) < get_second_of(t2)
end

def eq(t1, t2)
    get_second_of(t1) == get_second_of(t2)
end


# init_A1
# init_A7_A
# init_A13
# TIMETABLE_A.each do |k, v|
#   puts "#{v}"
# end
# TIMETABLE_A.each do |k, v|
#   puts v.uniq.count
# end

# init_B1
init_A7_B
TIMETABLE_B.each do |k, v|
  puts "#{v}"
end
TIMETABLE_B.each do |k, v|
  puts v.uniq.count
end
