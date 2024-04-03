import mysql from 'mysql2';

const database = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456789',
    database: 'optical_store',
    port: 3306 // port to connect with DB of MySQL
  });

export default database