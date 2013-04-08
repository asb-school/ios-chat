var io = require('socket.io-client');
var socket = io.connect('localhost', { port:5050 });

// On connection
socket.on('connect', function () 
{
	console.log('Connected!');
});


// Send data function
function sendData ()
{
	socket.emit('main', { msg: 'lol noob' });
}

// On receive data
socket.on('main', function (data)
{
	// Print to console
	console.log(data);
});

// Every 5 seconds send some data
setInterval(sendData, 5000);