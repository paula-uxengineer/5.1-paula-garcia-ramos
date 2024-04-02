import express from 'express';
import mysql from 'mysql2';

const app = express();

// create connection to DB
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456789',
  database: 'optical_store',
  port: 3306 // port to connect with DB of MySQL
});


// Routes
app.get('/', (req, res) => {
    res.send('Hello World');
});

// Server port
const PORT = process.env.PORT || 3000; // port:3000 is for the server; it should listen on a different port than the database
app.listen(PORT, () => {
    console.log(`Server listening at port ${PORT}`);
    connection.connect((err) => {
      if (err) {
        console.error(`Error connecting to database: ${err}`);
        return;
      }
      console.log('Database connected successfully');
    });
});
