Rails.application.routes.draw do
  get 'page/preview'
  get 'page/link'

  resources :images

  root to: 'page#preview'
end
