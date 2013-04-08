var io = require('socket.io').listen(5050);

console.log('Started chat server');

io.sockets.on('connection', function (socket)
{
	// MOTD
	socket.emit('main', { msg: 'Connect ACK'});

	// On received message
	socket.on('main', function (data)
	{
		// Print to console
		console.log(data);

		// Echo data to client
		socket.emit('main', { msg: 'echo:' + data });
	});
});