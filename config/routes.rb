Rails.application.routes.draw do

  get  'page/preview/:id',to: 'page#preview', as: 'preview_page'
  get 'page/preview', to: 'page#preview'
  get  'page/link/:id', to: 'page#link', as: 'link_page'
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
