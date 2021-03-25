RESERVATION_TABLES = [{
  date: 1
}]

def get_reservation_table(date)
  RESERVATION_TABLES.each do |t|
    if t[:date] == date
      return t
    end
  end
end

def next_day
  # users = {
  #   uid: {sid: blocks}
  # }
  # stores = {
  #   sid: {uid: blocks}
  # }
  new_table = {
    date: RESERVATION_TABLES.last + 1,
    stores: [],
    users:  []
  }
  RESERVATION_TABLES.push new_table
end

def is_past?(ap_date)
  return ap_date.to_i < RESERVATION_TABLES.last[:date].to_i
end

def is_between_opening_time?(store, entry_date, entry_block, durations)
  block = entry_date.to_i
  date = entry_block.to_i
  durations = durations.to_i
  open_hours = store[:open_hours]
  durations.times do |i|
    if block + i > 48
      date += 1
      block = (i+entry_block)%48
    end
    if !open_hours[date].include? block
      return false
    end
  end
  return true
end
#### Stores
# id                    String length: [1,20]
# open-hours            Array
# seat type             Hash
#    id
#    count
#    min    >= 1
#    max    <= 100
STORES = []
def register_store(lines)
  header = lines.shift.chomp.split(' ')
  id = header.shift
  header.shift
  seat_types = []
  (header.length/4).times do |i|
    ci = i*4;
    seat_type = {
      id: header[ci],
      count: header[ci+1].to_i,
      min: header[ci+2].to_i,
      max: header[ci+3].to_i
    }
    seat_types.push seat_type
  end
  open_hours = []
  lines.each do |line|
    open_hours.push line.chomp.split(' ').each(&:to_i)
  end
  store = {
    id: id,
    open_hours: open_hours,
    seat_types: seat_types
  }
  STORES.push store
end

def get_store(id)
  STORES.each do |s|
    if s[:id] == id
      return s
    end
  end
  return nil
end

def get_seat_type(store, tid)
  store[:seat_types].each do |s|
    if s[:id] == tid
      return s
    end
  end
  return nil
end

#### Users
# id
#
USERS = []
def register_user(line)
  user = line.chomp
  if !USERS.include? user
    USERS.push user
  end
end


def is_between_opening_time?(store, entry_date, entry_block, durations)
  block = entry_date.to_i
  date = entry_block.to_i
  durations = durations.to_i
  open_hours = store[:open_hours]
  durations.times do |i|
    if block + i > 48
      date += 1
      block = (i+entry_block)%48
    end
    if !open_hours[date].include? block
      return false
    end
  end
  return true
end

def has_already_reserve_any?(uid, entry_date, entry_block, durations)
  # users = {
  #   uid: {sid: blocks}
  # }
  # stores = {
  #   sid: {uid: blocks}
  # }
  block = entry_date.to_i
  date = entry_block.to_i
  durations = durations.to_i
  table = get_reservation_table date
  durations.times do |i|
    if block + i > 48
      date += 1
      block = (i+entry_block)%48
      table = get_reservation_table date
    end
    if !table[:users][:uid][:sid].include? block
      return true
    end
  end
  return false
end
#### Requests
# id
# UID
# SID
# TID
# entry-time
# blocks
# users-count
REQUESTS = []

# CANCEL {UID} {RID}
def execute_cancel(row)
end
# STOP {SID} {予約停止開始日時} {予約停止期間} {席種(オプション)}
def execute_stop(row)
end
# SHOW {SID} {日付}
def execute_show(row)
end
# LIST
# 店舗情報
def execute_list(row)
end
# REMOVE {SID}
def execute_remove(row)
end

# BASIC     REQUEST {RID} {UID} {SID} {TID} {入店ブロック*2} {滞在ブロック数} {予約人数}
def execute_request(row)
  type = row[0]
  rid = row[1]
  uid = row[2]; register_user uid
  sid = row[3]
  tid = row[4]
  entry_date = row[5]
  entry_block = row[6]
  duration_count = row[7]
  num = row[8]
  store = get_store(sid)
  if store == nil
    puts "Error: No such restaurant"
  end
  seat = get_seat_type(store, tid)
  if seat == nil
    puts "Error: No such table"
    return
  end
  if is_past? entry_date
    puts "Error: Past date is specified"
    return
  end
  if !is_between_opening_time? store, entry_date, entry_block, duration_count
    puts "Error: Closed"
    return
  end
  if has_already_reserve_any?(uid)
    puts "Error: Overlapped reservation"
    return
  end
  if false # TODO
    puts "Error: Too many or too few people"
    return
  end
  if false # TODO
    puts "Error: Unable to divide into groups"
    return
  end
  # TODO accept
  row[0] = "REQUEST-ACCEPTED"
  puts row.join " "
end

# BASIC     NEXT_DAY
def execute_next_day
  next_day
end

def execute_instruction(lines)
  lines.each do |row|
    row = row.chomp
    REQUESTS.push row # restore requests history for customer service
    row = row.split(' ')
    case row[0]
    when "REQUEST"
      execute_request row
    when "NEXT_DAY"
      execute_next_day row
    when "CANCEL"
      execute_cancel row
    when "STOP"
      execute_stop row
    when "SHOW"
      execute_show row
    when "LIST"
      execute_list row
    when "REMOVE"
      execute_remove row
    end
  end
end


def initial_and_process(lines)
  store_info_length = 8
  stores_count = lines.shift.chomp.to_i
  stores_count.times do |i|
    ci = i*store_info_length
    register_store lines[ci...ci+8]
  end
  execute_instruction lines[(store_info_length*stores_count)..-1]
end

initial_and_process(readlines)
