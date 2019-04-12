Rails.application.routes.draw do
  get '/', to: 'leads#home'
  post '/', to: 'leads#lead', as: :leads
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
