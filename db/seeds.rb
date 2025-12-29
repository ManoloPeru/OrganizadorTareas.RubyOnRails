['juan', 'andrea', 'leon', 'andres', 'natalia', 'camilo', 'rusbel', 'johan'].each do |name|
  # Crear usuarios con correos electrónicos y contraseñas predeterminadas
  User.create email: "#{name}@assetec.org", password: '123456'
end
puts 'Users has been created'

['desarrollo', 'mercadeo', 'conceptualización', 'ejercicios'].each do |name|
  # Crear categorías con descripciones predeterminadas
  Category.create name: name, description: '--'
end
puts 'Categories has been created'

  
owner = User.find_by(email: 'johan@assetec.org')
# Crear tareas con participantes asignados
[
  ['conceptualización', 'Bienvenida ', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', '¿Qué es ruby on rails y por qué usarlo?', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Entorno de desarrollo de RoR', ['juan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Instalación de Ruby, RoR en windows y Linux', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Entender la web con rieles', ['juan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Crear una nueva aplicación RoR ¡Hola Rails!', ['juan:1', 'leon:2', 'andrea:random']],
  ['ejercicios', 'Manipular el patrón MVC', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', '¿Qué vamos a desarrollar?', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Crear la base de nuestra aplicación', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Los secretos de rails', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Assets y Layouts', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Diseñar el modelo de datos', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Agregar primer conjunto de scaffolds', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Cómo entender las migraciones', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Esteroides para tu desarrollo - HAML', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Esteroides para tu desarrollo - Simple Form', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Regenerando el primer conjunto de scaffolds', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Internacionalización de tu aplicación', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Esteroides para tu desarrollo - Debugging', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Agregar validaciones de modelo', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadiendo el concepto de usuario', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadir participantes a la tarea', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'CanCanCan ¿puedes hacerlo?', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Callbacks en Rails', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Enviar email a los participantes', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Añadir comentarios vía AJAX', ['juan:1', 'leon:2', 'andrea:random']],
  ['desarrollo', 'Embellecer nuestra aplicación', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Desplegando a Heroku', ['juan:1', 'leon:2', 'andrea:random']],
  ['conceptualización', 'Conclusiones del curso', ['juan:1', 'leon:2', 'andrea:random']],
].each do |category, description, participant_set|
  # Crear participantes para la tarea
  participants = participant_set.map do |participant|
    # Dividir el nombre de usuario y el rol
    user_name, raw_role = participant.split(':')
    # Asignar rol aleatorio si es necesario
    role = raw_role == 'random' ? [1, 2].sample : raw_role
    # Crear instancia de Participant
    Participant.new(
      user: User.find_by(email: "#{user_name}@assetec.org"),
      role: role.to_i
    )
  end

  # Crear la tarea con los participantes asignados
  Task.create!(
    category: Category.find_by(name: category),
    name: "Tarea ##{Task.count + 1}",
    description: description,
    due_date: Date.today + 15.days,
    owner: owner,
    participating_users: participants
  )
end
puts 'Tasks has been created'

# ejecutar $ rails db:seed
# Para visualizar las tareas necesitas correr el comando: $ rails db:seed y luego hacer login con el usuario: email: johan@assetec.org password: 123456
# para ver las tareas creadas: http://localhost:3000/tasks