unit AideIHM;

interface

    procedure IHM_Initialiser;

    procedure couleur(ctexte, cfond: Integer);

    procedure texteCentre(texte: String; ligne: Integer = -1); 
    procedure texteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);

    function listeDeChoix(ligne, colonne, nbChoix: Integer): Integer;

    function demanderOuiOuNon(question: string): Integer;

    const LARGEUR = 100;
          HAUTEUR = 30;

implementation       
    uses GestionEcran, SysUtils;
                                                                                                        
    const PALETTE_TEXTE: array [0..4] of Byte = (White, LightBlue, LightCyan, LightGreen, LightRed);
          PALETTE_FOND:  array [0..4] of Byte = (Black, Blue,      Cyan,      Green,      Red);

    var couleurTextePrecedente,
        couleurFondPrecedente: Byte;

    procedure IHM_Initialiser;
    begin
        changerTailleConsole(LARGEUR, HAUTEUR);
    end;

    procedure couleur(ctexte, cfond: Integer);
    begin
        couleurTextePrecedente := PALETTE_TEXTE[ctexte];
        couleurFondPrecedente  := PALETTE_FOND[cfond];
        couleur(couleurTextePrecedente, couleurFondPrecedente);
    end;

    procedure texteCentre(texte: String; ligne: Integer = -1);
    var
        pos: coordonnees;
    begin
        if ligne >= 0 then
            pos.y := ligne
        else
            pos := positionCurseur;
        pos.x := (LARGEUR - length(texte)) div 2;
        ecrireEnPosition(pos, texte);
    end;

    procedure texteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);
    var
        pos: coordonnees;
    begin
        pos := positionCurseur;
        if colonne >= 0 then pos.x := colonne;
        if ligne >= 0 then pos.y := ligne;

        ecrireEnPosition(pos, texte);
    end;
                              
    function listeDeChoix(ligne, colonne, nbChoix: Integer): Integer;
    var
        touche: Char;
        pos: coordonnees;
        i: Integer;
    begin
        listeDeChoix := 0;

        pos.x := colonne-1;
        for i := 0 to nbChoix do begin
            pos.y := ligne + i*2;
            ecrireEnPosition(pos, '[' + intToStr(i+1) + ']');
        end;

        readln;
    end;

    function demanderOuiOuNon(question: string): Integer;
    begin
        couleur(2, 1);
        dessinerCadreXY(25, 10, 75, 20, double, couleurTextePrecedente, couleurFondPrecedente);
        readln;
        demanderOuiOuNon := 1;
    end;

end.

