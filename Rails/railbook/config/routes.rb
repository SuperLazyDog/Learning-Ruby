Rails.application.routes.draw do
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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
