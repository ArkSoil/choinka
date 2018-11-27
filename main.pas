program main;

uses sysutils,crt,unit1;

type
  list = array of string[20];//256 max
  map = record
    field: array[1..100] of string;//[100];
    height: integer;
    width: integer;
  end;

//
var
  buffer: array[0..1999] of char;
  command:string;
  map1:map;
  list1:list;
  file1:Text;
  c:char;
  d:byte = 3 ;
  
  x: integer = 2;
  y: integer = 2;
  xBuffer: integer = 2;
  yBuffer: integer = 2;
  z,i,j:integer;

begin
{
  normvideo;
  drawLineH(4+20,5,20,'-');
  drawLineV(2,2,10,'|');
  TextBackground(red);
  drawRect(50,5,60,15,' ');
  
  drawFrame(5,10,10,15);
  TextBackground(black);
}
//game initialization start

Assign(file1, 'map2.txt');
  Reset(file1);
  i:=1;
    while not eof(file1) do
     begin
      Readln(file1, map1.field[i]);
      i+=1;
     end;
  Close(file1);
map1.height:=5;
map1.width:=10;

//game initialization end
  repeat
    //game loop start

    drawFrame(1,1,40,23);//3d view frame
    //drawFrame(1,21,39,24);//texbox
    drawFrame(40,1,80,24);//misc
    (*
    drawFrame(18,10,22,14);//3d view start
    drawFrame(12,7,28,17);
    drawLineDL(2,2,9,'\');
    drawLineDL(22,13,9,'\');
    drawLineDR(38,2,9,'/');
    drawLineDR(18,13,9,'/');//3d viev start
    *)
    gotoxy(50,6);
    write(map1.field[1]);
    gotoxy(50,7);
    write(map1.field[2]);
    gotoxy(50,8);
    write(map1.field[3]);
    gotoxy(50,9);
    write(map1.field[4]);
    gotoxy(50,10);
    write(map1.field[5]);
    gotoxy(x+49,y+5);
    write('X');

    //game loop end
    // if y-obliczenie < 1 || y-obliczenie > map1.height
    //const lines
    drawLineH(12,7,18,'-');
    drawLineH(12,16,18,'-');
    //supplementary lines
    if (map1.field[y-1][x-1] <> '0') or (map1.field[y][x-1] <> '0') then
      drawLineV(12,8,8,'|');
    if (map1.field[y-1][x+1] <> '0') or (map1.field[y][x+1] <> '0') then
      drawlineV(29,8,8,'|');
(*

      //backrow
      if map1.field[y-1][x-1] = 0 then //-1
        begin
          //draw -1 empty
          if map1.field[y-1][x-2] = 0 then//-2
            begin
              //draw -2 empty
            end
          else
            begin
              //draw -2 full
            end;
        end
      else
        begin
          //draw -1 full
        end;

        if map1.field[y-1][x+1] = 0 then //+1
        begin
          //draw +1 empty
          if map1.field[y-1][x+2] = 0 then//+2
            begin
              //draw +2 empty
            end
          else
            begin
              //draw +2 full
            end;
        end
      else
        begin
          //draw +1 full
        end;
      if map1.field[y-1][x] = 0 then //0
        begin
          //draw 0 empty
        end
      else
        begin
          //draw 0 full
        end;
*)
        //frontrow
        if map1.field[y][x-1] = '0' then //-1
          begin
            drawLineH(2,7,10,'-');
            drawLineH(2,16,10,'-');
          end
        else
          begin
            drawLineDL(2,2,6,'\');
            drawLineDR(12,16,6,'/');
            for i:=0 to 4 do
              begin
                Textcolor(green);
                drawLineV(2+i*2,3+i,18-i*2,'|');
                drawLineV(3+i*2,3+i,18-i*2,'/');
                Textcolor(lightgray);
              end;
          end;

        if map1.field[y][x+1] = '0' then //+1
        begin
          drawLineH(28,7,10,'-');
          drawLineH(28,16,10,'-');
        end
      else
        begin
          drawLineDL(29,16,6,'\');
          drawLineDR(39,2,6,'/');
          for i:=0 to 4 do
            begin
              begin
                TextBackground(green);
                drawLineV(39-i*2,3+i,18-i*2,' ');
                drawLineV(38-i*2,3+i,18-i*2,' ');
                TextBackground(black);
              end;  
            end;
        end;
    
    //draw 3d viev

    c:=ReadKey;
    case c of
     #0 : begin
           c:=ReadKey;
           case c of
            #75 : if d=0 then d:=3 else d-=1;
            #77 : if d=3 then d:=0 else d+=1;
            #72 : case d of
                 0: yBuffer-=1;
                 1: xBuffer+=1;
                 2: yBuffer+=1;
                 3: xBuffer-=1;
                 end;
            #80 : case d of
                  0: yBuffer+=1;
                  1: xBuffer-=1;
                  2: yBuffer-=1;
                  3: xBuffer+=1;
                 end;
           end;
          end;
     't' : begin
            gotoxy(1,24);
            readln(command);
           end;
    end;
  clrscr();

if map1.field[yBuffer][xBuffer]='1' then
  begin
    xBuffer:=x;
    yBuffer:=y;
  end
else
  begin
    x:=xBuffer;
    y:=yBuffer;
  end;





{
  if x<2 then x:=2; // map size limit
  if y<2 then y:=2;
  if x>map1.width-1 then x:=map1.width-1;
  if y>map1.height-1 then y:=map1.height-1;
}
  gotoxy(3,3);
  write(integer(c),' ',x,' ',y);
  until c=#27 


end.
