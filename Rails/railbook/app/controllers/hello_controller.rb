 #2017/05/15    20:00~21:02
 #2017/05/17    02:14~03:20
 #2017/05/18    02:12~03:00
 #2017/05/18    13:30~14:34
 #              15:01~17:05
 #              18:39~19~39
 #              19:48~20:50
 #              23:50~00:47
 #2017/05/19    01:50:~03:35
 #2017/05/19    10.10~13?05 p248
 #2017/05/19    14.33~18:40
 #2017/05/20    10:38~13:27
 #              17:28~20:03
 #2017/05/21    11:02~14:27
 #              18?15~19:33


 #2017/05/22    00:05~00:50
 #2017/05/22    01:57~02:40

 #2017/05/23    03:04~5:46

 #2017/05/25    00:00~3:09  P33


 #2017/05/26    3:20~6:10 P43
 #2017/05/26    19:45~20:38
 #2017/05/26    23:02~
 #                     2017/05/27     01:20   P58

 #2017/05/27    10:00~13:27  P72
 #              23:55～
 #                     2017/05/28     02:25 P78

 #Ruby
 #p223 誤字　少数
 #p230 誤値

 #Rails5

class HelloController < ApplicationController
  def show
    @msg = "12"
  end
  def view
    @msg1 = "I like ruby"
    @msg2 = "I know html/css"
    @msg3 = "I will do my best to learn Ruby on Rails 5"
    @books = Book.all()
  end
  def index
    render plain: "Do my best"
  end

  def list
    @books = Book.all()
  end
end
