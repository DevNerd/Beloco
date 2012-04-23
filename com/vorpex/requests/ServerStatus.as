package com.vorpex.requests
{
	import flash.net.Socket;
	public class ServerStatus
	{
		public function ServerStatus(packet:Socket)
		{
			trace(packet.readBoolean());
		}
	}
}