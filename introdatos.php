<!DOCTYPE html>
<html lang="es">
<head>
  <title>Trabajo final de grado Ingeniería Informática</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<style>
.jumbotron {
    background-color: #f4511e; /* Orange */
    color: #ffffff;
}
.bg-grey {
    background-color: #f6f6f6;
}
</style>

<body>

<div class="jumbotron text-center">
  <h1>TFG Ingeniería Informática</h1>
  <p>Automatización de la fase 1 y fase 2 de recogida y análisis de la información</p>
</div>
<div class="container-fluid bg-grey">
  <form action="procesardatos.php" method="post"class="form-inline">
    <div class="input-group">
	Informe:<input type="text" name="informe" class="form-control" size="50" placeholder="nombre" required><br>
	IP:<input type="text" name="ip" class="form-control" size="50" placeholder="direccion ip" required><br>
        <button type="submit" class="btn btn-danger">Procesar</button>
    </div>
  </form>
  <h2>Resultados</h2>
  <h4><strong>Informe generado</strong> Our mission lorem ipsum..</h4>
  <p><strong>Informe generado</strong> Our vision Lorem ipsum..
</div>
</body>
</html> 
</html>



