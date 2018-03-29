class Dev
  @@task_log = %Q(
    //---------------------------------------------------------------------
    //                          Sample Test
    //---------------------------------------------------------------------
    1. item 1
      - sub item 1
        -- sub sub item 1
    2. item 2
      - sub item 2
        -- sub sub item 2
  )
  @@note_log = %Q(
    //---------------------------------------------------------------------
    //                          Sample Test
    //---------------------------------------------------------------------
    1. item 1
      - sub item 1
        -- sub sub item 1
    2. item 2
      - sub item 2
        -- sub sub item 2
  )
  @@shift_log = %Q(
    //---------------------------------------------------------------------
    //                          Sample Test
    //---------------------------------------------------------------------
    1. item 1
      - sub item 1
        -- sub sub item 1
    2. item 2
      - sub item 2
        -- sub sub item 2
  )

  def print_task
    puts replace_item_mark_with @@task_log
  end

  def print_note
    puts replace_item_mark_with @@note_log
  end

  def print_shift
    puts replace_item_mark_with @@shift_log
  end

  def replace_item_mark_with(mark='●', str)
    # タグのネストはサポートされていない
    # 終了タグは一個で
    str.gsub! '<strong>', "\e[1m"
    str.gsub! '<red>', "\e[31m"
    str.gsub! '<backgray>', "\e[100m"
    str.gsub! %r(</.*?>), "\e[0m"
    # str.gsub! '--', "△"
    str.gsub! %r(\s-\s), ' ' + mark.first + ' '
    str.gsub! %r(\s--\s), ' '+mark+mark+' '
  end
end
