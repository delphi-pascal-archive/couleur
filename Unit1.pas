unit Unit1;

interface

uses
   Windows, Messages, SysUtils, Variants, Classes,  Graphics, Controls, Forms,
   Dialogs, ExtCtrls, StdCtrls, Buttons,  inifiles, Menus,    ClipBrd,  ImgList;


const 
  Hlp_Presentation = 1;
  Hlp_Remerciement = 2;
  Hlp_BarreTitre   = 3;
  Hlp_LesJauges    = 4;
  Hlp_Options      = 5;
  Hlp_Touches      = 6;
  Hlp_LesBoutons   = 7;
  Hlp_CouleursEn   = 8;
  Hlp_Aide         = 9;


type
  TForm1 = class(TForm)
    ImageBtnAide           : TImage;
    ImageBtnAjoute         : TImage;
    ImageBtnAssombrire     : TImage;
    ImageBtnClipBoard      : TImage;
    ImageBtnCompact        : TImage;
    ImageBtnEclaircir      : TImage;
    ImageBtnEfface         : TImage;
    ImageBtnExtraire       : TImage;
    ImageBtnIconeQuitter   : TImage;
    ImageBtnLoad           : TImage;
    ImageBtnMini           : TImage;
    ImageBtnNew            : TImage;
    ImageBtnOptions        : TImage;
    ImageBtnQuitter        : TImage;
    ImageBtnSave           : TImage;
    ImageBtnTrier          : TImage;
    ImageChrom             : TImage;
    ImageFond              : TImage;
    ImDegrade              : TImage;
    ImageTitre             : TImage;
    Imbleu                 : TImage;
    ImRouge                : TImage;
    ImStock                : TImage;
    ImVert                 : TImage;

    St1                    : TStaticText;
    St2                    : TStaticText;
    St3                    : TStaticText;
    St4                    : TStaticText;
    St5                    : TStaticText;

    ImageList1             : TImageList;

    Panelcouleur           : TPanel;
    PanelChrom             : TPanel;

    ColorDialog1           : TColorDialog;
    SaveDialog1            : TSaveDialog;
    OpenDialog1            : TOpenDialog;

    procedure FormKeyDown                   ( Sender: TObject; var Key: Word; Shift: TShiftState);

    function  color_existe                  ( c: Tcolor) : boolean;
    function  selection_suivante                         : Boolean;

    procedure Trier_Les_couleurs ;
    procedure Affiche_Jauge                 ( Couleur : Tcolor);
    procedure DrawGradient                  ( ACanvas: TCanvas; Rect: TRect; Horicontal: Boolean; Colors: array of TColor);
    procedure Dessine_Btn                   ( Canvas : Tcanvas; glyph : shortint; Text : string; up : boolean);
    procedure sauve_ini;
    procedure charge_ini;
    procedure Dessine_Stock;
    procedure Dessine_Jauge                 ( im :Timage; couleur : Tcolor; Valeur : Integer; RegCol : byte);
    procedure dessine_titre                 ( canvas :Tcanvas; Text, soustitre : string);
    procedure actualise;
    procedure FormCreate                    ( Sender: TObject);
    procedure FormDestroy                   ( Sender: TObject);
    procedure Charge_fichier                ( nom : string);
    procedure sauve_fichier                 ( nom : string);
    procedure ImJaugeMouseDown              ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImJaugeMouseUp                ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImJaugeMouseMove              ( Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure ImStockDBClick                ( Sender: TObject);
    procedure ImStockMouseMove              ( Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure ImStockMouseDown              ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImStockMouseUp                ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageBtnIconeDown             ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnIconeUp               ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageBtnMouseDown             ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnMouseUp               ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageTitreMouseDown           ( Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure ImageChromMouseMove           ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImageChromClick               ( Sender: TObject);
    procedure ImDegradeMouseMove            ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure ImDegradeClick                ( Sender: TObject);
    procedure PanelcouleurDblClick          ( Sender: TObject);

    procedure ImageBtnAideClick             ( Sender: TObject);
    procedure ImageBtnAssombrireClick       ( Sender: TObject);
    procedure ImageBtnClipBoardClick        ( Sender: TObject);
    procedure ImageBtnCompactClick          ( Sender: TObject);
    procedure ImageBtnEclaircirClick        ( Sender: TObject);
    procedure ImageBtnEffaceClick           ( Sender: TObject);
    procedure ImageBtnLoadClick             ( Sender: TObject);
    procedure ImageBtnMiniClick             ( Sender: TObject);
    procedure ImageBtnNewClick              ( Sender: TObject);
    procedure ImageBtnOptionsClick          ( Sender: TObject);
    procedure ImageBtnQuitterClick          ( Sender: TObject);
    procedure ImageBtnSaveClick             ( Sender: TObject);
    procedure ImageBtnTrierClick            ( Sender: TObject);  
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    coulProg   : array[0..10] of integer;  { 0 = couleur du titre 1
                                             1 = Couleur du titre 2
                                             2 = Couleur du texte du titre
                                             3 = Couleur du fond 1
                                             4 = Couleur du fond 2
                                             5 = Couleur du bouton relaché 1
                                             6 = Couleur du bouton relaché 2
                                             7 = Couleur du texte du bouton relaché
                                             8 = Couleur du bouton enfoncé 1
                                             9 = Couleur du bouton enfoncé 2
                                             10= Couleur du texte du bouton enfoncé}
    AffHexa    : boolean;
  end;

const
//  Titre des boutons
 titreBtn   : array[0..11] of string= ('Quitter','Presse-Papier','','','','','','','','','','Valeur Par Défaut');

// Couleurs par défaut pour le bouton de la Tform Options
 coulDefaut : array[0..10] of Tcolor =  (7519970  , 34794    , 0,
                                         12632256 , 16777215 ,
                                         16777215 , 12632256 , 0,
                                         16744448 , 12615680 , 0);

var
  Form1      : TForm1;
  chemin     : String;
  cheminsave : string;
  cheminload : string;
  ValRouge   : integer;
  ValVert    : integer;
  ValBleu    : integer;
  selscX     : integer;
  mouse      : boolean;
  ChromX     : Byte;
  ChromY     : Byte;
  selX       : Byte;
  SelY       : Byte;
  ASelX      : Byte;
  ASelY      : Byte;
  Acolor     : Array[0..99] of integer;
implementation

uses Unit2;

{$R *.dfm}
//***************************************

function DesktopColor(const X, Y: Integer): TColor;  // renvoie la couleur sous le curseur de la souris
var
  c: TCanvas;
begin
  c := TCanvas.Create;
  try
    c.Handle := GetWindowDC(GetDesktopWindow);
    Result   := GetPixel(c.Handle, X, Y);
  finally
    c.Free;
  end;
end;

//***************************************

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var c : integer;
    Pos: TPoint;
begin
//##########
// F1 =aide
if (key=vk_f1) and not (ssCtrl in Shift) then  Application.HelpContext(Hlp_Presentation);
if (key=vk_f1) and (ssCtrl in Shift) then  Application.HelpContext(Hlp_Touches);


//##########
// la touche insert est appuyée alors j'affect la couleur a la couleur actuel
if key=vk_insert then begin
                      GetCursorPos(Pos);
                      C := DesktopColor(Pos.X, Pos.Y);
                      Affiche_Jauge(c);
                      ClipBoard.AsText := '$'+intTohex(c,8);
                      if (SSctrl in shift ) then begin // la touche CRTL est appuyée alors j'affect la couleur
                                                 if color_existe(c) then exit;                 // teste si la couleur est déja référencée
                                                 Acolor[SelX+(SelY*10)]:=c;
                                                 if selection_suivante then messagedlg('Il n''y a plus de cases vides !',mtinformation,[mbok,mbhelp],0);
                                                 dessine_stock;
                                                 end;

                      end;
//##########    touche * du pavé numérique place le curseur sur la premiere case vide 
if key=VK_MULTIPLY then begin
                        Selx:=0;
                        Sely:=0;
                        selection_suivante;
                        dessine_stock;
                        end;
//##########    touche Suppr  supprime la couleur sélectionné
if (key=VK_DELETE) and not (ssCtrl in Shift) then
                      begin
                      ImageBtnEffaceClick(Self);   // efface la couleur selectionnée
                      St2.Caption:='';             // efface les valeurs
                      St3.Caption:='';
                      St4.Caption:='';
                      St5.Caption:='';
                      end;
if (key=VK_DELETE) and (ssCtrl in Shift)then  ImageBtnNewClick(self);
if key in [$60..$6F] then
  begin  // Touches du pavé numérique
//##########   touche plus du pavé numérique eclaircie la couleur
  if key=vk_add then begin
                     inc(valrouge);
                     inc(Valvert);
                     inc(valBleu);
                     end;
//##########   touche Moins du pavé numérique assombrie la couleur
  if key=VK_SUBTRACT  then begin
                           dec(valrouge);
                           dec(Valvert);
                           dec(valBleu);
                           end;
//##########   touche 7 du pavé numérique diminue la variante rouge
  if key=VK_NUMPAD7 then dec(Valrouge);
//##########   touche 9 du pavé numérique augmente la variante rouge
  if key=VK_NUMPAD9 then inc(Valrouge);
//##########   touche 8 du pavé numérique centre la variante rouge
  if key=VK_NUMPAD8 then Valrouge:=128;
//##########   touche 7 du pavé numérique diminue la variante Vert
  if key=VK_NUMPAD4 then dec(ValVert);
//##########   touche 9 du pavé numérique augmente la variante Vert
  if key=VK_NUMPAD6 then inc(ValVert);
//##########   touche 8 du pavé numérique centre la variante Vert
  if key=VK_NUMPAD5 then ValVert:=128;
//##########   touche 1 du pavé numérique diminue la variante Bleu
  if key=VK_NUMPAD1 then dec(ValBleu);
//##########   touche 3 du pavé numérique augmente la variante Bleu
  if key=VK_NUMPAD3 then inc(ValBleu);
//##########   touche 2 du pavé numérique centre la variante Bleu
  if key=VK_NUMPAD2 then ValBleu:=128;

   if Valrouge<0 then Valrouge:=0;
   if ValVert<0 then ValVert:=0;
   if ValBleu<0 then ValBleu:=0;
   if Valrouge>255 then Valrouge:=255;
   if ValVert>255 then ValVert:=255;
   if ValBleu>255 then ValBleu:=255;
   affiche_jauge(rgb(valrouge,valvert,valbleu));
   end;

end;

//***************************************

function Tform1.color_existe(c: Tcolor) : boolean;
var I : byte;
begin
result:=False;
for I:=0 to 99 do
  if AColor[i]=c then begin
                      result:=True;
                      exit;
                      end;
end;

//***************************************

function Tform1.selection_suivante: boolean;
var n  : byte;
begin
n:=0;
while (n<100) and (Acolor[SelX+(SelY*10)]<>-1) do
 begin
 Inc(selx);
 if selx>9 then begin
                selx:=0;
                inc(sely);
                if sely>9 then begin
                               selx:=0;
                               sely:=0;
                               end;
                end;
 inc(n);
 end;
result:=(n=100);
end;

//***************************************

procedure TForm1.Trier_Les_couleurs ;
var
    I, J : integer;
    temp : Tcolor;
begin
for I := 99 downto 1 do
 for J := 0 to (I-1) do
   begin
   if Acolor[J] < Acolor[J+1] then begin
                                   temp        := Acolor[J];
                                   Acolor[J]   := Acolor[J+1];
                                   Acolor[J+1] := temp;
                                   end;
   end;
end;
//***************************************

procedure Tform1.Affiche_Jauge( Couleur : Tcolor);
begin
PanelCouleur.Color:=Couleur;
ValRouge:=getrValue(Couleur);
Dessine_Jauge(ImRouge,clred,ValRouge,0);
ValVert:=getgValue(Couleur);
Dessine_Jauge(ImVert,cllime,ValVert,1);
ValBleu:=getbValue(Couleur);
Dessine_Jauge(ImBleu,clblue,ValBleu,2);
end;

//***************************************

procedure Tform1.DrawGradient(ACanvas: TCanvas; Rect: TRect; Horicontal: Boolean; Colors: array of TColor);
type
  RGBArray = array[0..2] of Byte;
var
  x, y, z, stelle, mx, bis, faColorsh, mass: Integer;
  Faktor: double;
  A: RGBArray;
  B: array of RGBArray;
  merkw: integer;
  merks: TPenStyle;
  merkp: TColor;
begin
  mx := High(Colors);
  if mx > 0 then
  begin
    if Horicontal then
      mass := Rect.Right - Rect.Left
    else
      mass := Rect.Bottom - Rect.Top;
    SetLength(b, mx + 1);
    for x := 0 to mx do
    begin
      Colors[x] := ColorToRGB(Colors[x]);
      b[x][0] := GetRValue(Colors[x]);
      b[x][1] := GetGValue(Colors[x]);
      b[x][2] := GetBValue(Colors[x]);
    end;
    merkw := ACanvas.Pen.Width;
    merks := ACanvas.Pen.Style;
    merkp := ACanvas.Pen.Color;
    ACanvas.Pen.Width := 1;
    ACanvas.Pen.Style := psSolid;
    faColorsh := Round(mass / mx);
    for y := 0 to mx - 1 do
    begin
      if y = mx - 1 then
        bis := mass - y * faColorsh - 1
      else
        bis := faColorsh;
      for x := 0 to bis do
      begin
        Stelle := x + y * faColorsh;
        faktor := x / bis;
        for z := 0 to 3 do
          a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
        ACanvas.Pen.Color := RGB(a[0], a[1], a[2]);
        if Horicontal then
        begin
          ACanvas.MoveTo(Rect.Left + Stelle, Rect.Top);
          ACanvas.LineTo(Rect.Left + Stelle, Rect.Bottom);
        end
        else
        begin
          ACanvas.MoveTo(Rect.Left, Rect.Top + Stelle);
          ACanvas.LineTo(Rect.Right, Rect.Top + Stelle);
        end;
      end;
    end;
    b := nil;
    ACanvas.Pen.Width := merkw;
    ACanvas.Pen.Style := merks;
    ACanvas.Pen.Color := merkp;
  end
  else
    // Please specify at least two colors
    raise EMathError.Create('Es mussen mindestens zwei Farben angegeben werden.');
end;

//***************************************

procedure Tform1.Dessine_Btn( Canvas : Tcanvas; glyph : shortint; Text : string; up : boolean);
var vx,vy: integer;
begin
 DrawGradient(Canvas,Canvas.ClipRect,false,[coulprog[5+(3*byte(up))],coulprog[6+(3*byte(up))]]);
with Canvas do
 begin
 pen.Color:=clblack;
 pen.width:=1;
 Brush.Style:=BsClear;
 rectangle(cliprect);    // trace une simple bordure sur le bouton
 if text<>'' then begin
                  font.Color:=coulprog[7+(3*byte(up))];    // couleur du texte du bouton
                  Vx:=(Canvas.ClipRect.Right-canvas.TextWidth(text)+20) shr 1;
                  vy:=(canvas.ClipRect.Bottom-canvas.TextHeight(text)) shr 1;
                  TextOut(byte(up)+Vx,byte(up)+vy,text);
                  dec(vx,20);
                  end else vx:=(Canvas.ClipRect.Right-16) shr 1;


if glyph>-1 then begin
                 vy:=(canvas.ClipRect.Bottom-16) shr 1;                      // centre horizontalement le glyph
                 imagelist1.Draw(Canvas,byte(up)+Vx,byte(up)+vy,Glyph,true); // affiche le glyph
                                                                             // Byte(Up)+ Permet de décaler d'un pixel le glyph
                 end;
 end;
end;

//***************************************

procedure Tform1.Sauve_ini;
var
  MyIniFile : TIniFile;
  i         : Byte;
begin
MyIniFile := TIniFile.Create(chemin+'application.ini');

MyIniFile.WriteString('Chemin','Save',cheminSave);
MyIniFile.WriteString('Chemin','Load',cheminLoad);

MyIniFile.WriteBool('Options','AffHexa',AffHexa);

MyIniFile.WriteInteger('Valeur','Rouge',ValRouge);
MyIniFile.WriteInteger('Valeur','Vert',ValVert);
MyIniFile.WriteInteger('Valeur','Bleu',ValBleu);


for i:=0 to 99 do
   MyIniFile.Writeinteger('CouleurStock',inttostr(i),Acolor[I]);

For i:=0 to 15 do         // sauvegarde des couleurs customisable du Tdialogcolor
  MyIniFile.WriteString('CouleurCustom',char(65+i),colordialog1.CustomColors.Strings[i]);

For i:=0 to 10 do         // sauve garde de vos couleurs du programme
  MyIniFile.Writeinteger('CouleurProg',inttostr(I),coulProg[i]);

MyIniFile.Free;
end;

//***************************************

procedure Tform1.charge_ini;
var
  MyIniFile : TIniFile;
  I         : byte;
begin
MyIniFile  := TIniFile.Create(chemin+'application.ini');

cheminSave := MyIniFile.readString('Chemin','Save',chemin);
cheminLoad := MyIniFile.ReadString('Chemin','Load',chemin);

AffHexa    := MyIniFile.ReadBool('Options','AffHexa',true);
ValRouge   := MyIniFile.ReadInteger('Valeur','Rouge',0);
ValVert    := MyIniFile.ReadInteger('Valeur','Vert',0);
ValBleu    := MyIniFile.ReadInteger('Valeur','Bleu',0);

for I:=0 to 99 do
 Acolor[i] := MyIniFile.Readinteger('CouleurStock',inttostr(I),-1);

For i:=0 to 15 do
  ColorDialog1.CustomColors.Add(MyIniFile.ReadString('CouleurCustom',char(65+i),'Color'+chr(65+i)+'=0'));

For i:=0 to 10 do
 coulProg[i] := MyIniFile.Readinteger('CouleurProg',inttostr(I),CoulDefaut[i]);


MyIniFile.Free;
end;
//***************************************

procedure Tform1.Dessine_Stock;
var x , y : byte;
begin
for x:=0 to 9 do
 For y:=0 to 9 do
    with ImStock.Canvas do

     begin
     pen.Color:=clblack;
     if Acolor[x+(y*10)]=-1 then begin                                      // couleur non affectuée
                                 brush.Style:= bsSolid;
                                 brush.Color:=clWhite;
                                 rectangle(25*x,25*y,26+(25*x),26+25*y);    // efface le case
                                 brush.Color:=clbtnface;
                                 brush.Style:=bsDiagCross;                  // dessine des Lignes en diagonale
                                 end
                            else begin
                                 brush.Color:=Acolor[x+(y*10)];             // couleur non affectuée
                                 brush.Style:= bsSolid;
                                 end;
     rectangle(25*x,25*y,26+(25*x),26+25*y);                                // trace le rectangle

     if (selx=x) and (SelY=y) then begin                                    // si la case est sélectionnée
                                   pen.Width:=3;                            // dessine une crois avec trois pixels d'epaisseur en noir
                                   moveto(25*x,25*y);
                                   Lineto(26+(25*x),26+25*y);
                                   moveto(26+25*x,25*y);
                                   Lineto(25*x,26+25*y);
                                   pen.Width:=1;                            // dessine une crois avec 1 pixels d'epaisseur en blanc pour une
                                   pen.Color:=clwhite;                      // meilleur visibitée sur des cases sombres
                                   moveto(25*x,25*y);
                                   Lineto(26+(25*x),26+25*y);
                                   moveto(26+25*x,25*y);
                                   Lineto(25*x,26+25*y);
                                   end;
     end;
end;

//***************************************
procedure Tform1.Dessine_Jauge(im :Timage; couleur : Tcolor; Valeur : Integer; RegCol : byte);
var x  : integer;
begin
with im.Canvas do
 begin
 pen.Color:=clBlack;
 Brush.Color:=ClbtnFace;
 Rectangle(Cliprect);             // efface tous l'image
 end;
 DrawGradient(Im.Canvas,          // Dessine le dégradé du noir vers la couleur
              rect(5,10,261,25),
              true,
              [clblack, Couleur]);
with im.Canvas do                 // dessine les curseurs
 begin
 pen.Color:=clBlack;
 for x:=0 to 5 do
    begin
    moveto(5+Valeur-x,10-x);
    lineto(5+Valeur+x,10-x);
    end;
 for x:=0 to 5 do
    begin
    moveto(5+Valeur-x,25+x);
    lineto(5+Valeur+x,25+x);
    end;
 case Regcol of                    // selectionne seulement la valeur de la couleur
  0: Brush.Color:=RGB(Valeur,0,0);
  1: Brush.Color:=RGB(0,valeur,0);
  2: Brush.Color:=RGB(0,0,valeur);
 end;
 Rectangle(270,10,285,25);
 Font.Style:= [fsBold];
 Brush.Color:=clbtnFace;
 if AffHexa then textout(290,12,'$'+inttohex(Valeur,2))
            else textout(290,12,inttostr(Valeur))
 end;
end;

//***************************************

procedure tform1.dessine_titre(canvas :Tcanvas; Text , soustitre: string);
var x : integer;
begin
DrawGradient(Canvas,Canvas.ClipRect,false,[CoulProg[0],CoulProg[1]]);
with Canvas do
 begin
 brush.Style:=BsClear;
 Font.Color:= CoulProg[2];
 font.Style:=[fsBold];
 Font.Size:=12;
 TextOut(10,3,Text);
 x:=20+textwidth(text);
 font.Style:=[];
 Font.Size:=8;
 TextOut(x,8,Soustitre);
 rectangle(cliprect);
 end;
end;

//***************************************

procedure Tform1.actualise;
begin
DEssine_titre(imagetitre.canvas, 'Couleur','');

DrawGradient(ImageFond.Canvas,ImageFond.Canvas.ClipRect,false,[CoulProg[3],CoulProg[4]]);   // dessine le fond de la fiche

with ImageFond.Canvas do
 begin                                                                                      // dessine la bordure
 pen.width:=2;
 brush.Style:=BsClear;
 pen.Color:=clblack;
 rectangle(cliprect);
 end;

dessine_btn( ImageBtnQuitter.Canvas    , 0 , titrebtn[0] , False);           // dessine tous les boutons de la fiche
dessine_btn( ImageBtnClipboard.Canvas  , 1 , titrebtn[1] , False);
dessine_btn( ImageBtnEclaircir.Canvas  , 2 , ''          , False);
dessine_btn( ImageBtnAssombrire.Canvas , 3 , ''          , False);
dessine_btn( ImageBtnSave.Canvas       , 4 , ''          , False);
dessine_btn( ImageBtnLoad.Canvas       , 5 , ''          , False);
dessine_btn( ImageBtnNew.Canvas        , 6 , ''          , False);
dessine_btn( ImageBtnEfface.Canvas     , 7 , ''          , False);
dessine_btn( ImageBtnAjoute.Canvas     , 8 , ''          , False);
dessine_btn( ImageBtnExtraire.Canvas   , 9 , ''          , False);
dessine_btn( ImageBtnCompact.Canvas    , 10, ''          , False);
dessine_btn( ImageBtnTrier.Canvas      , 14, ''          , False);
end;

//***************************************

procedure TForm1.FormCreate(Sender: TObject);
begin


chemin:=extractfilepath(application.ExeName); // extrait le chemin de l'application
Application.HelpFile := chemin+'COULEUR.HLP';
charge_ini;

SelX:=0;
SelY:=0;
doubleBuffered:=True;
Mouse:=false;

Affiche_jauge(rgb(Valrouge, ValVert, ValBleu));

DrawGradient(ImDegrade.Canvas,ImDegrade.Canvas.ClipRect,True,[clblack,rgb(ValRouge,ValVert,ValBleu),clwhite]);

Dessine_Stock;

actualise;
end;

//***************************************

procedure TForm1.FormDestroy(Sender: TObject);
begin
sauve_ini;
end;

//***************************************

procedure Tform1.charge_fichier(nom : string);
var F   : textfile;
    lig : string;
    i   : integer;
begin
if fileexists(nom) then
assignfile(F,Nom);
reset(F);
for I := 0 to 99 do begin
                    Readln(F,lig); // ici pas le choix;
                    Acolor[i]:=strtoint(lig);
                    end;
closefile(F);

end;

//***************************************

procedure Tform1.sauve_fichier(nom : string);
var F   : textfile;
    lig : string;
    i   : integer;
begin
changefileext(nom,'.COL');
assignfile(F,Nom);
rewrite(F);
for I := 0 to 99 do begin
                    lig := inttostr(Acolor[i]);
                    writeln(F,lig) // ici pas le choix;
                    end;
closefile(F);
end;
//***************************************

procedure TForm1.ImJaugeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (x>1) and (y>1) and (x<270) and (y<35) then
   begin
   Mouse:=true;
   case (sender as Timage).Tag of
    0: begin
       ValRouge:=x-6;
       if ValRouge<0 then ValRouge:=0 else if ValRouge>255 then ValRouge:=255;
       Dessine_Jauge(ImRouge,clred,ValRouge,0);
       end;
    1: begin

       ValVert:=x-6;
       if ValVert<0 then ValVert:=0 else if ValVert>255 then ValVert:=255;
       Dessine_Jauge(ImVert,clLime,ValVert,1);
       end;
    2: begin
       ValBleu:=x-6;
       if ValBleu<0 then ValBleu:=0 else if ValBleu>255 then ValBleu:=255;
       Dessine_Jauge(ImBleu,clblue,ValBleu,2);
       end;
    end;
   end;
PanelCouleur.Color:=rgb(ValRouge,ValVert,ValBleu);
end;

//***************************************

procedure TForm1.ImJaugeMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
DrawGradient(ImDegrade.Canvas,ImDegrade.Canvas.ClipRect,True,[clblack,rgb(ValRouge,ValVert,ValBleu),clwhite]);
Mouse:=False;
end;

//***************************************

procedure TForm1.ImJaugeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if mouse then
 if (x>1) and (y>1) and (x<270) and (y<35) then
   begin
   case (sender as Timage).Tag of
    0: begin
       ValRouge:=x-6;
       if ValRouge<0 then ValRouge:=0 else if ValRouge>255 then ValRouge:=255;
       Dessine_Jauge(ImRouge,clred,ValRouge,0);
       end;
    1: begin
       ValVert:=x-6;
       if ValVert<0 then ValVert:=0 else if ValVert>255 then ValVert:=255;
       Dessine_Jauge(ImVert,clLime,ValVert,1);
       end;
    2: begin
       ValBleu:=x-6;
       if ValBleu<0 then ValBleu:=0 else if ValBleu>255 then ValBleu:=255;
       Dessine_Jauge(ImBleu,clblue,ValBleu,2);
       end;
    end;
   end;
PanelCouleur.Color:=rgb(ValRouge,ValVert,ValBleu);
end;

//***************************************

procedure TForm1.ImStockDBClick(Sender: TObject);
begin
if Acolor[SelX+(SelY*10)]=-1 then exit;              // si la couleur sélectionnée est vide alors en quitte
Affiche_Jauge(Acolor[SelX+(SelY*10)]);               // affecte und couleur en stock a la couleur actuel
DrawGradient(ImDegrade.Canvas,ImDegrade.Canvas.ClipRect,true,[clblack,rgb(ValRouge,ValVert,ValBleu),clwhite]);
end;

//***************************************

procedure TForm1.ImStockMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var I : integer;
begin
I:=(x div 25)+(10*(y div 25));
St1.Caption:=inttostr(i);
if Acolor[I]=-1
 then begin
      St2.Caption:='';
      St3.Caption:='';
      St4.Caption:='';
      St5.Caption:='';
      end else
      begin
      if AffHexa then
            begin
            St2.Caption:='$'+IntToHex(Acolor[I],8);             // affiche en héxadécimale
            St3.Caption:='$'+IntToHex(getRvalue(Acolor[I]),2);
            St4.Caption:='$'+IntToHex(getGvalue(Acolor[I]),2);
            St5.Caption:='$'+IntToHex(getBvalue(Acolor[I]),2);
            end else begin
                     St2.Caption:=inttostr(Acolor[I]);         // affiche en décimale
                     St3.Caption:=inttostr(getRvalue(Acolor[I]));
                     St4.Caption:=inttostr(getGvalue(Acolor[I]));
                     St5.Caption:=inttostr(getBvalue(Acolor[I]));
                     end;
      end;
end;

procedure TForm1.ImStockMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
selx:=x div 25;
SelY:=Y div 25;
Dessine_Stock;
ASelX:=selX;
ASelY:=SelY;
end;

//***************************************

procedure TForm1.ImStockMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var Sx,SY : byte;
    t     : integer;
begin
sx:=x div 25;
SY:=Y div 25;
if (ASelX<>sX) or (ASelY<>SY) then  // echange la place de deux couleurs
   begin
   t:=Acolor[sx+(10*sy)];
   Acolor[sx+(10*sy)]:=AColor[aselX+(10*aselY)];
   AColor[aselX+(10*aselY)]:=t;
   end;
Dessine_Stock;
end;

//***************************************

procedure TForm1.ImageBtnIconeDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(Sender as Timage).Top:=(Sender as Timage).Top+1;
(Sender as Timage).Left:=(Sender as Timage).Left+1;
end;

//***************************************

procedure TForm1.ImageBtnIconeUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(Sender as Timage).Top:=(Sender as Timage).Top-1;
(Sender as Timage).Left:=(Sender as Timage).Left-1;
end;

//***************************************

procedure TForm1.ImageBtnMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
dessine_btn( (sender as Timage).Canvas , (sender as Timage).Tag , TitreBtn[(sender as Timage).tag],true);
end;

//***************************************

procedure TForm1.ImageBtnMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
dessine_btn( (sender as Timage).Canvas , (sender as Timage).Tag , TitreBtn[(sender as Timage).tag],False);
end;

//***************************************

procedure TForm1.ImageTitreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;                                                 // déplace la fenêtre avec la souris
SendMessage(Form1.Handle, wm_SysCommand,$f012,0);
end;

//***************************************

procedure TForm1.ImageChromMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
ChromX:=x;
ChromY:=y;
end;

//***************************************

procedure TForm1.ImageChromClick(Sender: TObject);
begin
Affiche_Jauge(imagechrom.Canvas.Pixels[Chromx,ChromY]);
DrawGradient(ImDegrade.Canvas,ImDegrade.Canvas.ClipRect,True,[clblack,rgb(ValRouge,ValVert,ValBleu),clwhite]);
end;

//***************************************

procedure TForm1.ImDegradeMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
selscX:=X;
end;

//***************************************

procedure TForm1.ImDegradeClick(Sender: TObject);
begin
Affiche_Jauge(imDegrade.Canvas.Pixels[SelSCX,5]);
end;

//***************************************

procedure TForm1.PanelcouleurDblClick(Sender: TObject);
begin
if color_existe(PanelCouleur.Color) then
   begin
   messagedlg('La couleur est déja référencée !',mtinformation,[mbok,mbhelp],Hlp_Aide);
   exit;
   end;
Acolor[SelX+(SelY*10)]:=PanelCouleur.Color;
if selection_suivante then messagedlg('Il n''y a plus de cases vides !',mtinformation,[mbok,mbhelp],0);
dessine_stock;

end;

//#######################################

//***************************************

procedure TForm1.ImageBtnAideClick(Sender: TObject);
begin
// mettre le fichier d'aide
 Application.HelpContext(Hlp_Presentation);
end;
//***************************************

procedure TForm1.ImageBtnAssombrireClick(Sender: TObject);
begin
dec(ValRouge,10);
if ValRouge<0 then ValRouge:=0;
dec(ValVert,10);
if ValVert<0 then ValVert:=0;
dec(ValBleu,10);
if ValBleu<0 then ValBleu:=0;
Affiche_Jauge(rgb(ValRouge, ValVert, ValBleu));

end;

//***************************************

procedure TForm1.ImageBtnClipBoardClick(Sender: TObject);
begin
ClipBoard.AsText := '$'+intTohex(RGB(ValRouge,ValVert,ValBleu),8);
end;

//***************************************

procedure TForm1.ImageBtnCompactClick(Sender: TObject);
var X  : Shortint;
begin
x:=-1;
while (x<99) do
 begin
 if (Acolor[x]=-1) and (Acolor[succ(x)]<>-1) then
                            begin
                            Acolor[x]:=Acolor[succ(x)];
                            Acolor[succ(x)]:=-1;
                            x:=0;
                            end;
 inc(x);
 end;
if (Acolor[0]=-1) and (Acolor[1]<>-1) then ImageBtnCompactClick(self);
selection_suivante;
dessine_Stock;
end;

//***************************************

procedure TForm1.ImageBtnEclaircirClick(Sender: TObject);
begin
inc(ValRouge,10);
if ValRouge>255 then ValRouge:=255;
inc(ValVert,10);
if ValVert>255 then ValVert:=255;
inc(ValBleu,10);
if ValBleu>255 then ValBleu:=255;
Affiche_Jauge(rgb(ValRouge, ValVert, ValBleu));
end;

//***************************************

procedure TForm1.ImageBtnEffaceClick(Sender: TObject);
begin
Acolor[SelX+(SelY*10)]:=-1;
dessine_stock;
end;

//***************************************

procedure TForm1.ImageBtnLoadClick(Sender: TObject);
begin
opendialog1.InitialDir:=cheminload;
if openDialog1.Execute then begin
                            cheminload:=extractfilepath(opendialog1.FileName);
                            charge_fichier(opendialog1.FileName);
                            dessine_stock;
                            Dessine_titre(ImageTitre.Canvas,'Couleur','( '+changefileext(extractfilename(opendialog1.FileName),'')+' )');
                            end;
end;

//***************************************

procedure TForm1.ImageBtnMiniClick(Sender: TObject);
begin
application.Minimize;
end;

//***************************************

procedure TForm1.ImageBtnNewClick(Sender: TObject);
var i : byte;
begin
if messagedlg('Voulez vous effacer toute les couleurs ?',Mtconfirmation,[mbyes,mbno],0)=mrno then exit;
For i:=0 to 99 do Acolor[I]:=-1;
selx:=0;
sely:=0;
dessine_stock;
ImStockMouseMove(self ,[],0,0);
end;

//***************************************

procedure TForm1.ImageBtnOptionsClick(Sender: TObject);
begin
form1.Hide;
form2.actualise;
form2.showmodal;
form1.Show;
end;

//***************************************

procedure TForm1.ImageBtnQuitterClick(Sender: TObject);
begin
Application.Terminate;
end;

//***************************************

procedure TForm1.ImageBtnSaveClick(Sender: TObject);
begin
savedialog1.InitialDir:=cheminSave;
if saveDialog1.Execute then begin
                            cheminSave:=extractfilepath(savedialog1.FileName);
                            sauve_fichier(changefileext(savedialog1.FileName,'.COL'));
                            Dessine_titre(ImageTitre.Canvas,'Couleur','( '+extractfilename(savedialog1.FileName)+' )');
                            end;
end;

//***************************************


procedure TForm1.ImageBtnTrierClick(Sender: TObject);
begin
Trier_Les_couleurs ;
dessine_stock;
end;

end.
