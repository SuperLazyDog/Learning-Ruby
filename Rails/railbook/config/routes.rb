Rails.application.routes.draw do
  get 'questionnaire/t1'

  get 'questionnaire/t2'

  get 'questionnaire/t3'

  get 'questionnaire/t4'

  get 'questionnaire/t5'

  get 'questionnaire/t6'

  get 'questionnaire/t7'

  get 'questionnaire/t8'

  get 'questionnaire/t9'

  get 'questionnaire/t10'

  namespace :devise do
    get 'user/t1'
    get 'user/t2'
    get 'user/t3'
    get 'user/t4'
    get 'user/t5'
    get 'user/t6'
    get 'user/t7'
    get 'user/t8'
    get 'user/t9'
  end

  get 'google_map_test/t1'

  get 'google_map_test/t2'

  get 'google_map_test/t3'

  get 'google_map_test/t4'

  get 'google_map_test/t5'

  get 'google_map_test/t6'

  get 'google_map_test/t7'

  get 'google_map_test/t8'

  get 'google_map_test/t9'

  get 'google_map_test/t10'

  get 'scraping_test/t1'

  get 'scraping_test/t2'

  get 'scraping_test/t3'

  get 'scraping_test/t4'

  get 'scraping_test/t5'

  get 'scraping_test/t6'

  get 'scraping_test/t7'

  get 'scraping_test/t8'

  get 'scraping_test/t9'

  get 'scraping_test/t10'

  #scope :test do
    get 'login', to: 'login#t1'
    get 'login/t1'

    get 'login/t2'
    post 'login/t2'

    get 'login/t3'
    post 'login/t3'

    get 'login/t4'

    get 'login/t5'

    get 'login/t6'

    get 'login/t7'

    get 'login/t8'

    get 'login/t9'

    get 'login/t10'
  #end

  get 'controller_test/t1'

  get 'controller_test/t2'

  get 'controller_test/t3'

  get 'controller_test/t4'

  get 'controller_test/t5'

  get 'controller_test/t6'

  get 'controller_test/t7'

  get 'controller_test/t8'

  get 'controller_test/t9'

  get 'controller_test/t10'

  get 'model_test/t1'

  get 'model_test/t2'

  get 'model_test/t3'

  get 'model_test/t4'

  get 'model_test/t5'

  get 'model_test/t6'

  get 'model_test/t7'

  get 'model_test/t8'

  get 'model_test/t9'

  get 'model_test/t10'

  get 'model_test/t11'

  get 'model_test/t12'

  get 'model_test/t13'

  get 'model_test/t14'

  post 'test/t2'#, to: 'test#t2'
  post 'controller_test/t1'
  post 'controller_test/t2'
  post 'controller_test/t3'

  get 'view_test/t1'

  get 'view_test/t2'


  get 'view_test/t3'

  get 'view_test/t4'
  post 'view_test/t4'

  get 'view_test/t5'

  get 'view_test/t6'

  get 'view_test/t7'

  get 'view_test/t8'

  get 'view_test/t9'

  get 'view_test/t10'

  get 'view_test/t11'

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


  root to: 'devise/user#t1'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
