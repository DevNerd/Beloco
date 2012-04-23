package com.vorpex.net
{
	import com.vorpex.requests.ConnectionEstablished;
	
	import flash.display.Stage;
	import flash.events.*;
	import flash.events.DataEvent;
	import flash.net.Socket;
	import flash.net.XMLSocket;
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	
	public class GameSocket
	{
		public var connected:Boolean = false;
		public var socket:Socket = new Socket();
		public var stage:Stage;
		public function GameSocket(host:String, port:int, stage:Stage)
		{
		
			this.stage = stage;
			socket.connect(host, port);
			socket.addEventListener(ProgressEvent.SOCKET_DATA, receiveData);
			socket.addEventListener(Event.CONNECT,connectedEvent);
			socket.addEventListener(Event.CLOSE, closeEvent);
			socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			
			
		}
		
		private function receiveData(event:ProgressEvent):void
		{
			var ba:ByteArray;
			var PLength:int = socket.readInt();
			var PHeader:int = socket.readShort();				
			trace("Packet->In->" + PHeader);		
			new PacketProcessing(PHeader,socket);
		}
		private function connectedEvent(event:Event):void
		{
			this.connected = true;
			trace("GameServer: Connection established");
			new ConnectionEstablished(this.socket, this.stage);
			
		}
		private function securityError(event:SecurityErrorEvent):void
		{
			trace("FUUUU");
		}
		
		private function closeEvent(event:Event):void
		{
			this.connected = false;
			trace("FUU Y U NO STAY ONLINE");
		}
		
	}
}