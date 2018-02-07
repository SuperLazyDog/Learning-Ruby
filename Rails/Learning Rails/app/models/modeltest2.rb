class Modeltest2 < ApplicationRecord
  belongs_to :modeltest1
  #改变迁移文件上定义的数据类型
  #attribute :b, :float
end
