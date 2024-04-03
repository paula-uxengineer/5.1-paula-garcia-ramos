import express from 'express';
import database from './database';

const app = express();

database.query(`Select * from customers`, (err,res,fields) =>{
    console.log(err);
    console.log(res);
    console.log(fields);
})

// Routes
app.get('/', (req, res) => {
    res.send('Hello World');
});

// Server port
const PORT = process.env.PORT || 3000; // port:3000 is for the server; it should listen on a different port than the database
app.listen(PORT, () => {
    console.log(`Server listening at port ${PORT}`);
    database.connect((err) => {
      if (err) {
        console.error(`Error connecting to database: ${err}`);
        return;
      }
      console.log('Database connected successfully');
    });
});
