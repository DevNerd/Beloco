package com.vorpex
{
	import com.vorpex.net.*;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.net.Socket;
	import flash.net.XMLSocket;
	import flash.text.*;
	import flash.ui.Keyboard;
	import flash.utils.ByteArray;
	
	public class CreateLoginWindow extends Sprite
	{
		public var STAGE:Stage;
		private var PasswordText:TextField;
		private var UsernameText:TextField;
		private var Loco:beLoco;
		private var socket:Socket;
		public function CreateLoginWindow(_stage:Stage, _socket:Socket):void
		{
			this.STAGE = _stage;
			this.socket = _socket;
			var TextForm:* = new TextFormat();
			TextForm.font = "Verdana";
			TextForm.color = 0x000000;
			TextForm.size = 10;
			
			UsernameText = new TextField();
			UsernameText.antiAliasType = AntiAliasType.ADVANCED;
			UsernameText.defaultTextFormat = TextForm;
			UsernameText.text = "Username";
			UsernameText.width = 115; 
			UsernameText.height = 15;
			UsernameText.type = TextFieldType.INPUT;
			UsernameText.x = 590;
			UsernameText.y = 80;
			UsernameText.border = true
			UsernameText.addEventListener(FocusEvent.FOCUS_IN, focusUsername);
			
			PasswordText = new TextField();
			PasswordText.antiAliasType = AntiAliasType.ADVANCED;
			PasswordText.defaultTextFormat = TextForm;
			PasswordText.text = "Password";
			PasswordText.width = 115; 
			PasswordText.height = 15;
			PasswordText.type = TextFieldType.INPUT;
			PasswordText.x = 590;
			PasswordText.y = 100;
			PasswordText.border = true
			PasswordText.displayAsPassword = true;
			PasswordText.addEventListener(FocusEvent.FOCUS_IN, focusPassword);
			
			var button:Sprite = new Sprite();
			button.graphics.beginFill(0xFF6600);
			button.graphics.drawRect(0, 0, 100, 20);
			button.graphics.endFill();
			button.buttonMode = true;
			button.x = 605;
			button.y = 120;
			button.addEventListener(MouseEvent.CLICK, LoginHandler);
			
			STAGE.addChild(button);
			STAGE.addChild(PasswordText);
			STAGE.addChild(UsernameText);
		}
		
		private function focusPassword(event:FocusEvent):void {
			event.currentTarget.text = "";
		}
		
		private function focusUsername(event:FocusEvent):void {
			event.currentTarget.text = "";
		}
		
		private function LoginHandler(event:MouseEvent):void
		{
			if (UsernameText.text == "" || PasswordText.text == "") {
				//alert empty username or pass
			} else {
				
				var LoginPacket:PacketConstructor = new PacketConstructor(2);
				LoginPacket.addString(UsernameText.text);
				LoginPacket.addString(PasswordText.text);
				socket.writeBytes(LoginPacket.result());
				//SOCKET.writeBytes(LoginPacket.result());
				//Loco.socket.socket.writeBytes(LoginPacket.result());
				//GSocket.socket.writeBytes(LoginPacket.result());
				
				//try login
				
			}
		}
	}
}