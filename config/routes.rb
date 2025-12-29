Rails.application.routes.draw do
  devise_for :users # Ruta para la autenticación de usuarios con Devise
  resources :tasks do
    # Rutas RESTful para las tareas
    resources :notes, only: [:create], controller:'tasks/notes' # Rutas anidadas para notas dentro de tareas
  end

  resources :categories # Rutas RESTful para las categorías
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'tasks#index' # Ruta raíz que apunta al índice de tareas
end
