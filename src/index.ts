import express from "express";
import dotenv from "dotenv";

dotenv.config({ path: "../.env" });

const app = express();

// Server port
const PORT = process.env.PORT || 3000; // port:3000 is for the server; it should listen on a different port than the database

app.listen(PORT, () => {
  console.log(`Server listening at port ${PORT}`);
});
