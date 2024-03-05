
const express = require('express');
const routes = require('./routes');
const user = require('./routes/user');
const query = require('./routes/query');
const tables = require('./routes/tables');
const script = require('./public/scripts/script');

const http = require('http');
const path = require('path');

const dotenv = require('dotenv');
dotenv.config();

//const methodOverride = require('method-override');
const session = require('express-session');
const app = express();
const mysql = require('mysql');
let bodyParser=require("body-parser");

app.use(express.static(path.join(__dirname, 'public')))

let connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password : '',
  database : 'colocviu_db'
});
 
connection.connect();
 
global.db = connection;

// all environments
app.set('port', process.env.PORT || 8080);
app.set('views', __dirname + '/views');
app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());
app.use(express.static('public'));

app.use(session({
  secret: 'keyboard cat',
  resave: false,
  saveUninitialized: false
}));

// development only
app.get('/', routes.index);
app.get('/signup', user.signup);
app.post('/signup', user.signup);
app.get('/login', routes.index);
app.post('/login', user.login);
app.get('/home/dashboard', user.dashboard);
app.get('/home/logout', user.logout);
app.get('/interogari', routes.interogari);

app.post('/interogare3A', query.interogare3A);
app.post('/interogare3B', query.interogare3B);
app.post('/interogare4A', query.interogare4A);
app.post('/interogare4B', query.interogare4B);
app.post('/interogare5A', query.interogare5A);
app.post('/interogare5B', query.interogare5B);
app.post('/interogare6A', query.interogare6A);
app.post('/interogare6B', query.interogare6B);

app.post('/interogareClienti', tables.interogareClienti);
app.post('/interogareZboruri', tables.interogareZboruri);
app.post('/interogareBilete', tables.interogareBilete);
app.post('/interogareCupoane', tables.interogareCupoane);

app.get('/clienti', (req, res) => {
  res.render('clienti', {
    hidden: "hidden",
    results: ""
  });
});

app.get('/zboruri', (req, res) => {
  res.render('zboruri', {
    hidden: "hidden",
    results: ""
  });
});

app.get('/bilete', (req, res) => {
  res.render('bilete', {
    hidden: "hidden",
    results: ""
  });
});
app.get('/cupoane', (req, res) => {
  res.render('cupoane', {
    hidden: "hidden",
    results: ""
  });
});


app.listen(process.env.PORT, () => console.log('app is running'));
