require 'rails_helper'

# RSpec.describe Book, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
# RSpec.describe 'add num' do
#   it '1+1 = 2' do
#     expect(1+1).to eq 2
#   end
#
#   it '1+0 = 0+1' do
#     expect(1+0).to eq 0+1
#   end
#
#   it 'n*0 = 0' do
#     (1..100).each do |i|
#       expect(i*0).to eq 0
#     end
#   end
# end

# RSpec.describe Book do
#   before do
#     @book  =  Book.create(title: 'a')
#     puts "UUID A"
#   end
#   describe '#title' do
#     before { puts "UUID B" }
#     it 'title a' do
#       expect(@book.title).to eq('a')
#     end
#   end
#
#   describe '#title b' do
#     before { puts "UUID C" }
#     it 'title a' do
#       expect(@book.title).to eq('a')
#     end
#   end
# end

RSpec.describe Book do
  let(:book) { Book.create(title: title) }
  subject { book.title }
  shared_examples 'sample' do
    it { is_expected.to eq(title) }
  end
  shared_context 'title = a' do
    let(:title) { 'a' }
  end
  shared_context 'title = b' do
    let(:title) { 'b' }
  end
  context '#title  =  a' do
    # skip '>>>' # skip test
    include_context 'title = a'
    it_behaves_like 'sample'
  end
  context '#title  =  b' do
    include_context 'title = b'
    # pending 'must be error' # pending test
    it_behaves_like 'sample'
  end
  it { expect([]).to be_blank }
end
