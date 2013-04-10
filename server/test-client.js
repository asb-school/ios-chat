/*
**
**	iOS CHAT
**	Andrew Breja
**
** 	Test Client
**	This client will send messages only. Use server console
**	to see received messages.
**
*/

// --------------------------------------------------------------
// IMPORTS

var prompt = require('prompt');
var io = require('socket.io-client');


// --------------------------------------------------------------
// SETUP

var socket = io.connect('localhost', { port:5050 });

// Prompter setup options
prompt.delimiter = '';
prompt.message = 'msg ';

var property = 
{
	name: 'data',
	message: '>'
};


// --------------------------------------------------------------
// CONNECTION

socket.on('connect', function () 
{
	// Start the prompter
	prompt.start();

	// Prompt
	prompter();
});


// --------------------------------------------------------------
// PROMPTER

function prompter()
{
	prompt.get(property, function (error, result)
	{
		if (error)
		{
			console.log('Error:', error);
		}
		else
		{
			// Send data
			sendData(result);

			// Reset prompter
			prompter();
		}
	});
}


// --------------------------------------------------------------
// SEND DATA

function sendData(message)
{
	console.log('Sending message:', message.data);

	// Send out message
	socket.emit('main', { msg: message.data });
}