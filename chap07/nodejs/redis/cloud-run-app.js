/**
 * Cloud Run application that generates and delivers dynamiocally generated content.
 */

const express = require('express');
const cors = require('cors')
const redis = require("redis");

const app = express();

const client = redis.createClient({
  "host": process.env.REDIS_IP
});
client.on("error", function(error) {
  console.error(error);
});

app.use(cors());

app.get('/', (req, res) => {
  res.set('Cache-Control', 'no-store');
  client.set("key", "value!", redis.print);
  client.get("key", (err, reply) => {
    res.send(`
    <html>
      <head>
      </head>
      <body>
        <p>Connecting to Redis at: ${process.env.REDIS_IP}</p>
        <p>Value of key just read: ${reply}</p>
      </body>
    </html>
    `);
    });
  });


const port = process.env.PORT || 8080;
app.listen(port, () => {
  console.log(`Listening on port ${port}`);
});