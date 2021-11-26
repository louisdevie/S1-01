//code sur le fonctionnement du jeu
unit unitMonsterHunterLogic;    
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

// -----TYPES-----

type
  typePersonnage = record
             Nom:string;                    //nom du personnage
             Sexe:integer;                  //sexe du personnage
             Taille:integer;                //taile du personange
  end;
  
  typeMonstre = record
			 Nom:string;
			 

  typeInventaire = record                       //comptant des objets variés
             potions:integer:               //******
             bombes:integer;                //*****
  end;

  typeEquipement = record
             casque,
             torse,
             jambieres,
             bottes,
             gants,
             armure
             armes:integer;

  end;


//TABLEAUX
type
  tabMap          = array[1..49,1..49] of integer;          //map

  tabInventaire   = array[1..10,1..10] of integer;          //l'inventaire

  tabEquipement   = array[1..10,1..10] of integer;          //l'equipement

  tabChamre       = array[1..10,1..10] of integer;          //la chambre

  tabForge        = array[1..10,1..10] of integer;          //la forge

  tabCantine      = array[1..10,1..10] of integer;          //la cantine

  tabMarchand     = array[1..10,1..10] of integer;          //le marchand

  }

// -----FONCTIONS ET PROCEDURES-----

//renvoie nom jouer en cours
function getNomJoueurEnCours():integer;

//objects
function getObjet:;

//Le joueur a-t-il perdu ?
function aPerdu(numero : integer) : boolean;

//Le joueur a-t-il gagné ?
function aGagne(numero : integer) : boolean;






procedure


implementation

var
	personnage1:=typePersonnage;
	monstre1   :=typeMostre;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//Menu initial
procedure menuIni();
var choix : string;
begin
     choix := menuIHM();
     if (choix = '1') then partie()
     else quitter();
end;
	
//écran de création de personnage
procedure menuCreePersonnage();
var choix : string;
begin
     choix := menuIHM();
     if (choix = '1') then 
		writeln('saisir votre Nom'),Nom;
		readln(Nom);
		writeln('saisir votre Sexe'),Sexe;
		readln(Sexe);
		writeln('saisir votre Taille',Taille);
		readln(Taille);
		
     else quitter();
end;

//ajoute ressource
//marché si il choisi 1 il achete bombe si il choisi 2 il achete diament :=> or = or.principal-or;habille

//Quitter le jeu
procedure quitter();
begin
   quitterIHM();
end;
	
end.

