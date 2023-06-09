const express = require('express');
const bodyParser = require('body-parser');
const  {randomBytes} = require('crypto');
const app = express();
// currently we are storing data in memory
const posts = {};
app.use(bodyParser.json());

app.get('/posts',(req, res) => {
    res.send(posts);
});

app.post('/posts',(req, res) => {
    const id = randomBytes(4).toString('hex');
    const {title} = req.body;

    posts[id] = {
         id, title 
        };
    res.status(201).send(posts[id]);
});

app.listen(4000, () => {
    console.log('listening on http://localhost:4000/posts');
});