const mysql = require('mysql2');

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'catolica',
    database: 'zerocarie',
    port: '3307'
 });

 db.connect(err =>{
    if (err) throw err;
    console.log("banco de dados conectado");
 });

 module.exports = db;
