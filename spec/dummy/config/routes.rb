Dummy::Application.routes.draw do
  resource :pages, only: [] do
    collection do
      get :basic, :multiple
    end
  end

  resource :mail, controller: 'Mail', only: [] do
    collection do
      get :send_mail
    end
  end
end
