require("dotenv").config();
const express = require("express");

const app = express();
app.use(express.json());

const PORT = process.env.PORT || 3500;

const { default : mongoose} = require("mongoose");
const cors = require("cors");

app.get("/", (req, res) => res.json("Server is running..."))

mongoose.connect(process.env.DATABASE_STRING, {useNewURLParser: true, useUnifiedTopology: true})
mongoose.connection
.once("open", () => console.log("Connected to database..."))
.on("error", (error) => console.log("Error connecting to database...", error))

app.use(cors({origin: '*'}));

const auth = require('./middleware/auth');
const playlistRouter = require("./routes/playlistRouter");
app.use("/api/playlist", auth, playlistRouter);

const authRouter = require("./routes/authRouter");
app.use("/api/auth", authRouter);

const suggestedPlaylist = require("./routes/suggestedRoute");
app.use("/api/suggestion", suggestedPlaylist);

app.listen(PORT, () => console.log(`Listening to port ${PORT}`))
