import express from "express";
import cors from "cors";
import { Pool } from "pg";

const app = express();
const port = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(express.json());

// Database connection
const pool = new Pool({
  user: process.env.DB_USER || "postgres",
  host: process.env.DB_HOST || "localhost",
  database: process.env.DB_NAME || "transactions_db",
  password: process.env.DB_PASSWORD || "your_password",
  port: 5432,
});

// Routes
app.get("/transactions", async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT * FROM transactions ORDER BY created_at DESC"
    );
    res.json(result.rows);
  } catch (err) {
    res.status(500).json({ error: "Failed to fetch transactions" });
  }
});

app.post("/transactions", async (req, res) => {
  const { person_name, amount, type, description } = req.body;
  try {
    const result = await pool.query(
      "INSERT INTO transactions (person_name, amount, type, description) VALUES ($1, $2, $3, $4) RETURNING *",
      [person_name, amount, type, description]
    );
    res.json(result.rows[0]);
  } catch (err) {
    res.status(500).json({ error: "Failed to create transaction" });
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
