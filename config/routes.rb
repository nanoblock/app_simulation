Rails.application.routes.draw do

  get  'preview/projects/:project_id/images/:id',to: 'page#preview', as: 'preview_page'
  get 'preview', to: 'page#preview'
  get  'project/:project_id/link/:id', to: 'page#link', as: 'link_page'

  resources :projects do

  resources :images do
    resources :clickables, only: [:create]do
      collection do
        post :destroy_all
      end
    end #clickables
  end

end

  root to: 'projects#new'
end
