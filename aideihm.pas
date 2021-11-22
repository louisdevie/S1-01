unit AideIHM;

interface

    procedure IHM_Initialiser;

    procedure couleur(ctexte, cfond: Integer);

    procedure texteCentre(texte: String; ligne: Integer = -1); 
    procedure texteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);

    function listeDeChoix(ligne, colonne, nbChoix: Integer): Integer;

    const LARGEUR = 100;
          HAUTEUR = 30;

implementation       
    uses GestionEcran, Crt, Math;
                                                                                                        
    const PALETTE_TEXTE: array [0..4] of Byte = (White, LightBlue, LightCyan, LightGreen, LightRed);
          PALETTE_FOND:  array [0..4] of Byte = (Black, Blue,      Cyan,      Green,      Red);
          EXTREMITE_ECRAN: coordonnees = (x: LARGEUR; y: HAUTEUR);

    var couleurTextePrecedente,
        couleurFondPrecedente: Byte;

    function vraiModulo(a, b: Integer): Integer;
    begin
       vraiModulo := a - (floor(a / b)) * b;
    end;

    procedure IHM_Initialiser;
    begin
        changerTailleConsole(LARGEUR, HAUTEUR);
    end;

    procedure couleur(ctexte, cfond: Integer);
    begin
        couleurTextePrecedente := PALETTE_TEXTE[ctexte];
        couleurFondPrecedente  := PALETTE_FOND[cfond];
        textColor(couleurTextePrecedente);
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
    begin
        listeDeChoix := 0;
        pos.x := colonne; pos.y := ligne;
        ecrireEnPosition(pos, '>');
        deplacerCurseur(EXTREMITE_ECRAN);

        while touche <> #13 do begin
            touche := readKey;

            if touche = #0 then begin
                touche := readKey;

                if touche = 'P' then begin
                    listeDeChoix += 1;
                end else if touche = 'H' then begin
                    listeDeChoix -= 1;
                end;
                listeDeChoix := vraiModulo(listeDeChoix, nbChoix);

                ecrireEnPosition(pos, ' ');
                pos.y := ligne + listeDeChoix*2;
                ecrireEnPosition(pos, '>');
                deplacerCurseur(EXTREMITE_ECRAN);
            end;
        end;
    end;

end.

