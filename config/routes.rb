Rails.application.routes.draw do
  
  namespace :api do
    namespace :v1 do
      get 'students' => 'mentor#students', :as => 'students'

      namespace :accounts do
        post 'sign_in' => 'sessions#create', :as => 'sign_in'
        post 'sign_up' => 'users#create', as: 'sign_up'
        get 'edit' => 'users#edit', as: 'edit'
        get 'info' => 'users#show', as: 'info'
        put 'update' => 'users#update', as: 'update'
        delete 'delete' => 'users#delete', as: 'delete'
      end
    end
  end

  get 'home' => 'static_pages#home', :as => 'home'

  get 'learn' => 'static_pages#learn', :as => 'learn'

  get 'student_learn' => 'static_pages#student_learn', :as => 'student_learn'

  get 'sign_in' => 'static_pages#sign_in', :as => 'sign_in'

  get 'sign_up' => 'static_pages#sign_up', :as => 'sign_up'

  get 'sign_out' => 'static_pages#sign_out', :as => 'sign_out'

  get 'dashboard' => 'static_pages#dashboard', :as => 'dashboard'

  get 'dashboard/:id' => 'static_pages#dashboard'

  get 'dashboard/add' => 'static_pages#dashboard'

  root 'static_pages#home'

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
