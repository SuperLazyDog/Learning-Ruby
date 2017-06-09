Rails.application.routes.draw do
  post 'test/t2'#, to: 'test#t2'
  get 'view_test/t1'

  get 'view_test/t2'


  get 'view_test/t3'

  get 'view_test/t4'

  get 'view_test/t5'

  get 'view_test/t6'

  resources :fan_comments
  resources :reviews
  resources :authors
  resources :users
  resources :books
=begin
  resources :test
  resources :hello
=end

  get 'test/t1'

  get 'test/t2'

  get 'test/t3'

  get 'test/t4'

  get 'test/t5'#, to: 'hello#view'

  get'test/nothing'

  get 'hello/show'

  get "hello/view"

  get "hello/index"

  get "hello/list", to: 'hello#list'

  get "hello/sample", to: 'hello#view'

  get "大神罩我", to: 'hello#view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
