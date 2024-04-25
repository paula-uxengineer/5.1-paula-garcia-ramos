import mysql from "mysql2";
import dotenv from "dotenv";

dotenv.config();

const poolOptical = mysql.createPool({
  host: process.env.MYSQL_HOST,
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: parseInt(process.env.MYSQL_PORT ?? "", 10),
});

export default poolOptical;
