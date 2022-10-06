const express = require('express');
const app = express();

app.get('/api/hello', (req, res) => {
  const name = process.env.NAME || 'NodeJSxx'
  res.send(`Hello ${name}!`);
      // res.send(JSON.stringify(req.headers));
});

app.get('/api/helloworld', (req, res) => {
  const name = process.env.NAME || 'NodeJS';
  res.send(`Hello ${name}!`);
      // res.send(JSON.stringify(req.headers));
});

const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`helloworld: listening on port ${port}`);
});
