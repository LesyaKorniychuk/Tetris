package  {
	import flash.display.Sprite;
import flash.events.*;
import flash.geom.Rectangle;
import flash.display.BitmapData;
import flash.display.Bitmap;
import flash.geom.Point;
import flash.geom.Matrix;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.text.TextField;
import DrawObgectTetris;
import StageTetris;	
	
	public class Tetris extends Sprite {

private var rect_mas:Array=[[[1, 1],[1, 1]],
[[1,1,1,1]],
[[0,1,1],[1,1,0]],
[[1,1,0],[0,1,1]],
[[1,1],[0,1],[0,1]],
[[1,1],[1,0],[1,0]],
[[1,1,1],[0,1,0]]];

private var rect_mas_90:Array=[[[1, 1],[1, 1]],
   [[1],[1],[1],[1]],
   [[1,0],[1,1],[0,1]],
   [[0,1],[1,1],[1,0]],
   [[0,0,1],[1,1,1]],
   [[1,1,1],[0,0,1]],
   [[0,1],[1,1],[0,1]]];

private var rect_mas_180:Array=[[[1, 1],[1, 1]],
[[1,1,1,1]],
[[0,1,1],[1,1,0]],
[[1,1,0],[0,1,1]],
[[1,0],[1,0],[1,1]],
[[0,1],[0,1],[1,1]],
[[0,1,0],[1,1,1]]];

private var rect_mas_270:Array=[[[1, 1],[1, 1]],
[[1],[1],[1],[1]],
[[1,0],[1,1],[0,1]],
[[0,1],[1,1],[1,0]],
[[1,1,1],[1,0,0]],
[[1,0,0],[1,1,1]],
   [[1,0],[1,1],[1,0]]];

private var URA_mas:Array=[[1,0,1,0,1,1,1,0,0,1,0],
							  [1,0,1,0,1,0,1,0,1,0,1],
							   [1,1,1,0,1,1,1,0,1,0,1],
							   [0,0,1,0,1,0,0,0,1,1,1],
								[1,1,1,0,1,0,0,0,1,0,1]];


private var rect_mas_random_predvar:int=int(Math.random() * rect_mas.length);
private var rect_mas_random:int= int(Math.random() * rect_mas.length);

private var W:int=30;
private var H:int=20;
private var W_quantity:int=10;
private var H_quantity:int=20;

private var rect_color:Array=[0X0000FF,0XFF0000,0X00CC00,0X660099];
private var rect_color_random:uint=rect_color[int(Math.random() * rect_color.length)];
private var rect_color_random_predvar:uint=rect_color[int(Math.random() * rect_color.length)];

private var conteyner_predvar:Sprite=new Sprite();
private var conteyner:Sprite=new Sprite();
private var conteyner_draw_sp:Sprite=new Sprite();

private var spid:Number = 1;
private var left:Boolean=false;
private var rict:Boolean=false;
private var down:Boolean=false;
private var control_down = 0;
private var schet:Number=0;
private var mas_record:Array=[0];

var stageTetris:StageTetris;

		public function Tetris() {
				stageTetris=new StageTetris(10,20,W,H,0XCCCCFF);
				stageTetris.textTetris("Ваш счет"+" "+schet,330,100);
				stageTetris.textTetris("Рекорд"+" "+mas_record[mas_record.length-1],330,300);
			addChild (stageTetris);
			addChild (conteyner_predvar);
			addChild (conteyner_draw_sp);
			addChild (conteyner);
conteyner.x = W*4;
conteyner_predvar.x=350;
conteyner_predvar.y=200;

			cykle ();
			stage.addEventListener (KeyboardEvent.KEY_DOWN, key_down);
stage.addEventListener (KeyboardEvent.KEY_UP, key_up);
		}
		
private function cykle ()
{
	
    dravRect_4 (rect_mas,conteyner_predvar,rect_mas_random_predvar,rect_color_random_predvar);
    dravRect_4 (rect_mas,conteyner,rect_mas_random,rect_color_random);
   

addEventListener(Event.ENTER_FRAME,zapusc);
	function zapusc (e:Event):void
	{
		if (left){
			var control_left = 0;
		if (conteyner_draw_sp.numChildren > 0)
		{
			for (var i=0; i<conteyner.numChildren; i++)
			{
				for (var j=0; j<conteyner_draw_sp.numChildren; j++)
				{
					if (conteyner.getChildAt(i).hitTestPoint((conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).x+conteyner_draw_sp.getChildAt(j).width),(conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y+5))||
					conteyner.getChildAt(i).hitTestPoint((conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).x+conteyner_draw_sp.getChildAt(j).width),(conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y+ conteyner_draw_sp.getChildAt(j).height-5)  ))
					{
						control_left = 1;
					}
				}
			}
		}
		if (control_left == 0)
		{
			conteyner.x -=  W;
		}
		if (conteyner.x <= 0)
		{
			conteyner.x = 0;
		}
		
		}
		if(rict){
			var control_richt = 0;
		if (conteyner_draw_sp.numChildren > 0)
		{
			for (var i=0; i<conteyner.numChildren; i++)
			{
				for (var j=0; j<conteyner_draw_sp.numChildren; j++)
				{
					if (conteyner.getChildAt(i).hitTestPoint((conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).x),(conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y+5))||
					conteyner.getChildAt(i).hitTestPoint((conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).x),(conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y+ conteyner_draw_sp.getChildAt(j).height-5)  ))
					{
						control_richt = 1;
						
					}
				}
			}
		}
		if (control_richt == 0)
		{
			conteyner.x +=  W;
			
		}
		if ((conteyner.x+conteyner.width)>=W*10)
		{
			conteyner.x=(W*10-conteyner.width);
		}
			
		}
		
		if (conteyner_draw_sp.numChildren > 0)
		{
			var hit_test = 0;
			var difference_H = 0;
			for (var i=0; i<conteyner.numChildren; i++)
			{
				for (var j=0; j<conteyner_draw_sp.numChildren; j++)
				{

					if ((conteyner.getChildAt(i).localToGlobal(new Point()).y+conteyner.getChildAt(i).height)>=conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y&&
					   conteyner.getChildAt(i).localToGlobal(new Point()).x==conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).x&&
					conteyner.getChildAt(i).localToGlobal(new Point()).y<(conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y))
					{
						hit_test = 1;
							difference_H=(conteyner.getChildAt(i).localToGlobal(new Point()).y+conteyner.getChildAt(i).height)-conteyner_draw_sp.getChildAt(j).localToGlobal(new Point()).y;
					}
				}

			}
		}


		if ((conteyner.y+conteyner.height>=400)||hit_test==1)
		{
			if (conteyner.y + conteyner.height>= 400)
			{
				conteyner.y=400-conteyner.height;
				
			}
			else
			{
				conteyner.y=(conteyner.y-difference_H);
				
			}
			if(conteyner.y<40){
				removeEventListener(Event.ENTER_FRAME,zapusc);
				game_over();
				
			}
				
			control_down = 0;
			increase_spid();
			draw_conteyner ();
			delete_string();
			
			rect_mas_random = rect_mas_random_predvar;
			rect_mas_random_predvar=int(Math.random() * rect_mas.length);
			rect_color_random=rect_color_random_predvar;
			rect_color_random_predvar=rect_color[int(Math.random() * rect_color.length)];
			
	        dravRect_4 (rect_mas,conteyner_predvar,rect_mas_random_predvar,rect_color_random_predvar);
			dravRect_4 (rect_mas,conteyner,rect_mas_random,rect_color_random);
			
			conteyner.x = W*4;
			conteyner.y = 0;
			stageTetris.textTetris("Ваш счет"+" "+schet,330,100);
			stageTetris.textTetris("Рекорд"+" "+mas_record[mas_record.length-1],330,300);
		}
		else
		{
			if(down){
				conteyner.y +=H;
			}else{
			conteyner.y +=  spid;
			
			}
		}
	}

}
private function dravRect_4 (mas,cont,mas_rand,color):void
{
	if (cont.numChildren > 0)
	{
		cont.removeChildAt (0);
		cont.removeChildAt (0);
		cont.removeChildAt (0);
		cont.removeChildAt (0);
	}
	mas = mas[mas_rand];
	for (var i=0; i<mas.length; i++)
	{
		for (var j=0; j<mas[i].length; j++)
		{
			if (mas[i][j] == 0)
			{
				continue;
			}
			var r:DrawObgectTetris =new DrawObgectTetris(color,W,H);
			r.x = (j * W);
			r.y = (i * H);
			addChild (r);

			cont.addChild (r);
		}
	}
}

