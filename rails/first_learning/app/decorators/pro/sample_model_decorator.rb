module Pro::SampleModelDecorator
  def link(title=text)
    link_to title, pro_decorator_test_t2_path
  end
end
