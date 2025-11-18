//arquivo principal
const express = require('express');
const app = express();
const port = 3000;
const path = require('path');

app.use(express.static('public'));


//chamar a instancia do nosso servidor de banco de dados
const db = require('./db');

//rotas (/ -> GET, POST, PUT, DELETE)
app.get('/', (req, res) =>{
    //res.send("Front funcionando");
    res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

//trazer as rotas presentes em API.js
const apiRoutes = require('./routes/api');

//receber do front-end (dados no formato JSON)
app.use(express.json());

//mandar para a rota que faz o cadastro
app.use('/api/users/', apiRoutes);


app.listen(port, ()=>{
    console.log("Servidor funcionando!!");
});
