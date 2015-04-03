Jobseekers::Application.routes.draw do
  resources :categories

  resources :employments

  resources :educations

  root "pages#home"
  get "home", to: "pages#home", as: "home"
  get "inside", to: "pages#inside", as: "inside"
  get "/contact", to: "pages#contact", as: "contact"
  post "/emailconfirmation", to: "pages#email", as: "email_confirmation"

  get "jobs", to: "pages#jobs", as: "jobs"
  get "jobs/:id", to: "pages#show_job", as: "job"
  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
    get "jobs/drafts", to: "jobs#drafts", as: "jobs_drafts"
    get "jobs/dashboard", to: "jobs#dashboard", as: "jobs_dashboard"
    resources :jobs
  end

end
