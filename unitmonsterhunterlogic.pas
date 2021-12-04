unit unitMonsterHunterLogic;

interface

uses AideIHM,Menus,IHM_Ecrans,unitTypes,Ecrans,Inventaire;

/////////////////DES FONCTIONS ET PROCEDURES//////////////////////////

///////CHAMBRE l'utilisatuer peut gerer son inventaire ou reposer son personnage///////
//quand le joueur va se reposer sa vie va remplir automatiquement
procedure laChambre();
//procedure initialisation des bombes
procedure InitialisationBombe(useBombe : typeBombe);
//Initialisation Potion
procedure InitialisationPotion(usePotion : typePotion);
//Initialisation Armure
function InitialisationArmure(armure : tabArmure) : tabArmure;
//Initialisation Arme
function InitialisationArme(arme : tabArme ):tabArme;
//Initialisation Cantine
procedure InitialisationCantine(plat : typePlat);
//procedure typePrix qui donne des prix aux objects
procedure InitialisationPrix(prix : TypeObjets);
//procedure typePrix qui donner des prix aux objects
procedure typePrix(prix : TypeObjets);
//procedure le joueur n'a pas assez d'argent
procedure NoArgent(prix : typeObjets);
//fonction vendre objet permettre au joueur de vendre ses objets innécessaires
function vendreObject(var argent,somme : Integer) : Integer;
//fonction confirmation achat permet de confirmer l'achat de l'utilisatuer
function achatObjet(prix : integer) : Boolean;
//la CHASSE permet de chasser les monstres en utilisant nos equipements, objects et recuprer des bonus si on gange
procedure chasse();
//la CANTINE permet d'achter des repas et les utiliser pour avoir des bonus
procedure cantine();
//le MARCHAND permet d'achter et vendre des objetcs
procedure leMarchand();
//la FORGE permet de frabriquer les armes et les armures en utilisant des ressources
procedure forge();

implementation



{
//function qui affiche la vie personnage
function IHM_ViePersonnage(): typePersonnage;
    begin
         dessinerCadreXY(0,4,110,30,simple,black,Lightgray);
         deplacerCurseurXY(28,2);writeln('VIE :',personnage.vie);
    end;

//fonction qui affiche l'argent du personange
function IHM_ArgentPersonnage: integer;
    begin
         dessinerCadreXY(0,4,110,30,simple,black,Lightgray);
         deplacerCurseurXY(28,4);writeln('ARGENT :',personnage.argent);
    end;
}

//InitialisationMonstre on cree un monstre
procedure InitialisationMonstre(var monstre : typeMonstre);
begin
  monstre.nom        :='TOTO';
  monstre.vie        := random(100)+50;
  monstre.attaque    := random(10)+5;
  monstre.armure     := random(5)+5;
  monstre.battu      := true;
  monstre.dropArgent := random(10)+10;
{ JE VOUSLAIS FAIRE PLUSIEURS MONSTRES MAIS ON N'A PAS BEAUCOUP TEMPS TU PEUX SUPPRIMER CETTE PARTIE EN COMMENTAIRE
  monstre[2].nom        :='BOB';
  monstre[2].vie        := random(100)+200;
  monstre[2].attaque    := random(10)+10;
  monstre[2].armure     := random(5)+15;
  monstre[2].battu      := true;  // A REVOIR
  monstre[2].dropArgent := random(10)+100;

  monstre[3].nom        :='ALICE';
  monstre[3].vie        := random(100)+900;
  monstre[3].attaque    := random(10)+20;
  monstre[3].armure     := random(5)+25;
  monstre[3].battu      := true;  // A REVOIR
  monstre[3].dropArgent := random(10)+1000;
}
end;

//Initialisation Arme
function InitialisationArme(arme : tabArme ):tabArme;
begin
  arme[1].nom   :='Epee en Bois';
  arme[1].degats:=10;

  arme[2].nom   :='Epee en Metal';
  arme[2].degats :=20;

  arme[3].nom   :='Epee en Diament';
  arme[3].degats :=30;
  InitialisationArme := arme;
end;



//Initialisation Armure
function InitialisationArmure(armure : tabArmure) : tabArmure;
begin
  armure[1].nom     :='Armure en Bois';
  armure[1].defense :=10;

  armure[2].nom     :='Armure en Metal';
  armure[2].defense :=20;

  armure[3].nom     :='Armure en Diament';
  armure[3].defense :=30;
  InitialisationArmure:=armure;

end;

//Initialisation Cantine
procedure InitialisationCantine(plat : typePlat);
var
    personnage : typePersonnage;
begin
  plat.bonus.vie    := personnage.vie     + 50;
  plat.bonus.degat  := personnage.attaque + 10;
  plat.bonus.armure := personnage.armure  + 10;
end;

//Initialisation Potion
procedure InitialisationPotion(usePotion : typePotion);
var
    personnage : typePersonnage;
