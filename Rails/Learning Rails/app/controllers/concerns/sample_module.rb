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

  private
    def sayHello
      puts %Q(UUID sayHello)
    end

    def sayGoodbye
      puts %Q(UUID sayGoodbye)
    end
end
