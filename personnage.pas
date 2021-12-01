unit Personnage;

{$mode objfpc}{$H+}

interface

//types
type
    typePersonnage = record
        Nom:string;                    //nom du personnage
        Sexe:string;                  //sexe du personnage
        Taille:integer;                //taile du personange
    end;


implementation
uses AideIHM,Menus;
//écran de création de personnage
function IHM_Personnage:integer;
var
  personnage:typePersonnage;
  choix: integer ;
begin
     choix := 1;
     while choix = 1 do begin // le jouer choisi de faire une nouvelle partie donc il va pourvoir creer son personnage
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_Couleur(0, 0);
            IHM_TexteCentre('====Création de personnage====', 5);

            IHM_TexteGauche('Nom', 12, 28);
            readln(personnage.Nom);
            IHM_TexteGauche('Prénom', 14, 28);
            readln(personnage.Sexe);
            IHM_TexteGauche('Taille', 16, 28);
            readln(personnage.Taille);

            IHM_TexteGauche('Commencer', 8, 28);
            IHM_TexteGauche('Quitter', 10, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 2);
            if choix = 1 then
                IHM_Personnage := 1
            else
                if IHM_MEnuQuitter then
                    IHM_Personnage := 0
                else
                    choix := 0;
        end;

end;


end.

