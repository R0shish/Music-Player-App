const router = require('express').Router();
const playlist = require('../models/playlist');

router.get("/getPlaylist", (req, res) => {

    playlist.find({user_id : req.data.user_id}, (err, data) => {
        if (err) {
        res.status(500).send(err);
        } else {
        res.status(200).send(data);
        }
    });
});

module.exports = router;