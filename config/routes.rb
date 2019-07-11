Rails.application.routes.draw do
  get 'pages/homepage'

  resources :highlights
  resources :previews
  resources :reviews
  post '/rate' => 'rater#create', :as => 'rate'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :shops do
  resources :comments, only: [:create, :index, :destroy]
  resources :reviews, except: [:show, :index]
end
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :products do
    resources :previews, except: [:show, :index]
  end
  mount Commontator::Engine => '/commontator'


  resources :charges


get '/cart', to: 'order_items#index'
  resources :order_items, path: '/cart/items'
  get '/cart/checkout', to: 'orders#new', as: :checkout
  patch '/cart/checkout', to: 'orders#create'
  get '/cart/tracking', to: 'orders#show', as: :tracking
  get '/order_tracking', to: 'orders#order_tracking'
  get '/order_status', to: 'orders#order_status'


  
  get 'welcome/home'
  root "welcome#home"
  get 'welcome/rest'
  get 'welcome/old'
  get 'welcome/auto'
  get 'welcome/electronics'
  get 'welcome/fashion'
  get 'welcome/gs'
  get 'welcome/grocery'
  get 'welcome/furniture'
  get 'welcome/health'
  get 'welcome/repair'
  get 'welcome/recent'
  get 'welcome/popular'
  get 'welcome/events'
  get 'welcome/contact'
  get 'welcome/about'
  get 'welcome/search'
  get 'welcome/decor'
  get 'welcome/sny'










  get 'welcome/shop1'
  get 'welcome/shop2'
  get 'welcome/shop3'
  get 'welcome/shop4'
  get 'welcome/shop5'
  get 'welcome/shop6'
  get 'welcome/shop7'
  get 'welcome/shop8'


  get 'welcome/ahp'
  get 'welcome/gav'
  get 'welcome/eap'
  get 'welcome/fap'
  get 'welcome/dap'


