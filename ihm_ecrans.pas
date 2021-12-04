{
 Les différentes sections du jeu
}
unit IHM_Ecrans;

interface
// affiche le menu de Création Personnage
function IHM_Personnage:integer;

// affiche le menu EcranVille
// renvoie : 0 si l'utilisateur veut quitter
// renvoie : 1 si l'utilisateur veut aller dans sa chambre
// renvoie : 2 si l'utilisateur veut aller à la forge
// renvoie : 3 si l'utilisateur veut aller au magasin
// renvoie : 4 si l'utilisateur veut aller à la cantine
// renvoie : 5 si l'utilisateur veut aller affronter un monstre
function IHM_EcranVille: integer;

// affiche le menu EcranMarchand
// renvoie : 1 si l'utilisateur veut aller dans la section acheter
// renvoie : 2 si l'utilisateur veut aller dans la section vendre
// renvoie : 3 si l'utilisateur veut aller en ville
function IHM_EcranMarchand : integer;

// affiche le menu IHM_EcranAcheter
// renvoie : 1 si l'utilisateur veut acheter le casque
// renvoie : 2 si l'utilisateur veut acheter le torse
// renvoie : 3 si l'utilisateur veut acheter les jambières
// renvoie : 4 si l'utilisateur veut acheter les bottes
// renvoie : 5 si l'utilisateur veut acheter les gants
// renvoie : 6 si l'utilisateur veut acheter les gants
// renvoie : 7 si l'utilisateur veut acheter les gants
// renvoie : 8 si l'utilisateur veut aller en ville
function IHM_EcranAcheter: integer;

//affiche le menu IHM_EcranVendre
// renvoie : 1 si l'utilisateur veut vendre le casque
// renvoie : 2 si l'utilisateur veut vendre le torse
// renvoie : 3 si l'utilisateur veut vendre les jambières
// renvoie : 4 si l'utilisateur veut vendre les bottes
// renvoie : 5 si l'utilisateur veut vendre les gants
// renvoie : 6 si l'utilisateur veut vendre les gants
// renvoie : 7 si l'utilisateur veut vendre les gants
// renvoie : 8 si l'utilisateur veut aller en ville
function IHM_EcranVendre: integer;

// affiche le menu EcranCantine
// renvoie : 1 si l'utilisateur veut prendre un repas
// renvoie : 2 si l'utilisateur veut aller en ville
function IHM_EcranCantine : integer;

// affiche le menu EcranChambre
// renvoie : 1 si l'utilisateur veut se reposer
// renvoie : 2 si l'utilisateur veut gerer son equipement
// renvoie : 3 si l'utilisateur veut aller en ville
function IHM_EcranChambre: integer;

// affiche le menu EcranForge
// renvoie : 1 si l'utilisateur veut fabriquer armures
// renvoie : 2 si l'utilisateur veut fabriquer armes
// renvoie : 3 si l'utilisateur veut aller en ville
function IHM_EcranForge: integer;

// affiche le menu EcranForge
// renvoie : 1 si l'utilisateur veut attaquer le monstre
function IHM_EcranCombattreMonstre:integer;

// affiche le menu principal
// renvoie : 0 si l'utilisateur veut quitter
//           1 si l'utilisateur veut commencer une nouvelle partie
function IHM_EcranAccueil: integer;

implementation
    uses AideIHM, Menus, Personnage,GestionEcran;

    function IHM_EcranAccueil: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== Monster Hunter : New world ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Nouvelle Partie', 10, 28);
            IHM_TexteGauche('Quitter', 12, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 2);
            if choix = 1 then
                IHM_EcranAccueil := 1
            else
                if IHM_MEnuQuitter then
                    IHM_EcranAccueil := 0
                else
                    choix := 0;
        end;
    end;

    //fonction création de personnage
    function IHM_Personnage:integer;
    var
        personnage: typePersonnage;
        choix: integer ;
    begin
        IHM_Couleur(1, 0);
        IHM_Effacer;
        IHM_Couleur(0, 0);
        IHM_TexteCentre('====Creation de Personnage====', 5);
        IHM_TexteGauche('Nom : ', 8, 28);
        readln(personnage.Nom);
        IHM_TexteGauche('Sexe : ', 10, 28);
        readln(personnage.Sexe);
        IHM_TexteGauche('Taille : ', 12, 28);
        readln(personnage.Taille);

        IHM_Personnage := 1;
    end;

