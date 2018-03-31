require 'test_helper'

class SampleModelDecoratorTest < ActiveSupport::TestCase
  def setup
    @sample_model = Pro::SampleModel.new.extend Pro::SampleModelDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
