package com.vorpex.net
{
	import flash.utils.ByteArray;

	public class PacketConstructor
	{
		private var packet:ByteArray = new ByteArray();
		public function PacketConstructor(header:int):void
		{
			trace("Packet->Out->" + header);
			packet.clear()
			packet.writeShort(header);
		}
		
		public function addInt(val:int):void
		{
			packet.writeInt(val);
		}
		
		public function addString(val:String):void
		{
			
			packet.writeUTF(val);
		}
		
		public function addBoolean(val:Boolean):void
		{
			packet.writeBoolean(val);
		}
		
		public function result():ByteArray
		{
			var test:ByteArray = new ByteArray();
			test.writeInt(this.packet.length);
			test.writeBytes(this.packet);
			return test;
		}
		
	}
}