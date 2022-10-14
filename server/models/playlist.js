const mongoose = require("mongoose");
const ObjectId = mongoose.Schema.Types.ObjectId;
const playlistSchema = new mongoose.Schema(
  {
    _id: ObjectId,
    user_id:{
      type: ObjectId,
      ref: "User",
      required: true,
    },
    title: {
      type: String,
      required: true,
    },
    image: {
      type: String,
      required: true,
    },
    songs: {
      type: Array,
      required: true,
    },
  },
);

module.exports = mongoose.model("playlist", playlistSchema);
