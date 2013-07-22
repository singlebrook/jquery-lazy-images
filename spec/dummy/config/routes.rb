Dummy::Application.routes.draw do
  resource :pages, only: [] do
    collection do
      get :basic, :multiple
    end
  end

  resource :mailings, only: [] do
    collection do
      get :send_mail
    end
  end
end
