Rails.application.routes.draw do
  resources :candidates do
    member do      #方法二
      post :vote
    end
    # collection do
    #   post :vote
    # end
  end
end