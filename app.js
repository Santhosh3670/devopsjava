const express = require('express');
const app = express();
const port = 3000;

app.get('/', (req, res) => {
  res.send('Hello this is sandy from devops test project!');
});

app.listen(3000, '0.0.0.0', () => {
  console.log('App listening on port 3000');
});

