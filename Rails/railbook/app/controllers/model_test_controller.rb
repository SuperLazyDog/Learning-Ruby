class ModelTestController < ApplicationController
  layout 'modelTest'

  def t1
    @model_tests = ModelTest.all
    #-------------------------------------------------------------------------
    #                                test 1
    #-------------------------------------------------------------------------
    @find = ModelTest.find_by(hp: 3000, hp: 1200)
    @a = ModelTest.find(113629430)
    @b = ModelTest.find(1018350795)
    @c = ModelTest.find_by(israre: false)
    @d = ModelTest.find([113629430, 1018350795, 1018350795, 1018350795, 980190962])
    #-------------------------------------------------------------------------
    #                                test 2
    #-------------------------------------------------------------------------
    @where_sample1 = ModelTest.where(hp: 8000)
    @where_sample2 = ModelTest.where(hp: 0..4000)
    @where_sample3 = ModelTest.where(def: [800, 1500, 12, 12, 12])
    @where_sample4 = ModelTest.where(def: [12])
    #一般形式
    #@where_sample5 = ModelTest.where('israre = ? AND def >= ?', false, 1000)
    @where_sample5 = ModelTest.where('israre = :israre AND def >= :def', :def => 1000, israre: false)

    @not = ModelTest.where.not(israre: nil)
    # TODO:  ap无法顺利搜索?   博客 http://control.blog.sina.com.cn/admin/article/article_edit.php?blog_id=dcb875d90102y6jl
    @or = ModelTest.where('ap  <= ?', 1000).or(ModelTest.where('def > :def', :def => 4000))
    #@or = ModelTest.where('israre = ?', false).or(ModelTest.where('israre = ?', true))
    #@or = ModelTest.where('mp <= :mp',  mp: 0).or(ModelTest.where('def < :def', :def => 4000))
    #order
    @order_asc = ModelTest.all.order(ad: :asc)
    @order_desc = ModelTest.all.order(ad: :desc)
    #reorder
    @reorder_nil = ModelTest.where.not('israre = ?', true).order(:hp => :desc).reorder(nil)#.order(hp: :asc)

    #select
    @select_hp = ModelTest.where('hp >= ?', 2000).order(hp: :desc).select(:hp, :ad, :israre)
  end

  def t2
    @models = ModelTest.where.not(israre: nil)
    render 'model_test/modelTest_list'
  end

  def t3
  end

  def t4
  end

  def t5
  end

  def t6
  end

  def t7
  end

  def t8
  end

  def t9
  end

  def t10
  end

  def t11
  end

  def t12
  end

  def t13
  end

  def t14
  end
end
