Rails.application.routes.draw do

  root "session#new"

  resources :session, only: [:new, :create]
    delete 'logout' => 'session#destroy'

  resources :students, only: [:index, :show]

  put "/teams/:team_id/students/:student_id" => "teams#update"
end
