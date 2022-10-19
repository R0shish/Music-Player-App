const router = require('express').Router();
const User = require('../models/user');

router.post('/createPlaylist', async (req, res) => {
    const {title, image, songs } = req.body;
    if (!title) {
        return res.status(400).json({ error: "Please enter the title of the playlist" });
    }
    const {user_id} = req.data;
    try {
        const user = await User.findById(user_id);
        user.playlists.push({ title, image, songs });
        await user.save();
        res.json({ message: 'Playlist created' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.put('/addSongs', async (req, res) => {
    const {playlist_id, songs} = req.body;
    if (!playlist_id) {
        return res.status(400).json({ error: "Please enter the id of the playlist" });
    }
    const {user_id} = req.data;
    try {
        const user = await User.findById(user_id);
        const playlist = user.playlists.id(playlist_id);
        playlist.songs.push(...songs);
        await user.save();
        res.json({ message: 'Songs added to playlist' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.delete('/removeSongs', async (req, res) => {
    const {playlist_id, songs} = req.body;
    if (!playlist_id) {
        return res.status(400).json({ error: "Please enter the id of the playlist" });
    }
    const {user_id} = req.data;
    try {
        const user = await User.findById(user_id);
        const playlist = user.playlists.id(playlist_id);
        playlist.songs = playlist.songs.filter(song => !songs.includes(song));
        await user.save();
        res.json({ message: 'Songs removed from playlist' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

router.delete('/deletePlaylist', async (req, res) => {
    const { playlist_id } = req.body;
    if (!playlist_id) {
        return res.status(400).json({ error: "Playlist ID is missing" });
    }
    const { user_id } = req.data;
    try {
        const user = await User.findById(user_id);
        user.playlists = user.playlists.filter(playlist => playlist._id != playlist_id);
        await user.save();
        res.json({ message: 'Playlist deleted' });
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

module.exports = router;