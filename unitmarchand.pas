unit unitMarchand;

{$mode objfpc}{$H+}

interface

uses
  unitTypes,AideIHM,Menus,GestionEcran,Inventaire;
//procedure le joueur n'a pas assez d'argent
procedure NoArgent(prix : TypePrixObjet);

implementation

//Procedure MARCHAND qui permet à l'utilisateur d'acheter ou vendre des objets
procedure MARCHAND(choix : Integer);
var
  personnage : typePersonnage;
  prix       : typePrixObjet;
begin
  //afficher ecran de marchand
  IHM_EcranMarchand();
  choix := IHM_ListeDeChoix(10, 25, 2);

            //ECRAN ACHETER

            //si choix =1
            if choix = 1 then
            begin
              //changer ecran , aller dans ecran acheter
              IHM_EcranMarchand := IHM_EcranAcheter;
              choix := IHM_ListeDeChoix(10, 25, 2);


                //si choix = 1 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 1 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete le casque , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.CASQUE;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                end;


                //si choix = 2 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 2 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete le torse , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.TORSE;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                end;


                //si choix = 3 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 3 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete les gants , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.GANTS;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                  end;



                //si choix = 4 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 4 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete les jambieres , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.JAMBIERES;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                end;


                //si choix = 5 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 5 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete les botttes , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.BOTTES;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                  end;


                //si choix = 6 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 6 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete la bombe , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.BOMBE;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                end;


                //si choix = 7 dans ecran acheter on va verifier si le joueur a assez de l'argent ou pas
                if choix = 7 then
                begin
                  //s'il a pas assez de l'argent on lui envoie un message pour dire qu'il n'a pas asse de l'argent
                  if NoArgent = TRUE  then writeln('Il vous manque de l''argent');
                  //sinon
                  else
                    begin
                      //le joueur achete le potion , son argent serait son argent moins argent de l'objet
                      personnage.argent:= personnage.argent - prix.POTION;
                      //le joueur va mettre dans l'inventaire
                      mettreDansInventaire();
                    end;
                end;


                //si choix = 8 dans ecran le joueur va retourner dans le marchand
                if choix = 8 then IHM_EcranMarchand;
          end;



             //ECRAN VENDRE
             //si choix =2
            if choix = 2 then
            begin
              //changer ecran , aller dans ecran vendre
              IHM_EcranMarchand := IHM_EcranVendre;
              choix := IHM_ListeDeChoix(10, 25, 2);


                //si choix = 1 dans ecran vendre
                if choix = 1 then
                begin
                      //le joueur vendre le casque , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.CASQUE;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 2 dans ecran vendre
                if choix = 2 then
                begin
                      //le joueur vendre le torse , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.TORSE;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 3 dans ecran vendre on va
                if choix = 3 then
                begin
                      //le joueur vendre les gants , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.GANTS;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 4 dans ecran vendre on va
                if choix = 4 then
                begin
                      //le joueur vendre les jambieres , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.JAMBIERES;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 5 dans ecran vendre on va
                if choix = 5 then
                begin
                      //le joueur vendre les bottes , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.BOTTES;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 6 dans ecran vendre on va
                if choix = 6 then
                begin
                      //le joueur vendre la bombe , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.BOMBE;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;


                //si choix = 7 dans ecran vendre on va
                if choix = 7 then
                begin
                      //le joueur vendre le potion , son argent serait son argent plus argent de l'objet
                      personnage.argent:= personnage.argent + prix.POTION;
                      //l'objet va etre retiré de l'inventaire
                      sortirDeInventaire();
                end;

                //si choix = 8 dans ecran le joueur va retourner dans le marchand
                if choix = 8 then IHM_EcranMarchand;
           end;


                //QUITTER LE MARCHAND
                //si choix = 3 dans ecran le joueur va retourner dans la ville
                if choix = 3 then IHM_EcranVille;
end;
end.

