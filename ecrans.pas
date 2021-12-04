{
 Les différentes sections du jeu
}
unit Ecrans;

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
// renvoie : 1 si l'utilisateur veut acheter le casque
// renvoie : 2 si l'utilisateur veut acheter le torse
// renvoie : 3 si l'utilisateur veut acheter les jambières
// renvoie : 4 si l'utilisateur veut acheter les bottes
// renvoie : 5 si l'utilisateur veut acheter les gants
// renvoie : 6 si l'utilisateur veut aller en ville
     function IHM_EcranMarchand : integer;
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
    uses GestionEcran, AideIHM, Menus, Personnage;

    function IHM_EcranAccueil: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== Monster Hunter : New World ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Nouvelle Partie', 10, 28);
            IHM_Couleur(1, 0);
            IHM_TexteGauche('Quitter', 12, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 2);
            if choix = 1 then
                IHM_EcranAccueil := 1
            else
                if IHM_MenuQuitter then
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
    begin  {
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
                             }
        IHM_Personnage := 1;
    end;


    function IHM_EcranVille: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin
            IHM_Couleur(0, 0);
            IHM_Effacer;
            IHM_CadreAvecTitre(0, 99, 0, 26, 'VILLE', SIMPLE);
            IHM_Couleur(1, 0);
            IHM_TexteGauche('Voir l''inventaire', 8, 28);      
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Aller '#224' la chambre', 10, 28);
            IHM_TexteGauche('Aller '#224' la forge', 12, 28);
            IHM_TexteGauche('Aller au Magasin', 14, 28);
            IHM_TexteGauche('Aller '#224' la Cantine', 16, 28);
            IHM_TexteGauche('Combattre un monstre', 18, 28);    
            IHM_Couleur(1, 0);
            IHM_TexteGauche('Quitter', 20, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(8, 25, 7);
            case choix of
                1:
                    choix := 0;
                2..6:
                    IHM_EcranVille := choix-1;
                7:
                    if IHM_MEnuQuitter then
                        IHM_EcranVille := 0
                    else
                        choix := 0;
            end;
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
            IHM_TexteGauche('Casque A DESSINER LE CADRE J ARRIVE PAS', 10, 28);
            IHM_TexteGauche('Torse A DESSINER LE CADRE J ARRIVE PAS', 12, 28);
            IHM_TexteGauche('Jambieres A DESSINER LE CADRE J ARRIVE PAS', 14, 28);
            IHM_TexteGauche('Bottes A DESSINER LE CADRE J ARRIVE PAS', 16, 28);
            IHM_TexteGauche('Gants A DESSINER LE CADRE J ARRIVE PAS', 18, 28);
            IHM_TexteGauche('Aller En Ville', 20, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 6);
            if choix = 1 then
                IHM_EcranMarchand := 0;
	    if choix = 2 then
                IHM_EcranMarchand := 0;
	    if choix = 3 then
                IHM_EcranMarchand := 0;
	    if choix = 4 then
                IHM_EcranMarchand := 0;
	    if choix = 5 then
                IHM_EcranMarchand := 0;
            if choix = 6 then
                IHM_EcranMarchand := IHM_EcranVille

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

    function IHM_EcranChambre: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin
            IHM_Couleur(0, 0);
            IHM_Effacer;
            IHM_CadreAvecTitre(0, 99, 0, 26, 'CHAMBRE', SIMPLE);
            IHM_Couleur(1, 0);
            IHM_TexteGauche('Se reposer', 10, 28);
            IHM_TexteGauche('D'#233'poser des objets', 12, 28);  
            IHM_TexteGauche('Prendre des objets', 14, 28);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Retourner en ville', 16, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 4);
            case choix of
                1..3:
                    choix := 0;
                4:
                    IHM_EcranChambre := 1;

            end;
        end;
    end;

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
function IHM_EcranCombattreMonstre: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0  do begin // demander à nouveau si la saisie de l'utilisateur n'est pas valide
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== CHAMP DE BATAILLE ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Attquer', 10, 28);
            IHM_TexteGauche('Utiliser Bombes', 12, 28);
            IHM_TexteGauche('Utiliser ETC', 14, 28);
            IHM_TexteGauche('Aller En Ville', 16, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 4);
            if choix = 1 then
                IHM_EcranCombattreMonstre := 1;
            if choix = 2 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 2 then
                IHM_EcranCombattreMonstre :=1;
            if choix = 4 then
                IHM_EcranCombattreMonstre := IHM_EcranVille;

        end;
    end;

end.