begin
  usePotion.vie     := (personnage.vie + 20);
  usePotion.degat   := (personnage.attaque + 5 );
  usePotion.armure  := (personnage.armure  + 10);
end;

//procedure initialisation des bombes
procedure InitialisationBombe(useBombe : typeBombe);
var
    personnage : typePersonnage;
begin
  useBombe.degat   := (personnage.attaque + 20 );
end;

///////CHAMBRE l'utilisatuer peut gerer son inventaire ou reposer son personnage///////
//quand le joueur va se reposer sa vie va remplir automatiquement
procedure laChambre();
var
    personnage : typePersonnage;
    affiche : Integer;  //pour afficher ecran de la chambre + vie + argent du personnage
    choix   : integer;
    IHM_ViePersonnage    : Integer ;
    IHM_ArgentPersonnage : Integer ;


begin
  // AFFICHAGE DE VIE ET DE L'ARGENT DU PERSONNAGE à FAIRE SI C'EST POSSIBLE LOUIS
  //JE PENSE QU'IL FAUT UTILISER LA FONCTION : IntToStr POUR CONVERTIR LES LES INTEGER EN LETTRE ET LES AFFICHER
  //MAIS J'ARRIVE PAS: VOILA CES DEUX FONCTIONS IHM_ViePersonnage   IHM_ArgentPersonnage
  {
    IHM_ViePersonnage    := personnage.vie;       //ça affiche la vie du personange dans la chambre
    IHM_ArgentPersonnage := personnage.argent;    //ça affiche l'argrent du personange dans la chambre
    affiche := IHM_EcranChambre;
  }
   //Se Reposer
    IHM_EcranChambre;
    choix := IHM_ListeDeChoix(10, 25, 3);
          //Remplir la vie du personnage si le choix choisit par utilisateur est 1
          if choix = 1 then
          begin
               personnage.vie := personnage.vieMax;
          end;
          //Ouvrir et Gerer son inventaire si le choix choisit par utilisateur est 2
         { if choix = 2 then
                  IHM_EcranChambre :=0;//à faire LOUIS je sais pas quoi mettre ici pour ouvir inventaire
         }
          //Retourner en ville si le choix choisit par utilisateur est 3
          if choix = 3 then
                  //on appelle l'ecran ville pour que le joueur va en ville
                  IHM_EcranVille;

end;


//la FORGE permet de frabriquer les armes et les armures en utilisant des materiels du monstre
procedure forge();
begin

end;
{
//le MARCHAND permet d'achter et vendre des objetcs
procedure leMarchand();
var
  marchand : Integer;
begin
    marchand := IHM_EcranMarchand(personnage.argent);


end;
}

//la CANTINE permet d'achter des repas et les utiliser pour avoir des bonus
procedure cantine();
var
    choix : Integer;
begin
    //Appeller de afficher l'ecran  IHM_EcranCantine
    IHM_EcranCantine;
    choix := IHM_ListeDeChoix(10, 25, 3);
          //Prendre un repas si le choix choisit par utilisateur est 1
          if choix = 1 then
          begin
             //On appelle cette procedure pour ajouter du bonus au personnage (+vie,+degat,+armure)
             InitialisationCantine();
             writeln:('Les bonus de vie de degat d''amure sont bien ajouté à votre personnage');
             readln;
          end;
          //Retourner en Ville si le choix choisit par utilisateur est 2
          if choix = 2 then
             IHM_EcranVille();
end;



//la CHASSE permet de chasser les monstres en utilisant nos equipements, objects et recuprer des bonus si on gange
procedure chasse();
var

  personnage: typePersonnage;
  useBombe  : typeBombe;
  usePotion : typePotion;
  monstre   : typeMonstre;
  choix     : Integer;   //indice de boucle while
  i         : Integer;   //indice de pour le tableau tabMonstre
