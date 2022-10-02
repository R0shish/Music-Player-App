const express = require("express");
const app = express();
const PORT = process.env.PORT || 3500;
const cors = require("cors");

app.get("/", (req, res) => res.json("Server is running..."))

app.listen(PORT, () => console.log(`Listening to port ${PORT}`))