{
 Unité "helper" pour l'IHM
}
unit AideIHM;

interface
    uses GestionEcran;

    // Fixe la taille de la console
    procedure IHM_Initialiser;

    // Change la couleur du texte et de l'arrière-plan
    // Voir les palettes pour les couleurs disponibles
    procedure IHM_Couleur(ctexte, cfond: Integer);

    // efface toute la console
    procedure IHM_Effacer;

    // affiche du texte centré
    // si la ligne n'est pas précisée ou -1, affiche sur la ligne courante du curseur
    procedure IHM_TexteCentre(texte: String; ligne: Integer = -1);
    // affiche du texte aligné à gauche                               
    // si la ligne/colonne n'est pas précisée ou -1, affiche à la position courante du curseur
    procedure IHM_TexteGauche(texte: String; ligne: Integer = -1; colonne: Integer = -1);

    // Dessine un cadre simple
    procedure IHM_Cadre(gauche, droite, haut, bas: Integer; bordure: TypeBordure);
    // Dessine un cadre avec un titre
    procedure IHM_CadreAvecTitre(gauche, droite, haut, bas: Integer; titre: String; bordure: TypeBordure);

    // Utilitaire pour liste de choix
    // ligne et colonne sont la position où placer les puces
    function IHM_ListeDeChoix(ligne, colonne, nbChoix: Integer): Integer;

    // Affiche un cadre avec une question par laquelle l'utilisateur peut répondre par oui ou non
    function IHM_DemanderOuiOuNon(question: string): Integer;

    // Taille de la console
    const LARGEUR = 100;
          HAUTEUR = 30;


implementation       
    uses SysUtils;

    // palette de couleurs                       normal accent. 1  accent. 2  spécial 1   spécial 2
    const PALETTE_TEXTE: array [0..4] of Byte = (WHITE, LIGHTBLUE, LIGHTCYAN, LIGHTGREEN, LIGHTRED);
          PALETTE_FOND:  array [0..4] of Byte = (BLACK, BLUE,      CYAN,      GREEN,      RED     );

    // dernières couleurs utilisées
    var couleurTextePrecedente,
        couleurFondPrecedente: Byte;

    // raccourci pour dessinerCadre()
    procedure IHM_Cadre(gauche, droite, haut, bas: Integer; bordure: TypeBordure);
    var c1, c2 : coordonnees;
    begin                  
        c1.x := gauche; c1.y := haut; c2.x := droite; c2.y := bas;
        dessinerCadre(c1, c2, bordure, couleurTextePrecedente, couleurFondPrecedente);
    end;

    procedure IHM_CadreAvecTitre(gauche, droite, haut, bas: Integer; titre: String; bordure: TypeBordure);
    var c1, c2 : coordonnees;
    begin
        c1.x := gauche;
        c1.y := haut+1;
        c2.x := droite;
        c2.y := bas;
        dessinerCadre(c1, c2, bordure, couleurTextePrecedente, couleurFondPrecedente);

        c1.x := ((LARGEUR - length(titre)) div 2) - 2;
        c1.y := haut;
        c2.x := ((LARGEUR + length(titre)) div 2) + 1;
        c2.y := haut+2;     
        dessinerCadre(c1, c2, bordure, couleurTextePrecedente, couleurFondPrecedente);

        deplacerCurseurXY(c1.x, haut+1);
        if bordure = SIMPLE then begin
            write(#180#32); write(titre); write(#32#195);
        end else begin
            write(#185#32); write(titre); write(#32#204);
        end;
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

    // Si l'utilisateur entre un nombre entier positif,
    // mets ce nombre dans n, sinon ne modifie pas n
    procedure saisirNombre(var n: Integer);
    var
        pos: Coordonnees;
        saisie: String;
        i, chiffre, ordre, resultat: Integer;
        succes: Boolean;
    begin
        IHM_Couleur(0, 0);
        IHM_Cadre(0, 99, 27, 29, SIMPLE);
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

    // Si l'utilisateur entre O, mets n à 1,
    // sinon mets n à 0
    procedure saisirBooleen(var n: Integer);
    var
        pos: Coordonnees;
        saisie: String;
    begin
        IHM_Couleur(0, 0);
        IHM_Cadre(0, 99, 27, 29, SIMPLE);
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
        // affichage des puces
        pos.x := colonne-1;
        for i := 1 to nbChoix do begin
            pos.y := ligne + (i - 1)*2;
            ecrireEnPosition(pos, '[' + intToStr(i) + ']');
        end;

        IHM_ListeDeChoix := 0;
        while (IHM_ListeDeChoix < 1) or (IHM_ListeDeChoix > nbChoix) do // recommencer si la saisie n'est pas valide
            saisirNombre(IHM_ListeDeChoix);
    end;

    function IHM_DemanderOuiOuNon(question: string): Integer;
    begin
        IHM_Couleur(1, 0);
        IHM_CadreAvecTitre(25, 75, 9, 16, 'Confirmation', double);
        IHM_Couleur(0, 0);
        IHM_TexteCentre(question, 13);
        saisirBooleen(IHM_DemanderOuiOuNon);
    end;

end.

