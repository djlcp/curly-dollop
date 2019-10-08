Rails.application.routes.draw do
  devise_for :employers
  devise_for :employees
  # For details on the DSL available within this file, see https://guides.rubyonrails.or/routing.html
end
