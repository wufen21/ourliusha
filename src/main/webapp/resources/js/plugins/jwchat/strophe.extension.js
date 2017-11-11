/**
 * Extension for Strophe.js 
 * 
 * Loippi webim plugin 
 */
var Strophex = {
	// Openfire http-bind URL
	httpbase : 'http://120.76.75.165:7070/http-bind/',
	// Openfire Domain
	domain : '120.76.75.165',
	// Strophe Debug Model
	debug : true,
	fromJID : '',
	// Strophe Connection 
	connection : null,
	// Strophe to login openfire base XMPP
	login : function(jid, password) {
		Strophex.connection = new Strophe.Connection(Strophex.httpbase);
		Strophex.fromJID = jid;
		Strophex.connection.rawInput = function(data) {
			Strophex.onLog(data);
		};
		Strophex.connection.rawOutput = function(data) {
			Strophex.onLog(data);
		};
		Strophex.connection.connect(jid, password, Strophex.onConnect);
	},
	// Openfire disconnect
	disconnect : function() {
		Strophex.connection.disconnect();
	},
	// Connection Status Change Listener
	onConnect : function(status) {
		if (status == Strophe.Status.CONNECTING) {
			Strophex.onLog('Strophe is connecting.');
		} else if (status == Strophe.Status.CONNFAIL) {
			Strophex.onLog('Strophe failed to connect.');
		} else if (status == Strophe.Status.DISCONNECTING) {
			Strophex.onLog('Strophe is disconnecting.');
		} else if (status == Strophe.Status.DISCONNECTED) {
			Strophex.onLog('Strophe is disconnected.');
		} else if (status == Strophe.Status.CONNECTED) {
			Strophex.onLog('Strophe is connected2.');
			Strophex.onLog('ECHOBOT: Send a message to '
					+ Strophex.connection.jid + ' to talk to me.');
			Strophex.connection.addHandler(Strophex.onMessage, null, 'message',
					null, null, null);
			Strophex.connection.send($pres().tree());
		}
	},
	// Recive Message Handler
	onMessage : function(msg) {
		var to = msg.getAttribute('to');
		var from = msg.getAttribute('from');
		var type = msg.getAttribute('type');
		var elems = msg.getElementsByTagName('body');
		console.log(type);
		console.log(elems);
		if (type == "chat" && elems.length > 0) {
			//Write message to LayIM  Widget
			$.im.recive(from.toString().split("@")[0], Strophe
					.getText(elems[0]));
			Strophex.onLog('ECHOBOT: I got a message from ' + from + ': '
					+ Strophe.getText(elems[0]));
		}
		return true;
	},
	// Send Message Handler
	sendMessage : function(toJID, msg) {
		var reply = $msg({
			to : toJID,
			from : Strophex.fromJID,
			type : 'chat'
		}).cnode(Strophe.xmlElement('body', '', msg));
		Strophex.connection.send(reply.tree());
		Strophex.onLog('ECHOBOT: I sent ' + toJID + ': ' + msg);
	},
	// Log tool
	onLog : function(message) {
		if (Strophex.debug == true) {
			console.log(message);
		}
	}
};