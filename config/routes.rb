Rails.application.routes.draw do
  devise_for :users # Ruta para la autenticación de usuarios con Devise
  resources :tasks # Rutas RESTful para las tareas
  resources :categories # Rutas RESTful para las categorías
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
