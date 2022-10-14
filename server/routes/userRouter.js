const router = require('express').Router();
const User = require('../models/user');

router.get('/getUserData', async (req, res) => {
    const { user_id } = req.data;
    try {
        const user = await User.findById(user_id);
        res.json({ 
            name: user.name,
            email: user.email,
            avatar: user.avatar,
            playlists: user.playlists,
        });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;