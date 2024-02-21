<!DOCTYPE html>
<html lang="az">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="style.css" />
    <title>Inicio de sesion</title>
    
</head>

<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <form action="validacion/validarInicioSesion.php" method="post" class="sign-in-form">
                <h2 class="title">Iniciar sesión</h2>

                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="int" id="Idusuario" name="Idusuario" placeholder="Numero de Identificacion" />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="Contraseña" name="Contraseña" placeholder="Contraseña" />

                </div>
                <a href="#"  class="href">
                    Olvidé mi contraseña :
                </a>

                <input type="submit" value="Ingresar" class="btn solid" />

            </form>
            <form action="validacion/validarRegistroUsuario.php" method="post" class="sign-up-form">
                <h2 class="title">Registrarse</h2>
                <div class="input-field">
                    <i class="fa-solid fa-id-card"></i>
                    <input type="int" id="Idusuario" name="Idusuario" placeholder="Numero Identificacion" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" id="Nombres" name="Nombres" placeholder="Nombres " required />
                </div>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" id="Apellidos" name="Apellidos" placeholder="Apellidos " required />
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="email" id="Email" name="Email"placeholder="Correo electronico" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-phone"></i>
                    <input type="tel" name="Telefono" id="Telefono" placeholder="Telefono" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" id="Pasword" name="Pasword" placeholder="Contraseña" required />
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="file" id="img" name="img" placeholder="img" required />
                </div>

                <div class="input-field">
                    <i class="fa-solid fa-masks-theater"></i>
                    <label for="Rol" id="roles">Rol</label></div>
                <div class="input-radio">
                    <label for="Docente">Docente</label>
                    <input type="radio" id="Docente" name="Rol" value="Docente">
  
                    <label for="Estudiante">Estudiante</label>
                    <input type="radio" id="Estudiante" name="Rol" value="Estudiante">

                    <label for="Padre de Familia">Padre de Familia</label>
                    <input type="radio" id="Padre de Familia" name="Rol" value="Padre de Familia">

                    <label for="Coordinador">Coordinador</label>
                    <input type="radio" id="Coordinador" name="Rol" value="Coordinador">
                </div>

                <div class="input-field" id="curso_field" style="display:none;">
                    <i class="fas fa-graduation-cap"></i>
                    <input type="text" id="Curso" name="Curso" placeholder="Curso" />
                </div>
                
                <div class="input-field" id="materia_field" style="display:none;">
                    <i class="fas fa-book"></i>
                    <select id="Materia" name="Materia">
                        <?php
                        // Conexión a la base de datos y consulta de las materias
                        $conexion = new mysqli("localhost", "root", "", "digiworm_04");
                        if ($conexion->connect_error) {
                            die("Error de conexión: " . $conexion->connect_error);
                        }
                        $consulta = $conexion->query("SELECT  idMaterias, Nombre_Materia FROM materias");

                        // Generar las opciones del select
                        while ($fila = $consulta->fetch_assoc()) {
                            echo "<option value='" . $fila['idmaterias'] . "'>" . $fila['Nombre_Materia'] . "</option>";
                        }
                        // Cerrar la conexión
                        $conexion->close();
                        ?>
                    </select>
                </div>

                <div>
                    <input type="checkbox"/><a href="#" class="href"> <span class="rules-text">"Acepto los términos de servicio"</a></span> 
                </div>

                <input type="submit" class="btn" value="Registro completo"/>

            </form>
            <script>
                document.addEventListener("DOMContentLoaded", function() {
                    var radioButtons = document.querySelectorAll('input[name="Rol"]');
                    var cursoField = document.getElementById('curso_field');
                    var materiaField = document.getElementById('materia_field');

                    // Escuchar el cambio en los radios de opción de rol
                    radioButtons.forEach(function(radioButton) {
                        radioButton.addEventListener('change', function() {
                            // Mostrar u ocultar campos según el rol seleccionado
                            if (this.value === 'Docente') {
                                cursoField.style.display = 'block';
                                materiaField.style.display = 'block';
                            } else {
                                cursoField.style.display = 'none';
                                materiaField.style.display = 'none';
                            }
                        });
                    });
                });
            </script>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>No tienes una cuenta?</h3>
                <p>
                    Después de registrarse, puede aprovechar de los servicios de la institucion educativa.
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Registro
                </button>
            </div>

        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>¿Tiene usted una cuenta?</h3>
                <p>
                    Debe iniciar sesión para conocer mas de nosotros..
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Ingresar
                </button>
            </div>

        </div>
    </div>
</div>
<script src="js/main.js"></script>
</body>
</html>
