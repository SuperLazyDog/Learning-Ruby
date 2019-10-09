require 'rails_helper'

# RSpec.describe Book, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
RSpec.describe 'add num' do
  it '1+1=2' do
    expect(1+1).to eq 2
  end

  it '1+0=0+1' do
    expect(1+0).to eq 0+1
  end

  it 'n*0=0' do
    (1..100).each do |i|
      expect(i*0).to eq 0
    end
  end
end

RSpec.describe Book do
  describe '#title' do
    it 'title a' do
      book = Book.create(title: 'a')
      expect(book.title).to eq('a')
    end
  end
end
