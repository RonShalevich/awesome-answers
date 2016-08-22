Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #this defines a route that when we receive a 'GET' request with URL '/home'
  # it will invoke the 'welcome+controller' with 'index' action
  #more verbose get({"/home" => "welcome#index"})
  # this is called DSL: Domain Specific Language. It's just Ruby written in a special way for
  # a special purpose (in this case defining Routes)

  get '/home' => 'welcome#index', as: :home
  get '/about_us' => 'welcome#about', as: :about_us

  get '/contact' => 'contact#new', as: :contact_new

  post '/contact' => 'contact#create', as: :contact_create

  #defining get '/' with root, all in one!

  resources :questions do
    # collection is used when we don't need to specifiy a particular question but we expect a collection of question.
    # Examples: index / create
    # post :search, on: :collection

    # member is used when we need to identify a particular question. Examples are: show/ edit /update /destroy
    # post :search, on: :member

    # THis is when we want to have nested routes for our resources. Example: answers for questions.
    # post :search

    resources :answers, only: [:create, :destroy]
  end

  resources :sessions, only: [:new, :create] do
    #you can use a collection without an id
    delete :destroy, on: :collection
  end

  resources :users, only: [:new, :create]
  #contains everything below

  # get '/questions/new' => 'questions#new', as: :new_question

  # get '/questions/:id' => 'questions#show', as: :question

  # post '/questions' => 'questions#create', as: :questions

  # get '/questions' => 'questions#index'

  # get '/questions/:id/edit' => 'questions#edit', as: :edit_question

  # patch "/questions/:id" => 'questions#update' #don't need a alias because there is one for SHOW '/guestions/:id'

  # delete 'questions/:id' => 'questions#destroy'

  root 'welcome#index'
end
