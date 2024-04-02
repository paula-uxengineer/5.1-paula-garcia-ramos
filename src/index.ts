import express from 'express';
import mysql from 'mysql2';

const app = express();

// Configuració de la connexió a la base de dades
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'usuari',
  password: 'contrasenya',
  database: 'nom_de_la_base_de_dades'
});

// Connexió a la base de dades
connection.connect((err) => {
  if (err) {
    console.error('Error de connexió a la base de dades: ' + err.stack);
    return;
  }
  console.log('Connexió a la base de dades correcta amb ID: ' + connection.threadId);
});

// Definició de rutes
app.get('/', (req, res) => {
  res.send('Hola món!');
});

// Iniciar el servidor
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Servidor escoltant al port ${PORT}`);
});
