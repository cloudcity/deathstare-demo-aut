Widgets::Application.routes.draw do

  namespace :api, defaults: {format: 'json'} do

    post 'client_devices' => 'client_devices#create'

    post 'widget' => 'widget#create'
    get 'widget' => 'widget#index'
    delete 'widget' => 'widget#destroy'

    post 'login' => 'login#create'
    post 'users' => 'users#create'

  end
end
