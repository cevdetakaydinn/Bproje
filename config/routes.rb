Rails.application.routes.draw do
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations'
  }
  get 'weeklyschedules/listFacilities', to: "weeklyschedules#listFacilities"
  get 'weeklyschedules/listDepartments', to: "weeklyschedules#listDepartments"
  resources :weeklyschedules
  resources :lessonhours
  resources :days
  resources :curriculums
  resources :departmentlessons
  resources :lessons
  resources :academicterms
  resources :classrooms
  resources :departmentlicenses
  resources :licenses
  resources :departments
  resources :facilities
  resources :universities
  root to: "home#index"
  post 'weeklyschedules/listSchedules', to: "weeklyschedules#listSchedules"
  get 'weeklyschedules/listSchedules', to: "weeklyschedules#listSchedules"
  post 'addClassrooms', to: "weeklyschedules#addClassrooms"
  get 'addClassrooms', to: "weeklyschedules#addClassrooms"
  post 'saveClassrooms', to: "weeklyschedules#saveClassrooms"
  get 'saveClassrooms', to: "weeklyschedules#saveClassrooms"
  post 'weeklyschedules/deleteSchedule', to: "weeklyschedules#deleteSchedule"
  get 'weeklyschedules/deleteSchedule', to: "weeklyschedules#deleteSchedule"
  get 'instructors', to: "admins/instructors#index"
  delete 'instructors', to: "admins/instructors#destroy"
  post 'instructors', to: "admins/instructors#create"
  patch 'instructors', to: "admins/instructors#update"
  get 'instructors/edit', to: "admins/instructors#edit"
  get 'instructors/new', to: "admins/instructors#new"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
