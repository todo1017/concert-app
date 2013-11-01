ConcertApp::Application.routes.draw do

  authenticated :admin_user do
    root :to => "home#index"
  end
  authenticated :user do
    root :to => 'home#index'
  end
  devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_scope :user do
    root to: "devise/sessions#new"
    put 'update_plan', :to => 'registrations#update_plan'
  end

  resources :users
  resources :artists
  resources :events
  resources :schedules

end