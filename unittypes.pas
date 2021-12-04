unit unitTypes;

{$mode objfpc}{$H+}

interface
uses Inventaire;
/////////////////////////////DES TYPES/////////////////////////////
type
  //type Prix Object qui donne les prix aux objects
  typePrixObjet = RECORD
     CASQUE    : Integer ;
     TORSE     : Integer;
     GANTS     : Integer;
     JAMBIERES : Integer;
     BOTTES    : Integer;
     POTION    : Integer;
     BOMBE     : Integer ;
  end;

  //type Bombe qui contient le nom et l'effet de la bombe
  typeBombe = RECORD
    nom    : string;
    degat  : Integer;
  end;
  //tableau contient 3 bombes
  tabBombe   = array[1..3] of typeBombe;

  //type Equipement qui contient des equipements du joueur
  typeEquipement = RECORD
    casque    : Integer;
    torse     : Integer;
    gants     : Integer;
    jambieres : Integer;
    bottes    : Integer;
    bombe     : typeBombe;
   end;

  //type Potion qui contient les caracteristiques des differents potions
  typePotion = RECORD
    potionVie    : Integer;
    potionDegat  : Integer;
    potionArmure : Integer;
  end;

  //type Inventaire qui contient les equipements et les potions
  typeInventaire  = RECORD
    equipement : typeEquipement;
    potion     : typePotion;
    // peut etre à ajouter type arme et type armure
  end;

  //type Arme qui contient
  typeArme = RECORD
    nom    : String;
    degats : Integer;
  end;
  //tableau contient 3 armes
  //de base j'ai pensé à faire plusieurs armes mais je ne suis pas très bon en code du coup j'ai decidé de faire une seule arme
  tabArme    = array[1..3] of typeArme;

  //type Armure qui contient des informations de l'armure
  typeArmure = RECORD
    nom     : String;
    defense : Integer;
  end;
  //tableau contient 3 armures
  //de base j'ai pensé à faire plusieurs armures mais je ne suis pas très bon en code du coup j'ai decidé de faire une seule armure
  tabArmure   = array[1..3] of typeArmure;

  //type Matiere cotient les informations des matières à récupèrer après avoir gagner le monstrer
   typeMatiere = RECORD
     nom     : string;
     compter : Integer;
     quantite: Integer;
  end;

  //type Personnage contient des elements et les informations du personnage
  typePersonnage = record
    Nom    :string;
    Sexe   :string;
    Taille :Integer;
    argent :Integer;
    vie    :Integer;
    vieMax :Integer;
    attaque:Integer;
    armure :Integer;
    armureMax  : Integer;
    ressource  : typeMatiere;
    equipement : TypeEquipement;
    inventaire : TypeInventaire;

  end;

  //type Ressource qui contient la ressource tombé apres avoir tué le monstre
  typeRessource = RECORD
    nom      : string;
    quantite : Integer ;
  end;

  //type Monstre contient des elements et les informations du monstre
  typeMonstre = RECORD
    nom    : string;
    vie    : Integer;
    attaque: Integer;
    armure : Integer;
    battu  : boolean;
    dropArgent  : Integer;
    dropRessoucre : typeRessource;
  end;



  //type Bonus qui donne des bonus au pesonnage
  typeBonus = RECORD
    bonusVie    : Integer;
    bonusDegat  : Integer;
    bonusArmure : Integer;
  end;

  //typePlat qui contient  un repas qui donne des bonus
  typePlat = RECORD
    bonus : typeBonus;
  end;

  //typeObjetMarchand contient des objets qu'on peut acheter au marché
  typeObjetMarchand = RECORD

  end;



implementation

end.

