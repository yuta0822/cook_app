Rails.application.routes.draw do

  get 'cooks/index'
  root to: "cooks#index"
end
