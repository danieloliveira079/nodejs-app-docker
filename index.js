var express = require('express')
var morgan = require('morgan')
var names = require('starwars-names');

var app = express()

const port = process.env.PORT || 7001
const container_name = names.random()

app.use(morgan('combined'))

app.get('/', function (req, res) {
  console.log('========> Container Name: ' + container_name)
  res.send('Hello, I am ' + container_name)
})

app.listen(port, function () {
  console.log('Server listening on port ' + port + '!')
})
