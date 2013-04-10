/*
**
**	iOS CHAT
**	Andrew Breja
**
**	Chat Server
**	With magic sauce Socket.IO
**
*/


// --------------------------------------------------------------
// IMPORTS

var io = require('socket.io').listen(5050);


// --------------------------------------------------------------
// ON CONNECTION

io.sockets.on('connection', function (socket)
{
	// MOTD
	socket.emit('main', { msg: 'Connect ACK'});

	// On received message
	socket.on('main', function (data)
	{
		// Echo data to client
		socket.emit('main', { msg: data.msg });

		// Broadcast to everyone else
		socket.broadcast.emit('main', { msg: data.msg });
	});
});


// --------------------------------------------------------------
// GREETING

console.log('Started chat server');