function key_down (e:KeyboardEvent):void
{
	if (e.keyCode == 37)
	{
		left=true;
		
	}
	if (e.keyCode == 39)
	{
		rict=true;
		
	}
	if (e.keyCode == 38)
	{
		control_down++;
		control_down %=  4;

		if (control_down == 1)
		{
			
			dravRect_4 (rect_mas_90,conteyner,rect_mas_random,rect_color_random);
			if ((conteyner.x+conteyner.width)>=W*W_quantity)
		{
			conteyner.x=(W*W_quantity-conteyner.width);
		}
		
		}

		if (control_down == 2)
		{
			dravRect_4 (rect_mas_180,conteyner,rect_mas_random,rect_color_random);
			if ((conteyner.x+conteyner.width)>=W*W_quantity)
		{
			conteyner.x=(W*W_quantity-conteyner.width);
		}
		}
		if (control_down == 3)
		{
			dravRect_4 (rect_mas_270,conteyner,rect_mas_random,rect_color_random);
			if ((conteyner.x+conteyner.width)>=W*W_quantity)
		{
			conteyner.x=(W*W_quantity-conteyner.width);
		}
		}
		if (control_down == 0)
		{
			dravRect_4 (rect_mas,conteyner,rect_mas_random,rect_color_random);
			if ((conteyner.x+conteyner.width)>=W*W_quantity)
		{
			conteyner.x=(W*W_quantity-conteyner.width);
		}
		}
	}
	if (e.keyCode == 40)
	{
		down=true;
	}
}

