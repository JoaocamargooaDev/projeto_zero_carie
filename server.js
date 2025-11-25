const express = require('express');
const path = require('path');

const app = express();
const port = 3000;

require('./db');

app.use(express.json());

console.log('Carregando rotas /api ...');
const apiRoutes = require('./routes/api');
app.use('/api', apiRoutes);

app.use(express.static(path.join(__dirname, 'public')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

app.use((req, res) => {
  console.log('404 atingido em:', req.method, req.url);
  res.status(404).send('Rota não encontrada');
});

app.listen(port, () => {
  console.log(`Servidor funcionando em http://localhost:${port}`);
});
