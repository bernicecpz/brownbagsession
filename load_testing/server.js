const express = require('express');
const app = express();
const bodyParser = require('body-parser');
var Datastore = require('nedb')
  , db = new Datastore({ filename: 'data.db', autoload: true });
app.use(bodyParser.urlencoded({ extended: true }))

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`Sample project listening on port ${PORT}`);
});

app.get('/', (req, res) => {
    db.find({}, (err, doc) => {
        console.log('Doc:', doc);
        if(err) {
            res.send('Nothing in DB');
        } else {
            res.send(doc);
        }
    });
    
});

app.post('/quotes', (req, res) => {
    console.log('req:',req);
    //console.log('res:',res);
    db.insert(req, () => {});
    res.send('Quote is created');

});