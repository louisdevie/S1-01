unit AideIHM;

interface

    procedure IHM_Initialiser;

    procedure IHM_Couleur(ctexte, cfond: Integer);

    procedure IHM_Effacer;

    procedure IHM_TexteCentre(texte: String; ligne: Integer = -1);
    procedure IHM_TexteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);

    function IHM_ListeDeChoix(ligne, colonne, nbChoix: Integer): Integer;

    function IHM_DemanderOuiOuNon(question: string): Integer;

    const LARGEUR = 100;
          HAUTEUR = 30;

implementation       
    uses GestionEcran, SysUtils;
                                                                                                        
    const PALETTE_TEXTE: array [0..4] of Byte = (WHITE, LIGHTBLUE, LIGHTCYAN, LIGHTGREEN, LIGHTRED);
          PALETTE_FOND:  array [0..4] of Byte = (BLACK, BLUE,      CYAN,      GREEN,      RED     );

    var couleurTextePrecedente,
        couleurFondPrecedente: Byte;

    procedure cadre(gauche, droite, haut, bas: Integer; bordure: TypeBordure);
    var c1, c2 : coordonnees;
    begin                  
        c1.x := gauche; c1.y := haut; c2.x := droite; c2.y := bas;
        dessinerCadre(c1, c2, bordure, couleurTextePrecedente, couleurFondPrecedente);
    end;

    procedure IHM_Initialiser;
    begin
        changerTailleConsole(LARGEUR, HAUTEUR);
    end;

    procedure IHM_Couleur(ctexte, cfond: Integer);
    begin
        couleurTextePrecedente := PALETTE_TEXTE[ctexte];
        couleurFondPrecedente  := PALETTE_FOND[cfond];
        couleurs(couleurTextePrecedente, couleurFondPrecedente);
    end;

    procedure IHM_Effacer;
    begin
        effacerEtColorierEcran(couleurFondPrecedente);
    end;

    procedure IHM_TexteCentre(texte: String; ligne: Integer = -1);
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

    procedure IHM_TexteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);
    var
        pos: coordonnees;
    begin
        pos := positionCurseur;
        if colonne >= 0 then pos.x := colonne;
        if ligne >= 0 then pos.y := ligne;

        ecrireEnPosition(pos, texte);
    end;

    procedure saisirNombre(var n: Integer);
    var
        pos: Coordonnees;
        saisie: String;
        i, chiffre, ordre, resultat: Integer;
        succes: Boolean;
    begin
        IHM_Couleur(0, 0);
        cadre(0, 99, 27, 29, SIMPLE);
        pos.x := 3; pos.y := 28;
        IHM_Couleur(2, 0);
        ecrireEnPosition(pos, '> ');

        readln(saisie);

        resultat := 0;
        succes := true;
        ordre := 1;
        for i := length(saisie) downto 1 do begin
            chiffre := ord(saisie[i]) - ord('0');
            if (0 <= chiffre) and (chiffre < 10) then
                resultat += ordre * chiffre
            else begin
                succes := false;
                break;
            end;
            ordre *= 10;
        end;

        if succes then
            n := resultat;
    end;

    procedure saisirBooleen(var n: Integer);
    var
        pos: Coordonnees;
        saisie: String;
    begin
        IHM_Couleur(0, 0);
        cadre(0, 99, 27, 29, SIMPLE);
        pos.x := 3; pos.y := 28;
        IHM_Couleur(2, 0);
        ecrireEnPosition(pos, 'O/n > ');

        readln(saisie);

        n := 0;
        if length(saisie) = 1 then
            if saisie[1] = 'O' then
                n := 1;
    end;

    function IHM_ListeDeChoix(ligne, colonne, nbChoix: Integer): Integer;
    var
        touche: Char;
        pos: coordonnees;
        i: Integer;
    begin
        pos.x := colonne-1;
        for i := 1 to nbChoix do begin
            pos.y := ligne + (i - 1)*2;
            ecrireEnPosition(pos, '[' + intToStr(i) + ']');
        end;

        IHM_ListeDeChoix := 0;
        while (IHM_ListeDeChoix < 1) or (IHM_ListeDeChoix > nbChoix) do
            saisirNombre(IHM_ListeDeChoix);
    end;

    function IHM_DemanderOuiOuNon(question: string): Integer;
    begin
        IHM_Couleur(2, 1);
        cadre(25, 75, 9, 15, double);
        IHM_TexteCentre(question, 12);
        saisirBooleen(IHM_DemanderOuiOuNon);
    end;

end.

