Rails.application.routes.draw do
  post  'page/preview'
  get  'page/link/:id', to: 'page#link'
  get   'page/preview'
  # get   'page/link', on: :member
  # match 'page/link/:id'

  resources :images do
    resources :clickables, only: [:create]do
      collection do
        post :destroy_all
      end
    end #clickables
  end

  root to: 'images#new'
end
