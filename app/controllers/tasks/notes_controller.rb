class Tasks::NotesController < ApplicationController
  before_action :set_task

  def create
    @note = @task.notes.new(note_params)
    @note.user = current_user
    if @note.save
      #redirect_to @task, notice: 'Nota creada exitosamente.'
      #Manejamos la respuesta exitosa
    else
      #redirect_to @task, alert: 'Error al crear la nota.'
      #Manejamos los errores
    end
  end

  def set_task
    @task = Task.find(params[:task_id]) # Encuentra la tarea por el ID proporcionado en los parámetros
  end

  def note_params
    params.require(:note).permit(:body)
  end

  
end