get 'welcome/ashop'
get 'welcome/sshop'
get 'welcome/cshop'

















  get 'welcome/hbb1'
  get 'welcome/hbb2'
  get 'welcome/change'
  get 'welcome/filter_search'
  get 'welcome/hbb3'
  get 'welcome/hbb4'
  get 'welcome/hbb5'
  get 'welcome/hbb6'
  get 'welcome/hbb7'
  get 'welcome/hbb8'
  get 'welcome/hbb9'
  get 'welcome/hbb10'
  get 'welcome/hbb11'
  get 'welcome/hbb12'
  get 'welcome/hbb13'
  get 'welcome/hbb14'
  get 'welcome/hbb15'
  get 'welcome/hbb16'
  get 'welcome/hbb17'
  get 'welcome/hbb18'
  get 'welcome/hbb19'
  get 'welcome/hbb20'
  get 'welcome/hbb21'
  get 'welcome/hbb22'
  get 'welcome/hbb23'
  get 'welcome/hbb24'
  get 'welcome/hbb25'
  get 'welcome/hbb26'
  get 'welcome/hbb27'
  get 'welcome/hbb28'
  get 'welcome/hbb29'
  get 'welcome/hbb30'
  get 'welcome/hbb31'
  get 'welcome/hbb32'
  get 'welcome/hbb33'
  get 'welcome/hbb34'
  get 'welcome/hbb35'
  get 'welcome/hbb36'
  get 'welcome/hbb37'
  get 'welcome/hbb38'
  get 'welcome/hbb39'
  get 'welcome/hbb40'
  get 'welcome/hbb41'
  get 'welcome/hbb42'
  get 'welcome/hbb43'
  get 'welcome/hbb44'
  get 'welcome/hbb45'
  get 'welcome/hbb46'
  get 'welcome/hbb47'
  get 'welcome/hbb48'
  get 'welcome/hbb49'
  get 'welcome/hbb50'
  get 'welcome/hbb51'
  get 'welcome/hbb52'
  get 'welcome/hbb53'
  get 'welcome/hbb54'
  get 'welcome/hbb55'
  get 'welcome/hbb56'
  get 'welcome/hbb57'
  get 'welcome/hbb58'
  get 'welcome/hbb59'
  get 'welcome/hbb60'
  get 'welcome/hbb61'
  get 'welcome/hbb62'
  get 'welcome/hbb63'
  get 'welcome/hbb64'
  get 'welcome/hbb65'
  get 'welcome/hbb66'
  get 'welcome/hbb67'
  get 'welcome/hbb68'
  get 'welcome/hbb69'






























  get 'welcome/fh1'
  get 'welcome/fh2'
  get 'welcome/fh3'
  get 'welcome/fh4'
  get 'welcome/fh5'
  get 'welcome/fh6'
  get 'welcome/fh7'
  get 'welcome/fh8'
  get 'welcome/fh9'
  get 'welcome/fh10'
  get 'welcome/fh11'
  get 'welcome/fh12'
  get 'welcome/fh13'
  get 'welcome/fh14'
  get 'welcome/fh15'
  get 'welcome/fh16'
  get 'welcome/fh17'
  get 'welcome/fh18'
  get 'welcome/fh19'
  get 'welcome/fh20'
  get 'welcome/fh21'
  get 'welcome/fh22'
  get 'welcome/fh23'
  get 'welcome/fh24'
  get 'welcome/fh25'
  get 'welcome/fh26'
  get 'welcome/fh27'
  get 'welcome/fh28'
  get 'welcome/fh29'
  get 'welcome/fh30'
  get 'welcome/fh31'
  get 'welcome/fh32'
  get 'welcome/fh33'
  get 'welcome/fh34'
  get 'welcome/fh35'
  get 'welcome/fh36'
  get 'welcome/fh37'
  get 'welcome/fh38'
  get 'welcome/fh39'
  get 'welcome/fh40'
  get 'welcome/fh41'
  get 'welcome/fh42'
  get 'welcome/fh43'
  get 'welcome/fh44'
  get 'welcome/fh45'
  get 'welcome/fh46'
  get 'welcome/fh47'
  get 'welcome/fh48'
  get 'welcome/fh49'
  get 'welcome/fh50'
  get 'welcome/fh51'
  get 'welcome/fh52'
  get 'welcome/fh53'
  get 'welcome/fh54'
  get 'welcome/fh55'
  get 'welcome/fh56'
  get 'welcome/fh57'
  get 'welcome/fh58'
  get 'welcome/fh59'
  get 'welcome/fh60'
  get 'welcome/fh61'
  get 'welcome/fh62'
  get 'welcome/fh63'
  get 'welcome/fh64'































  get 'welcome/fa1'
  get 'welcome/fa2'
  get 'welcome/fa3'
  get 'welcome/fa4'
  get 'welcome/fa5'
  get 'welcome/fa6'
  get 'welcome/fa7'
  get 'welcome/fa8'
  get 'welcome/fa9'
  get 'welcome/fa10'
  get 'welcome/fa11'
  get 'welcome/fa12'
  get 'welcome/fa13'
  get 'welcome/fa14'
  get 'welcome/fa15'
  get 'welcome/fa16'
  get 'welcome/fa17'
  get 'welcome/fa18'
  get 'welcome/fa19'
  get 'welcome/fa20'
  get 'welcome/fa21'
  get 'welcome/fa22'
  get 'welcome/fa23'
  get 'welcome/fa24'
  get 'welcome/fa25'
  get 'welcome/fa26'
  get 'welcome/fa27'
  get 'welcome/fa28'
  get 'welcome/fa29'
  get 'welcome/fa30'
  get 'welcome/fa31'
  get 'welcome/fa32'
  get 'welcome/fa33'
  get 'welcome/fa34'
  get 'welcome/fa35'
  get 'welcome/fa36'
  get 'welcome/fa37'
  get 'welcome/fa38'
  get 'welcome/fa39'
  get 'welcome/fa40'
  get 'welcome/fa41'
  get 'welcome/fa42'
  get 'welcome/fa43'
  get 'welcome/fa44'
  get 'welcome/fa45'
  get 'welcome/fa46'
  get 'welcome/fa47'
  get 'welcome/fa48'
  get 'welcome/fa49'
  get 'welcome/fa50'
  get 'welcome/fa51'
  get 'welcome/fa52'
  get 'welcome/fa53'
  get 'welcome/fa54'
  get 'welcome/fa55'
  get 'welcome/fa56'
  get 'welcome/fa57'
  get 'welcome/fa58'
  get 'welcome/fa59'
  get 'welcome/fa60'












































  get 'welcome/gv1'
  get 'welcome/gv2'
  get 'welcome/gv3'
  get 'welcome/gv4'
  get 'welcome/gv5'
  get 'welcome/gv6'
  get 'welcome/gv7'
  get 'welcome/gv8'
  get 'welcome/gv9'
  get 'welcome/gv10'
  get 'welcome/gv11'
  get 'welcome/gv12'
  get 'welcome/gv13'
  get 'welcome/gv14'
  get 'welcome/gv15'
  get 'welcome/gv16'
  get 'welcome/gv17'
  get 'welcome/gv18'
  get 'welcome/gv19'
  get 'welcome/gv20'
  get 'welcome/gv21'
  get 'welcome/gv22'
  get 'welcome/gv23'
  get 'welcome/gv24'
  get 'welcome/gv25'
  get 'welcome/gv26'
  get 'welcome/gv27'
  get 'welcome/gv28'
  get 'welcome/gv29'
  get 'welcome/gv30'
  get 'welcome/gv31'
  get 'welcome/gv32'
  get 'welcome/gv33'
  get 'welcome/gv34'
  get 'welcome/gv35'
  get 'welcome/gv36'
  get 'welcome/gv37'
  get 'welcome/gv38'
  get 'welcome/gv39'
  get 'welcome/gv40'
  get 'welcome/gv41'
  get 'welcome/gv42'























  get 'welcome/ea1'
  get 'welcome/ea2'
  get 'welcome/ea3'
  get 'welcome/ea4'
  get 'welcome/ea5'
  get 'welcome/ea6'
  get 'welcome/ea7'
  get 'welcome/ea8'
  get 'welcome/ea9'
  get 'welcome/ea10'
  get 'welcome/ea11'
  get 'welcome/ea12'
  get 'welcome/ea13'
  get 'welcome/ea14'
  get 'welcome/ea15'
  get 'welcome/ea16'
  get 'welcome/ea17'
  get 'welcome/ea18'
  get 'welcome/ea19'
  get 'welcome/ea20'


















  get 'welcome/te1'
  get 'welcome/te2'
  get 'welcome/te3'
  get 'welcome/te4'
  get 'welcome/te5'
  get 'welcome/te6'
  get 'welcome/te7'
  get 'welcome/te8'























  get 'welcome/do1'
  get 'welcome/do2'
  get 'welcome/do3'
  get 'welcome/do4'
  get 'welcome/do5'
  get 'welcome/do6'
  get 'welcome/do7'
  get 'welcome/do8'
  get 'welcome/do9'
  get 'welcome/do10'
  get 'welcome/do11'






















  get 'welcome/bt1'
  get 'welcome/bt2'
  get 'welcome/bt3'
  get 'welcome/bt4'
  get 'welcome/bt5'
  get 'welcome/bt6'

















  get 'welcome/sa1'
  get 'welcome/sa2'
  get 'welcome/sa3'
  get 'welcome/sa4'
  get 'welcome/sa5'





















  get 'welcome/hsr1'
  get 'welcome/hsr2'
  get 'welcome/hsr3'
  get 'welcome/hsr4'
  get 'welcome/hsr5'
  get 'welcome/hsr6'
  get 'welcome/hsr7'
  get 'welcome/hsr8'
  get 'welcome/hsr9'
  get 'welcome/hsr10'
  get 'welcome/hsr11'













  get 'welcome/ren1'
  get 'welcome/ren2'
  get 'welcome/ren3'
  get 'welcome/ren4'
  get 'welcome/ren5'
























  get 'welcome/hard1'
  get 'welcome/hard2'
  get 'welcome/hard3'
  get 'welcome/hard4'
  get 'welcome/hard5'
  get 'welcome/hard6'
  get 'welcome/hard7'
  get 'welcome/hard8'
  get 'welcome/hard9'
  get 'welcome/hard10'
  get 'welcome/hard11'
  get 'welcome/hard12'
  get 'welcome/hard13'
  get 'welcome/hard14'




















  get 'welcome/wed1'
  get 'welcome/wed2'
  get 'welcome/wed3'
  get 'welcome/wed4'
  get 'welcome/wed5'
  get 'welcome/wed6'
  get 'welcome/wed7'
  get 'welcome/wed8'
  get 'welcome/wed9'
  get 'welcome/wed10'
  get 'welcome/wed11'
  get 'welcome/wed12'
  get 'welcome/wed13'
  get 'welcome/wed14'
  get 'welcome/wed15'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # new routes
  resources :registeration_numbers do
    resources :orders, controller: 'registeration_numbers/orders'
  end
  post :get_cities_by_state,       action: :get_cities_by_state, controller: :products
  post :get_areas_by_city,       action: :get_areas_by_city, controller: :products

   get "/users/auth/facebook", to: "users#sign_in"
   get "/users/auth/twitter", to: "users#sign_in"
   get "/users/auth/google_oauth2", to: "users#sign_in"
   devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", registrations: "users/registrations" , sessions: "users/sessions"}

end
