Rails.application.routes.draw do

  resources :students do
    collection { post :upload }
    collection { get :import }
  end

  root "session#new"

  resources :users, :except => [:delete]

  resources :session, only: [:new, :create]
    delete 'logout' => 'session#destroy'

  resources :students, only: [:index, :import, :show]

  put "/teams/:team_id/students/:student_id" => "teams#update"

end
