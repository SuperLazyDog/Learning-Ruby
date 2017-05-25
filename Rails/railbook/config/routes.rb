Rails.application.routes.draw do
  get 'test/1'

  get 'test/2'

  get 'test/3'

  get 'test/4'

  get 'test/5'

  get 'hello/show'
  get "hello/view"
  get "hello/index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
