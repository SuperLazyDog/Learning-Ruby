=begin
 #2017/05/15    20:00~21:02

 #2017/05/17    02:14~03:20
 #2017/05/18    02:12~03:00
 #2017/05/18    13:30~14:34
 #              15:01~17:05
 #              18:39~19~39
 #              19:48~20:50
 #              23:50~00:47
 #2017/05/19    01:50:~03:35
 　　　　　　　　　　　　　　　　　　　 #2017/05/19    10.10~13:05 p248
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


  　　　　　　　　　　　　　　　　　　 　#2017/05/28    12:02~14:33
 #              22:46~
 #                    2017/05/29 00:15

#2017/06/01     4:20~6:20

#2017/06/02     8:23~9:05 P112
  　　　　　　　　　　　　　　　　　　 　#2017/06/02     9:55~19:13
#2017/06/03     00:50~1:21
 #Ruby
 #p223 誤字　少数
 #p230 誤値
  　　　　　　　　　　　　　　　　　　 　#2017/06/03     10:07~13:27
#2017/06/03     21:58~
#                     2017/06/04 00:39
#2017/06/04     12:16~13:30

#2017/06/05     00:10~01:35
#2017/06/05     12:38~14:08


#2017/06/06     00:03~01:30
#               01:50~03:03


#2017/06/07     01:01~01:34 P177
#               12:04~14:01 P182

#2017/06/09     02:01~02:21
  　　　　　　　　　　　　　　　　　　 　#2017/06/09     11:35~19:04


#2017/06/10     00:18~00:55
  　　　　　　　　　　　　　　　　　　 　#2017/06/10     10:06~12:25
#2017/06/10     22：00~
#                     2017/06/11 00:47

#2017/06/11     13:31~14:13
#               22:46~
#                     2017/06/12 02:09

#2017/06/14     00:05~02:12
 #Rails5
 #P180 間違い    yield(:title) ||   -------------> yield(:title).presence ||
=end
class HelloController < ApplicationController
  #layout 'test'
  def show
    @msg = "12"
  end
  # OPTIMIZE: 123
  def view
    @msg1 = "I like ruby"
    @msg2 = "I know html/css"
    @msg3 = "I will do my best to learn Ruby on Rails 5"
    @books = Book.all()
  end
  # FIXME: 123
  def index
    # !! TODO: render 为什么无法设置每一个方法的模板文件  8FCE81E3-B787-48EE-939A-EA091886F406
    render plain: "Do my best"
    #render layout: 'test'
  end

  def sample
    render layout: 'test'
  end

  def list
    # TODO: 123

    @books = Book.all()
  end
end
