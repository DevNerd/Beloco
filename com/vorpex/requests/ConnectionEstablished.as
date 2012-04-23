package com.vorpex.requests
{
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoScene;
	import as3isolib.enum.RenderStyleType;
	
	import com.vorpex.CreateLoginWindow;
	import com.vorpex.net.*;
	
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.net.Socket;
	import flash.utils.ByteArray;
	
	import flashx.textLayout.operations.CreateListOperation;
	
	public class ConnectionEstablished
	{
		public function ConnectionEstablished(socket:Socket,stage:Stage)
		{
		
			var testPacket:PacketConstructor = new PacketConstructor(1);
			testPacket.addBoolean(true);
			socket.writeBytes(testPacket.result());
			
			var LoginWindow:CreateLoginWindow = new CreateLoginWindow(stage, socket);
			
			
			var box:IsoBox = new IsoBox();
			box.styleType = RenderStyleType.SHADED;
			
			box.setSize(25, 30, 40);
			box.moveTo(200, 0, 0);
			
			var scene:IsoScene = new IsoScene();
			scene.hostContainer = stage;
			scene.addChild(box);
			scene.render();	
		}
	}
}