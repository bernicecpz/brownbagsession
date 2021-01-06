const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var Datastore = require('nedb'), db = new Datastore({ filename: './db/data.db', autoload: true });
app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json());
db.loadDatabase(function (error) {   
    if (error) {
        console.log('FATAL: local database could not be loaded. Caused by: ' + error);
        throw error;
      }
      console.log('INFO: local database loaded successfully.');
  });

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Sample project listening on port ${PORT}`);
});

app.get('/', (req, res) => {

    db.find({}, (err, doc) => {
        if(err) {
            res.send('Nothing in DB');
        } else {
            res.send(doc);
        }
    });
    
});

app.post('/quotes', (req, res) => {

    db.insert(req.body, function (error) {   
      if (error) {
        res.send('ERROR: saving document: ');
        console.log('Caused by: ' + error);
        throw error;
      }
    });
    data = {
        "msg": `Quote by ${req.body.author} has been created successfully`
    }
    res.send(data);

});