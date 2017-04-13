package  {
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.events.Event;

	public class StageTetris extends Sprite{

		public function StageTetris(width_quantity:int,height_quantity:int,W_rect:int,H_rect:int,color_rect) {
				drawRectStage(width_quantity,height_quantity,W_rect,H_rect,color_rect);
		}

private function drawRectStage(W_quantity:int,H_quantity:int,w_rect:int,h_rect:int,color){
	
	for (var i=0; i<W_quantity; i++)
	{
		for (var j=0; j<H_quantity; j++)
		{
			var rect = drawRect(color,w_rect,h_rect);
			rect.x = (i * w_rect);
			rect.y = (j * h_rect);
			addChild (rect);
				}
	}
	
}


private function drawRect(col,w,h):Sprite{
	var rect1:Sprite=new Sprite();
	rect1.graphics.lineStyle (1,0X666666);
	rect1.graphics.beginFill (col);
	rect1.graphics.drawRect (0,0,w,h);
	rect1.graphics.endFill ();
	addChild (rect1);
	return rect1;
	
}

public function textTetris(txt,X,Y):TextField{
	var format:TextFormat=new TextFormat();
	format.size=16;
	format.font="Verdana";
	format.bold=true;
	
	var txt_schet=new TextField();
	txt_schet.text=String(txt);
	txt_schet.x=X;
	txt_schet.y=Y;
	txt_schet.width=180;
	txt_schet.height=30;
	txt_schet.border=true;
	txt_schet.borderColor=0X000000;
	txt_schet.background=true;
	txt_schet.backgroundColor=0XFFFF00;
	txt_schet.textColor=0X000099;
	txt_schet.selectable=false;
	txt_schet.setTextFormat(format);
	addChild(txt_schet);
	return txt_schet;
}
	}
	
}
