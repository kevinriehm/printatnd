Printatnd::Application.routes.tap do |routes|
  routes.default_scope = {format: false}

  routes.draw do
    resources :prints, :only => [:index, :new, :create]
    root :to => "prints#new"
    mount Resque::Server.new, :at => "/resque"
  end
end