begin
  IHM_EcranCombattreMonstre();
  while (choix <> 1) and  (choix <> 2) and (choix <> 3) and (choix <> 4) and (choix <> 5) and (choix <> 6) do
  begin
    //IHM_ViePersonnage;
    //IHM à faire

    //si choix sur ecran IHM_EcranCombattreMonstre = 1 le joueur va attaquer le monstre
    if choix = 1 then
    begin
         monstre.vie       := (monstre.vie)    - (personnage.attaque) + (monstre.armure);   //enlever vie du monstre
         personnage.vie    := (personnage.vie) - (monstre.attaque)    + (personnage.armure);//enlever vie du personnge
         //et si la vie du personnage est = 0 il retourne à la chambre.
         //le combat est perdu
         //PEUT ETRE AJOUTER UNE FONCTION QUI AFFICHE PERDU CA SERAIT PLUS JOLIE
         if personnage.vie  = 0 then  IHM_EcranChambre;
         //et si la vie du monstre = 0 ce qui veut dire on a gagné le monstre relache de l'argent
         if monstre.vie     = 0 then personnage.argent:= monstre.dropArgent;
    end;

    if choix = 2 then //si choix sur ecran IHM_EcranCombattreMonstre = 2 le joueur veut lancer une bombe sur le monstre
    begin
         monstre.vie := (monstre.vie) - (personnage.attaque + (useBombe.degat)) + (monstre.armure);
    end;

    if choix = 3 then //si choix sur ecran IHM_EcranCombattreMonstre = 3 le joueur veut utiliser la potion pour augementer la vie
    begin
         personnage.vie := ((personnage.vie) + (usePotion.vie));
    end;

    if choix = 4 then //si choix sur ecran IHM_EcranCombattreMonstre = 4 le joueur veut utiliser la potion pour augementer de degat
    begin
         personnage.attaque := ((personnage.attaque) + (usePotion.degat));
    end;

    if choix = 5 then //si choix sur ecran IHM_EcranCombattreMonstre = 5 le joueur veut utiliser la potion pour augementer l'armure
    begin
         personnage.armure := ((personnage.armure) + (usePotion.armure));
    end;

    if choix = 6 then //si choix sur ecran IHM_EcranCombattreMonstre = 6 le joueur veut quitter le champ de combat
         IHM_EcranVille;
    end;
  end;


{
//procedure acheter objets   A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR A FINIR
procedure acheter(var achete:typePersonnage ; recoit:TypeInventaire);
var
    tantan : char;
    tan    : integer;
    choix  : Integer;
begin
  IHM_EcranAcheter();

  tan := choix7);  //à ajouter un ecran qui correspond à IHM_EcranAcheter();
  while tan <> 7 do


  begin
    //à creer IHM_Potion
    IHM_Potion(recoit.TypeObjets[tan]); // afficher la liste des potions
    tantan := choix();
    if tantan = 1 then
      begin
        if vendreBadItem(achete.argent, recoit.TypeObjets[tan].prixPotion) then
          begin
           if inventaireEstIlRempli(achete.TypeInventaire;) then
             begin
              vendreBadItem(achete.argent, recoit.TypeObjets[tan].prixPotion);
              mettreDansInventaire(recoit.TypeObjets[tan], achete.inventaire);
             end
           else writeln('Vous ne pouvez porter que 3 potions au maximum');
           end
        else
           manqueArgentIHM(achete.argent, recoit.TypeObjets[tan].prixPotion : Integer);
      end;

    else

      IHM_EcranAcheter();
      tan := choi7);
end;

}
{
//procedure enlever argent
procedure enleveArgent(var argent,coutOjetjet : integer);
bebin
   argent := argent - coutObjet;
end;
}

//procedure typePrix qui donne des prix aux objects
procedure InitialisationPrix(prix : TypeObjets);
begin
  prix.famille.BOMBE     := 200;
  prix.famille.CASQUE    := 100;
  prix.famille.TORSE     := 90;
  prix.famille.GANTS     := 80;
  prix.famille.JAMBIERES := 140;
  prix.famille.BOTTES    := 120;
  prix.famille.POTION    := 300;
end;


//fonction confirmation achat permet de confirmer l'achat de l'utilisatuer
function achatObjet(prix : integer) : Boolean;
var
    achat : Boolean;
    personnage : typePersonnage;
begin
  if personnage.argent >= prix then  // si l'argent est superieur que le prix de l'objet
    begin
      personnage.argent := personnage.argent - prix;
      achat := TRUE;
    end;
      if personnage.argent < prix then  //si l'argent est inferieur que le prix de l'objet
      NoArgent()                        //appel la procedure noArgent pour dire à l'utilisateur qu'il n'a pas assez d'argent
    else                                //si non
      achat      := FALSE;              //achat est faux
      achatObjet := achat;
end;

//procedure le joueur n'a pas assez d'argent
procedure NoArgent(prix : TypeObjets);
var
    personnage : typePersonnage;

begin
  //appller la fonction qui defini les prix du marché
  InitialisationPrix();
    //Si l'argent de joueur est inferieur à l'argent de tous ces objets
    if
        (personnage.argent < prix.famille.BOMBE)      AND
        (personnage.argent < prix.famille.CASQUE)     AND
        (personnage.argent < prix.famille.TORSE)      AND
        (personnage.argent < prix.famille.GANTS)      AND
        (personnage.argent < prix.famille.JAMBIERES)  AND
        (personnage.argent < prix.famille.BOTTES)     AND
        (personnage.argent < prix.famille.POTION)
    then
    //On lui dit qu'il manque de l'argent
     writeln('Il vous manque de l''argent');
end;

//fonction vendre objet permettre au joueur de vendre ses objets innécessaires
function vendreObject(var argent,somme : Integer) : Integer;
begin
  vendreObject := personnage.argent >= somme;
  //pas finit
end;



