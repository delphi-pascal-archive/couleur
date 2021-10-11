unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TForm2 = class(TForm)
    ImageFond        : TImage;
    ImageTitre       : TImage;
    ImageBtnQuitter  : TImage;
    ImagePanel1      : TImage;
    ImagePanel2      : TImage;
    ImagePanel3      : TImage;
    ImagePanel4      : TImage;
    ImageBtnClose    : TImage;
    ImageBtnDefaut   : TImage;
    ImageCheck       : TImage;
    Shape1           : TShape;
    Shape2           : TShape;
    Shape3           : TShape;
    Shape4           : TShape;
    Shape5           : TShape;
    Shape6           : TShape;
    Shape7           : TShape;
    Shape8           : TShape;
    Shape9           : TShape;
    Shape10          : TShape;
    Shape11          : TShape;
    Label1           : TLabel;
    Label2           : TLabel;
    Label3           : TLabel;
    Label4           : TLabel;
    Label5           : TLabel;
    Label6           : TLabel;
    Label7           : TLabel;
    Label8           : TLabel;
    Label9           : TLabel;
    Label10          : TLabel;
    Label11          : TLabel;
    Label12          : TLabel;

    procedure FormCreate                 ( Sender : TObject);
    procedure Actualise;
    procedure dessine_panel              ( Canvas : Tcanvas; Titre : string; col1,col2,col3,col4 : Tcolor);
    procedure ImageTitreMouseDown        ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnQuitterMouseUp     ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnQuitterMouseDown   ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnDefautMouseDown    ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnDefautMouseUp      ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ShapeMouseDown             ( Sender : TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ImageBtnQuitterClick       ( Sender : TObject);
    procedure ImageBtnDefautClick        ( Sender : TObject);
    procedure ImageCheckClick            ( Sender : TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}
uses unit1;

//***************************************

procedure TForm2.FormCreate(Sender: TObject);

begin
doubleBuffered:=true;
Actualise;
dessine_panel(imagePanel1.Canvas,'Couleurs Titre',clSilver,$00D4D1CD,$00FFD5D5,$00A8764B);
dessine_panel(imagePanel2.Canvas,'Couleurs Fond',clSilver,$00D4D1CD,$00FFD5D5,$00A8764B);
dessine_panel(imagePanel3.Canvas,'Couleurs Bouton relaché',clSilver,$00D4D1CD,$00FFD5D5,$00A8764B);
dessine_panel(imagePanel4.Canvas,'Couleurs Bouton enfoncé',clSilver,$00D4D1CD,$00FFD5D5,$00A8764B);

end;

//***************************************

procedure Tform2.Actualise;
var i : byte;
begin
for i:=1 to 11 do Tshape(FindComponent('Shape'+ IntToStr(i))).Brush.Color:=form1.coulprog[pred(i)];

form1.DEssine_titre(imageTitre.canvas, 'Options','');

form1.DrawGradient(ImageFond.Canvas,ImageFond.Canvas.ClipRect,false,[form1.CoulProg[3],form1.CoulProg[4]]);

with ImageFond.Canvas do
 begin
 pen.width:=2;
 brush.Style:=bsclear;
 pen.Color:=clblack;
 rectangle(cliprect);
 end;

form1.dessine_btn( ImageBtndefaut.Canvas   , 11 , titrebtn[11] , False);
form1.dessine_btn( ImageBtnClose.Canvas    , 0  , titrebtn[0]  , False);

form1.imagelist1.Draw(imageCheck.Canvas,0,0,12+byte(form1.AffHexa),true);
end;

//***************************************

procedure Tform2.dessine_panel(canvas : Tcanvas; Titre : string; col1,col2,col3,col4 : Tcolor);
begin
With canvas do
 begin
 form1.DrawGradient(Canvas,Canvas.ClipRect,true,[Col1,Col2]);
 form1.DrawGradient(Canvas,rect(0,0,cliprect.right,20),true,[Col3,Col4]);
 brush.Style:=bsclear;
 pen.Color:=Clblack;
 rectangle(cliprect);
 Rectangle(rect(0,0,cliprect.right,20));
 textout(5,3,titre);
 end;
end;

//***************************************

procedure TForm2.ImageTitreMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
SendMessage(Form2.Handle, wm_SysCommand,$f012,0);
end;

//***************************************

procedure TForm2.ImageBtnQuitterMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(Sender as Timage).Top:=(Sender as Timage).Top-1;
(Sender as Timage).Left:=(Sender as Timage).Left-1;

end;

//***************************************

procedure TForm2.ImageBtnQuitterMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
(Sender as Timage).Top:=(Sender as Timage).Top+1;
(Sender as Timage).Left:=(Sender as Timage).Left+1;
end;

//***************************************

procedure TForm2.ImageBtnDefautMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Form1.dessine_btn( (sender as Timage).Canvas , (sender as Timage).Tag , unit1.TitreBtn[(sender as Timage).tag],True);
end;

//***************************************

procedure TForm2.ImageBtnDefautMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
Form1.dessine_btn( (sender as Timage).Canvas , (sender as Timage).Tag , unit1.TitreBtn[(sender as Timage).tag],False);
end;

//***************************************

procedure TForm2.ShapeMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
form1.ColorDialog1.Color:=(sender as Tshape).Brush.Color;
if form1.ColorDialog1.Execute then begin
                                   (sender as Tshape).Brush.Color:=form1.ColorDialog1.Color;
                                   form1.coulProg[(sender as Tshape).Tag]:=form1.ColorDialog1.Color;
                                   Actualise;
                                   form1.Actualise;// redéssine les boutons, le fond et le titre de la form1
                                   end;

end;

//***************************************

procedure TForm2.ImageBtnQuitterClick(Sender: TObject);
begin
close;
end;

//***************************************

procedure TForm2.ImageBtnDefautClick(Sender: TObject);
Var i : byte;
begin
for i:=0 to 10 do form1.coulprog[i]:=couldefaut[i];
Actualise;
form1.Actualise;
end;

//***************************************

procedure TForm2.ImageCheckClick(Sender: TObject);
begin
form1.AffHexa:=not form1.AffHexa;
form1.Affiche_Jauge(rgb(valRouge, ValVert, ValBleu));
form1.ImStockMouseMove(self ,[],0,0);
Actualise;
end;

end.
