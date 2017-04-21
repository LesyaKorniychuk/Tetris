package  {
	import flash.display.Sprite;
	import flash.display.GradientType;
	import flash.geom.Matrix;
	import flash.display.SpreadMethod;
	import flash.events.Event;
	
	public class DrawObgectTetris extends Sprite {



		public function DrawObgectTetris(col,w,h) {
	
			var typGradient:String=GradientType.LINEAR;
			var matrix:Matrix=new Matrix();
			var spred:String=SpreadMethod.REFLECT;
			matrix.createGradientBox(w,h/2,deg2rad(90),0,0);
			var rect1:Sprite=new Sprite();
	rect1.graphics.lineStyle (0.5);
	rect1.graphics.beginGradientFill (typGradient,[col,0XFFFF00],[1,1],[40,240],matrix,spred);
	rect1.graphics.drawRect (0,0,w,h);
	rect1.graphics.endFill ();
	addChild (rect1);
	//return rect1;
		}
		private function deg2rad(deg):Number{
			return deg*Math.PI/180;
		}
		

	}
	
}