function key_up (e:KeyboardEvent):void
{
	if (e.keyCode == 37)
	{
	left=false;
	}
	if (e.keyCode == 39)
	{
	rict=false;
	}
	if (e.keyCode == 40)
	{
	down=false;
	}
}

private function draw_conteyner ():void
{
	for (var i:int=0; i<conteyner.numChildren; i++)
	{
		var spX = conteyner.getChildAt(i).localToGlobal(new Point()).x;
		var spY = conteyner.getChildAt(i).localToGlobal(new Point()).y;
		var sp_:DrawObgectTetris=new DrawObgectTetris(rect_color_random,W,H);
		addChild (sp_);
		sp_.x = spX;
		sp_.y = spY;
		conteyner_draw_sp.addChild (sp_);
		
	}
}
private  function delete_string():void
{
	for (var j:int=400; j>H_quantity; j-=H)
	{
		var control_string = 0;

		for (var i:int=0; i<conteyner_draw_sp.numChildren; i++)
		{
			if (conteyner_draw_sp.getChildAt(i).y == j)
			{
				control_string++;
				
				if (control_string ==W_quantity)
		{
			
			
			for (var k=0; k<conteyner_draw_sp.numChildren; k++)
			{
				if (conteyner_draw_sp.getChildAt(k).y == j)
				{
					
					conteyner_draw_sp.removeChild (conteyner_draw_sp.getChildAt(k));
					k--;
				}
			}
			for (var n=0; n<conteyner_draw_sp.numChildren; n++)
			{
				if (conteyner_draw_sp.getChildAt(n).y < j)
				{
					conteyner_draw_sp.getChildAt(n).y +=H;
				}
				
			}
			j +=  H;
			schet+=10;
			
			}
				
			}

		}
		
		}
	}

 private function increase_spid():void{
	if(schet<50){
			spid = 1;
			}
			if(schet>250&&schet<500){
				spid = 2;
			}
			if(schet>500&&schet<800){
				spid = 3;
			}
			if(schet>800&&schet<1300){
				spid = 4;
			}
			if(schet>1300&&schet<1600){
				spid = 5;
			}
			if(schet>1600){
				spid = 6;
			}
			
}
private function game_over():void{
				addChildAt(stageTetris.textTetris("GAME OVER",75,200),3);
				var over_schet=schet;
				mas_record.push(over_schet);
				mas_record.sort (Array.NUMERIC);
				if (over_schet==mas_record[mas_record.length-1]){
					addChildAt(stageTetris.textTetris("Новый рекорд"+" "+mas_record[mas_record.length-1],75,250),3);
				record();	
					}
			}
			private function record():void{
				removeChild(conteyner);
							
				addEventListener(Event.ENTER_FRAME,enter_frame);
				function enter_frame(e:Event):void{
		
	conteyner_draw_sp.removeChild(conteyner_draw_sp.getChildAt(0));
	if (conteyner_draw_sp.numChildren==0){
		removeEventListener(Event.ENTER_FRAME,enter_frame);
		
		for (var i=0; i<URA_mas.length; i++)
	{
		for (var j=0; j<URA_mas[i].length; j++)
		{
			if (URA_mas[i][j] == 0)
			{
				continue;
			}
			
			var r:DrawObgectTetris =new DrawObgectTetris(rect_color[1],W,H);
			r.x = (j * W);
			r.y = (i * H)+80;
			addChild (r);
			
		}
	}
	}
}

}


	}
	
}
