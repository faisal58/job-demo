Rails.application.routes.draw do

  devise_for :users, {
                       :controllers => { :registrations => "registrations" },
                       :path_names => {
                            sign_in:  :login,
                            sign_out: :logout,
                            sign_up:  :registration
                       }
                   }
  root to: 'home#index'

  get 'jobs' => 'job#index'
  post 'jobs' => 'job#new'

  get 'profile' => 'profile#my_profile', :as => "profile"
  get 'profile/modify' => 'profile#create',  :as => "create_profile"
  patch 'profile/update' => 'profile#update',  :as => "update_profile"
  post 'profile/store' => 'profile#store',  :as => "store_profile"

  # get 'positions' => 'job_front#index'
  resources :job_front, path: 'positions', :only => [ :index, :show ]
  get 'position/job/:id' => 'job_front#job_view', :as => "view_job_by_id"
  get 'position/job/apply/:id' => 'job_front#apply_for_job', :as => "submit_job_application"

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