//VILLE///////////////////////////////////////////////////////////////////////////
function IHM_EcranVille: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== BIENVENUE EN VILLE DE MOSTER HUNTER ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Choisissez le numero qui represente l''endroit que vous voulez aller', 8, 16);
            IHM_TexteGauche('Chambre', 10, 28);
            IHM_TexteGauche('Forge', 12, 28);
            IHM_TexteGauche('Marchand', 14, 28);
            IHM_TexteGauche('Cantine', 16, 28);
            IHM_TexteGauche('Combattre Monstre', 18, 28);
            IHM_TexteGauche('Quitter', 20, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 6);
            if choix = 1  then
                IHM_EcranVille := IHM_EcranChambre;
            if choix = 2  then
                IHM_EcranVille := IHM_EcranForge;
            if choix = 3  then
                IHM_EcranVille := IHM_EcranMarchand;
            if choix = 4  then
                IHM_EcranVille := IHM_EcranCantine;
            if choix = 5  then
                IHM_EcranVille := IHM_EcranCombattreMonstre


            else
                if IHM_MEnuQuitter then
                    IHM_EcranVille := 0
                else
                    choix := 0;
        end;
    end;
//MARCHAND////////////////////////////////////////////////////////////////////////////
function IHM_EcranMarchand: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== MARCHAND ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('ACHETER', 10, 28);
            IHM_TexteGauche('VENDRE', 12, 28);
            IHM_TexteGauche('Aller En Ville', 14, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 3);
            if choix = 1 then
                IHM_EcranMarchand := IHM_EcranAcheter;
	    if choix = 2 then
                IHM_EcranMarchand := IHM_EcranVendre;
	    if choix = 3 then
                IHM_EcranMarchand := IHM_EcranVille;
        end;
    end;
//IHM ACHETER ////////////////////////////////////////////////////////////////////////////
//Qui affiche les objets qu'on peut acheter
function IHM_EcranAcheter: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== ACHAT OBJETS ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Casque', 10, 28);
            IHM_TexteGauche('Torse', 12, 28);
            IHM_TexteGauche('Jambieres', 14, 28);
            IHM_TexteGauche('Bottes', 16, 28);
            IHM_TexteGauche('Gants', 18, 28);
            IHM_TexteGauche('Bombe', 20, 28);
            IHM_TexteGauche('Potion', 22, 28);
            IHM_TexteGauche('Retourne en Arriere', 24, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 8);
            if choix = 1 then
                IHM_EcranAcheter := 0;
	    if choix = 2 then
                IHM_EcranAcheter := 0;
	    if choix = 3 then
                IHM_EcranAcheter := 0;
	    if choix = 4 then
                IHM_EcranAcheter := 0;
	    if choix = 5 then
                IHM_EcranAcheter := 0;
            if choix = 6 then
                IHM_EcranAcheter := 0;
            if choix = 7 then
                IHM_EcranAcheter := 0;
            if choix = 8 then
                IHM_EcranAcheter := IHM_EcranMarchand;

        end;
    end;

//MENU VENDRE ////////////////////////////////////////////////////////////////////////////
//Qui affiche les objets qu'on peut vendre
function IHM_EcranVendre: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== VENDRE OBJETS ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Casque', 10, 28);
            IHM_TexteGauche('Torse', 12, 28);
            IHM_TexteGauche('Jambieres', 14, 28);
            IHM_TexteGauche('Bottes', 16, 28);
            IHM_TexteGauche('Gants', 18, 28);
            IHM_TexteGauche('Bombe', 20, 28);
            IHM_TexteGauche('Potion', 22, 28);
            IHM_TexteGauche('Retourne en Arriere', 24, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 8);
            if choix = 1 then
                IHM_EcranVendre := 0;
	    if choix = 2 then
                IHM_EcranVendre := 0;
	    if choix = 3 then
                IHM_EcranVendre := 0;
	    if choix = 4 then
                IHM_EcranVendre := 0;
	    if choix = 5 then
                IHM_EcranVendre := 0;
            if choix = 6 then
                IHM_EcranVendre := 0;
            if choix = 7 then
                IHM_EcranVendre := 0;
            if choix = 8 then
                IHM_EcranVendre := IHM_EcranMarchand;

        end;
    end;


