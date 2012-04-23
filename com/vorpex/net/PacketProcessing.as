package com.vorpex.net
{
	import com.vorpex.requests.*;
	
	import flash.net.Socket;
	import flash.utils.ByteArray;

	public class PacketProcessing
	{
		public function PacketProcessing(header:int, packet:Socket)
		{
			//easy first, bitchez
			switch(header){
				case 1: new ServerStatus(packet); break;
				case 2: new Login(packet); break;
			}
		}
	}
}