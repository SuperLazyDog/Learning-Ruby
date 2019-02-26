# 2018/03/15 测试module
module SampleModule
  extend ActiveSupport::Concern
  SampleModuleSelector = [
    :sayHello,
    :sayGoodbye
  ]

  included do
  end

  def runner
    self.send SampleModuleSelector[0]
    self.send SampleModuleSelector[1]
  end
  #------------------------------------------------------------------
  #                2018/03/20   module嵌套测试
  #------------------------------------------------------------------
  module SampleEnumStatus
    Sample_A = 0
    Sample_B = 1
  end

  SampleEnumSelector = {
    SampleEnumStatus::Sample_A => "here is Sample_A",
    SampleEnumStatus::Sample_B => "here is Sample_B"
  }

  def nest_module_test
    puts %Q(#{SampleEnumSelector[SampleEnumStatus::Sample_A]})
    puts %Q(#{SampleEnumSelector[SampleEnumStatus::Sample_B]})
  end
  #------------------------------------------------------------------
  private
    def sayHello
      puts %Q(UUID sayHello)
    end

    def sayGoodbye
      puts %Q(UUID sayGoodbye)
    end
end