//CANTINE////////////////////////////////////////////////////////////////////////////////
function IHM_EcranCantine: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== CANTINE ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Prendre le repas', 10, 28);
            IHM_TexteGauche('Aller En Ville', 12, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 2);
            if choix = 1 then
                IHM_EcranCantine := 0;
            if choix = 2 then
                IHM_EcranCantine := IHM_EcranVille

        end;
    end;

//CHAMBRE////////////////////////////////////////////////////////////////////////////////
function IHM_EcranChambre(): integer;
var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            //IHM_ViePersonnage();
            //IHM_ArgentPersonnage();
            IHM_TexteCentre('=== CHAMBRE ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Reposer', 10, 28);
            IHM_TexteGauche('Equipement', 12, 28);
            IHM_TexteGauche('Aller En Ville', 14, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 3);
            if choix = 1 then
                IHM_EcranChambre := 0;
            if choix = 2 then
                IHM_EcranChambre :=0;
            if choix = 3 then
                IHM_EcranChambre := IHM_EcranVille;

        end;
    end;

{A DESSINER LA CHAMBRE SI T'AS LE TEMPS
begin
dessinerCadreXY(0,2,119,31,simple,black,Lightgray);
IHM_TexteCentre('=== CHAMBRE ===', 5);

deplacerCurseurXY(28,5);writeln('      |======================|');
deplacerCurseurXY(28,6);writeln('      |======================|');
deplacerCurseurXY(28,7);writeln('      |======================|');
deplacerCurseurXY(28,8);writeln('      |======================|');
deplacerCurseurXY(28,9);writeln('      |======================|');
deplacerCurseurXY(28,10);writeln('     |======================|');
deplacerCurseurXY(28,11);writeln('     |======================|');
deplacerCurseurXY(28,12);writeln('     |======================|');
deplacerCurseurXY(28,13);writeln('     |======================|');
deplacerCurseurXY(28,14);writeln('     |======================|');
deplacerCurseurXY(28,15);writeln('     |======================|');
deplacerCurseurXY(28,16);writeln('     |======================|');
deplacerCurseurXY(28,17);writeln('     |======================|');
deplacerCurseurXY(28,18);writeln('     |======================|');
deplacerCurseurXY(28,19);writeln('     |======================|');
deplacerCurseurXY(28,20);writeln('     |======================|');
deplacerCurseurXY(28,21);writeln('     |======================|');
deplacerCurseurXY(28,22);writeln('     |======================|');
deplacerCurseurXY(28,23);writeln('==================================');
deplacerCurseurXY(28,24);writeln('==================================');
end;
}

//CHAMBRE////////////////////////////////////////////////////////////////////////////////
function IHM_EcranForge: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== FORGE ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Fabriquer', 8, 24);
            IHM_TexteGauche('Armures', 10, 28);
            IHM_TexteGauche('Armes', 12, 28);
            IHM_TexteGauche('Aller En Ville', 14, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 3);
            if choix = 1 then
                IHM_EcranForge := 0;
            if choix = 2 then
                IHM_EcranForge :=0;
            if choix = 3 then
                IHM_EcranForge := IHM_EcranVille;

        end;
    end;

//MONSTRE////////////////////////////////////////////////////////////////////////////////
function IHM_EcranCombattreMonstre(): integer;
    var
        choix: Integer;
    begin
         //IHM_ArgentPersonnage;   // JE VEUX APPELER CETTE FONCTION POUR QU'IL AFFICHE L'ARGENT DU PERSONNAGE MAIS JE SAIS PAS COMMENT FAIRE
         //IHM_ViePersonnage;      // JE VEUX APPELER CETTE FONCTION POUR QU'IL AFFICHE LA VIE   DU PERSONNAGE MAIS JE SAIS PAS COMMENT FAIRE
        choix := 0;
        while choix = 0  do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== CHAMP DE BATAILLE ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Attaquer', 10, 28);
            IHM_TexteGauche('Utiliser Bombe', 12, 28);
            IHM_TexteGauche('Utiliser Potion pour augementer la Vie', 14, 28);
            IHM_TexteGauche('Utiliser Potion pour augementer le Degat', 16, 28);
            IHM_TexteGauche('Utiliser Potion pour augementer l''Armure', 18, 28);
            IHM_TexteGauche('Aller En Ville', 20, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 6);
            if choix = 1 then
                IHM_EcranCombattreMonstre := 1;
            if choix = 2 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 3 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 4 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 5 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 6 then
                IHM_EcranCombattreMonstre := IHM_EcranVille;

        end;
    end;

end.

