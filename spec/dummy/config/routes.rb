Dummy::Application.routes.draw do
  resource :pages, only: [] do
    collection do
      get :basic, :multiple
    end
  end
end
