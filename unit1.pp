unit unit1;

interface
uses crt;
type
    list = array of string[20];//256 max

procedure drawLineH(x,y,width:integer;c:string);  //draw horizontal line //block charaters are drawn in reverse add width-1 to x
procedure drawLineV(x,y,height:integer;c:string); //draw vertical line
procedure drawLineDL(x,y,size:integer;c:string); //draw diagonal line (left)
procedure drawLineDR(x,y,size:integer;c:string); //draw diagonal line (right)
procedure drawRect(x1,y1,x2,y2:integer;c:string); //draw rectangle
procedure drawFrame(x1,y1,x2,y2:integer);       //draw frame
{procedure drawBar(x,y,width,currentValue,maxValue:integer); //obsolete, use drawlineh instead}
function drawMenu(x,y:integer; menu:list):integer;
procedure loadSpr(filename:string);
procedure drawSpr(x,y:integer);

implementation

procedure drawLineH(x,y,width:integer;c:string);  //draw horizontal line //block charaters are drawn in reverse add width-1 to x
  var
    i: integer;
  begin
  gotoxy(x,y);
    for i:=0 to width-1 do
    begin
      write(c);
    end; 
  end;
//
procedure drawLineV(x,y,height:integer;c:string); //draw vertical line 
    var
    i: integer;
  begin
    for i:=0 to height-1 do
    begin
      gotoxy(x,y+i);
      write(c);
    end; 
  end;
//
procedure drawLineDL(x,y,size:integer;c:string);
  var
		i:integer;
  begin
		for i:=0 to size-1 do
			begin
			gotoxy(x+i*2,y+i);
			write(c);
			end;
  end;
//
procedure drawLineDR(x,y,size:integer;c:string);
  var
		i:integer;
  begin
		for i:=0 to size-1 do
			begin
			gotoxy(x-i*2,y+i);
			write(c);
			end;
  end;
//
procedure drawRect(x1,y1,x2,y2:integer;c:string);
  var
    i: integer;
  begin
    for i:=0 to y2-y1 do
      begin
        drawLineH(x1,y1+i,x2-x1,c);
      end; 
  end;
//
procedure drawFrame(x1,y1,x2,y2:integer);
  begin
    drawLineH(x1,y1,x2-x1,'-');
    drawLineH(x1,y2-1,x2-x1,'-');
    drawLineV(x1,y1,y2-y1,'|');
    drawLineV(x2,y1,y2-y1,'|');
  end;
//
{procedure drawBar(x,y,width,currentValue,maxValue:integer); //obsolete, use drawlineh instead
  begin
    gotoxy(x,y);
    drawLineH(x+width*currentValue div maxValue,y,width*currentValue div maxValue,'█');
    if (width*currentValue mod maxValue >= maxValue div 2) or ((width*currentValue div maxValue = 0) and (currentValue <> 0)) then
    write('▌');
  end;
}//
function drawMenu(x,y:integer; menu:list):integer;
  var
    //max width = 20 + 1
    height: integer;
    pos: integer;
  begin
    //drawRect(x,y,)
  end;
//
procedure loadSpr(filename:string);
  begin
  
  end;
//
procedure drawSpr(x,y:integer);
  begin
    
  end;


end.