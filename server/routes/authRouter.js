const router = require('express').Router();
const user = require('../models/user');
const bcrypt = require('bcrypt');

router.post("/register", (req, res) => {
    // Validation
    if (!req.body.name || !req.body.email || !req.body.password) {
        res.status(400).send("Please fill out all fields");
    } else {
        // Check if user already exists
        user.findOne({ email: req.body.email }, (err, data) => {
            if (err) {
                res.status(500).send(err);
            } else if (data) {
                res.status(400).send("Email address already in use");
            } else {
                // Create new user
                hashedPassword = bcrypt.hashSync(req.body.password, 10);
                const newUser = new user({
                    name: req.body.name,
                    email: req.body.email,
                    password: hashedPassword,
                });
                newUser.save((err, data) => {
                    if (err) {
                        console.log(err);
                        res.status(500).send(err);
                    } else {
                        console.log(data);
                        res.status(201).send(`Succesfully registered : ${data}`);
                    }
                });
            }
        });
    }
});

router.post("/login", (req, res) => {
    // Validation
    if (!req.body.email || !req.body.password) {
        res.status(400).send("Please fill out all fields");
    } else {
        // Check if user exists
        user.findOne({ email: req.body.email }, (err, data) => {
            if (err) {
                res.status(500).send(err);
            } else if (!data) {
                res.status(400).send("Email address not found");
            } else {
                // Check if password is correct
                if (bcrypt.compareSync(req.body.password, data.password)) {
                    res.status(200).send("Login successful");
                } else {
                    res.status(400).send("Incorrect password");
                }
            }
        });
    }
});



module.exports = router;