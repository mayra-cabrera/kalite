KaliteApp::Application.routes.draw do

  resources :subsystems

  resources :systems

  namespace :management do resources :programmers end

  namespace :management do resources :administrators end

  get 'concepts/show_content'
  
  devise_for :administrators, :skip => [:sessions]
  as :administrator do
    get 'signin' => 'devise/sessions#new', :as => :new_administrator_session
    post 'signin' => 'devise/sessions#create', :as => :administrator_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_administrator_session
  end

  devise_for :programmers, :skip => [:sessions]
  as :programmer do
    get 'programmers/signin' => 'devise/sessions#new', :as => :new_programmer_session
    post 'programmers/signin' => 'devise/sessions#create', :as => :programmer_session
    delete 'programmers/signout' => 'devise/sessions#destroy', :as => :destroy_programmer_session
  end


  get 'administrator_home/show_formal_technical_reviews/'
  get 'administrator_home/display_options/'
  get 'administrator_home/help_options/'
  get 'administrator_home/rtf_detail/'
  get 'administrator_home/show_results/'
  get 'formal_technical_revision/new_rtf/'
  get 'formal_technical_revision/choose_programmer_and_model/'
  get 'formal_technical_revision/choose_attributes_per_model/'
  get 'formal_technical_revision/choose_concepts/'
  get 'formal_technical_revision/save_rtf/'
  get 'formal_technical_revision/save_rtf/'
  get 'programmer_home/show_formal_technical_reviews/'
  get 'programmer_home/rtf_detail/'
  get 'programmer_home/show_results/'
  get 'programmer_home/help_options/'

  get 'execute_rtf/import_file/'
  post 'execute_rtf/create_file/'
  get 'execute_rtf/read_file/'
  get 'execute_rtf/show_concepts/'
  get 'execute_rtf/evaluate_concepts/'
  get 'execute_rtf/show_results/'
  
  get 'rtf_use_cases/import_file_domain/'
  get 'rtf_use_cases/import_file/'
  post 'rtf_use_cases/import_file/'
  post 'rtf_use_cases/create_file_domain/'
  put 'rtf_use_cases/create_file_domain/'
  post 'rtf_use_cases/create_file/'
  put 'rtf_use_cases/create_file/'
  get 'rtf_use_cases/evaluate_automatic_concepts/'
  get 'rtf_use_cases/show_concepts/'
  get 'rtf_use_cases/evaluate_concepts/'
  get 'rtf_use_cases/show_results/'
  
  root :to => "home#index"
  
  namespace :administrator do
    root :to => 'administrator_home#show_formal_technical_reviews'
  end
  
  namespace :programmer do 
    root :to => 'programmer_home#show_formal_technical_reviews'
  end
  
  
  resources :administrator_home, :programmer_home, :diagrams, :concepts, :attributes, :sections, :system_types, :formal_technical_revision, :assignments
  
end
