const router = require('express').Router();
const suggestedPlaylist = require('../models/suggestedPlaylist');

router.get("/getSuggestedPlaylist", (req, res) => {

    suggestedPlaylist.find({}, (err, data) => {
        if (err) {
        res.status(500).send(err);
        } else {
        res.status(200).send(data);
        }
    });
});

module.exports = router;
