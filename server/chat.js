var io = require('socket.io').listen(5050);

console.log('Started chat server');

io.sockets.on('connection', function (socket)
{
	// MOTD
	socket.emit('main', { msg: 'Connect ACK'});

	// On received message
	socket.on('main', function (data)
	{

		console.log('dump:');

		// Print to console
		console.dir(data);

		// Echo data to client
		socket.emit('main', { msg: data.msg });
	});
});