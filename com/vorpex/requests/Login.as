package com.vorpex.requests
{
	import flash.net.Socket;
	public class Login
	{
		public function Login(packet:Socket)
		{
			if(packet.readBoolean()){
				trace(packet.readInt());
				trace(packet.readUTF());
			}
		}
	}
}