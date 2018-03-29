class Dev
  @@task_log = %Q(
    //---------------------------------------------------------------------
    //                           2018/03/29
    //---------------------------------------------------------------------
    1.
      - :
  )

  @@note_log = %Q(
    //---------------------------------------------------------------------
    //                           お気に入りイシュ
    //---------------------------------------------------------------------
    0. 上限制限, Redisなどの導入
      - ActiveRecord ok
    1. 一覧比較ページならではの検索paramsの検証
      - :inspection 車検
        -- 現状
          どの選択肢を選択肢てもパラーメータが変わらず、
          [2年以上]と見られているらしい
        -- ソースコード
          sub_words << '車検残あり' if params[:inspection].present?
        -- 文字列表示
        　存在する場合は　車検残あり
        -- <strong><red>問題点</done>
          残り期間 1年 2年の絞り込みは実装されていない
      - :lightcar
        -- 現状
        -- ソースコード
        -- 文字列表示
        -- <strong><red>問題点</red>
          単一選択で現状は両方とも選択でき、前者を上書きされる
      - .
        -- 現状
        -- ソースコード
        -- 文字列表示
        -- <strong><red>問題点</red>
    2. historyのcar_field のページングの詳細仕様
    3. 現状の<backgray><strong>検索パラーメータ処理ロジック</done>にはnullを<red><strong>完全に防いでいないらしい</done>

    //---------------------------------------------------------------------
    //                           装備仕様イシュ
    //---------------------------------------------------------------------
    1. 一対一の変更したら、検索パラメーターに大きな影響がありそう ok
    2. お気に入り機能の検索履歴にも影響がある ok

  )
  @@shift_log = %Q(
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
