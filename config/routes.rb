Rails.application.routes.draw do
  get 'page/preview'

  get 'page/link'

  root to: 'page#preview'

end
