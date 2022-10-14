const mongoose = require("mongoose");
const userSchema = new mongoose.Schema(
  {
    name: {
        type: String,
        required: true,
    },
    
    email: {
        type: String,
        required: true,
    },

    password: {
        type: String,
        required: true,
    },

    avatar: {
        type: String,
    },

    playlists:[
      {
        title: {
          type: String,
          required: true,
        },
        image: {
          type: String,
        },
        songs: {
          type: Array,
        },
      },
    ]
  },
);

module.exports = mongoose.model("user", userSchema);
