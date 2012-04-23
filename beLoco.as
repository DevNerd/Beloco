package
{
	import as3isolib.display.IsoSprite;
	import as3isolib.display.primitive.IsoBox;
	import as3isolib.display.scene.IsoGrid;
	import as3isolib.display.scene.IsoScene;
	
	import com.vorpex.CreateLoginWindow;
	import com.vorpex.net.GameSocket;
	import com.vorpex.net.PacketConstructor;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.DataEvent;
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.URLRequest;
	import flash.net.XMLSocket;
	import flash.system.Security;
	import flash.utils.Timer;
	
	
	
		
	[SWF(width='800',height='600',backgroundColor='#FFFFFF',frameRate='25')]
	
	public class beLoco extends Sprite
	{
		public const DEBUG:Boolean = true;
		public var SOCKET:GameSocket;
		private var loader:Loader;
		private var scene:IsoScene;
		private var assets:Object;
		public function beLoco()
		{
			var islong:longcat = new longcat();
			scene = new IsoScene();
			scene.hostContainer = this; //it is recommended to use an IsoView
			
			var s0:IsoSprite = new IsoSprite();
			s0.setSize(600, 600, 0);
			s0.moveTo(50, 50, 0);
			s0.sprites = [islong];
			scene.addChild(s0);
			
			scene.render();
			
			Security.allowDomain("94.212.126.103");
			Security.loadPolicyFile("xmlsocket://94.212.126.103:30000");
			SOCKET = new GameSocket("94.212.126.103", 30000, this.stage);
		}
		
		private function loader_initHandler (evt:Event):void
		{
			buildScene();
		}
		
		private function buildScene ():void
		{
			scene = new IsoScene();
			scene.hostContainer = this; //it is recommended to use an IsoView
			
			
			var grid:IsoGrid = new IsoGrid();
			grid.showOrigin = false;
			scene.addChild(grid);
			
			var s0:IsoSprite = new IsoSprite();
			s0.setSize(25, 25, 65);
			s0.moveTo(50, 50, 0);
			scene.addChild(s0);
			scene.render();
		}
	}
}