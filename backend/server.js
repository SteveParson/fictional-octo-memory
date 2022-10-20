'use strict';
const express = require('express');
const mysql = require('mysql')

const HOST = '0.0.0.0';
const PORT = 8080;
const MYSQL_ROOT_PASSWORD = process.env.MYSQL_ROOT_PASSWORD;
const MYSQL_HOST = process.env.MYSQL_HOST;

const db = mysql.createConnection({
  host: MYSQL_HOST,
  user: 'root',
  password: MYSQL_ROOT_PASSWORD,
  multipleStatements: true
});

const app = express();

db.connect((err) => {
    if(err) {
        throw err;
    }
    console.log('Connected to database');
});

// App
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
