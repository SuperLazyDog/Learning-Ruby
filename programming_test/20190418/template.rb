class B
  FILE_NAME = 'data.txt'
  # @cases_count
  # @cases
  def read_data
    @cases = []
    open(FILE_NAME) do |f|
      @cases_count = f.gets
    end
  end
end

b = B.new
b.read_data
