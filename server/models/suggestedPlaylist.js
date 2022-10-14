const mongoose = require("mongoose");
const ObjectId = mongoose.Schema.Types.ObjectId;
const suggestedPlaylistSchema = new mongoose.Schema(
  {
    _id: ObjectId,
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

module.exports = mongoose.model("suggestedPlaylist", suggestedPlaylistSchema);
