import mysql from 'mysql2';

  const pool = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: '123456789',
    database: 'optical_store',
    port: 3306 // same port on mysql
  });

export default pool