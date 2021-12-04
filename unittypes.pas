unit unitTypes;

{$mode objfpc}{$H+}

interface
uses Inventaire;
/////////////////////////////DES TYPES/////////////////////////////
type

  //type bombe qui contient le nom et l'effet de la bombe
  typeBombe = RECORD
    nom    : string;
    degat  : Integer;
  end;
  //tableau contient 3 bombes
  tabBombe   = array[1..3] of typeBombe;

  //type equipement qui contient des equipements du joueur
  typeEquipement = RECORD
    casque    : Integer;
    torse     : Integer;
    gants     : Integer;
    jambieres : Integer;
    bottes    : Integer;
    bombe     : typeBombe;
   end;

  //type potion qui contient les caracteristiques des differents potions
  typePotion = RECORD
    vie    : Integer;
    degat  : Integer;
    armure : Integer;
  end;

  //typeInventaire qui contient les equipements et les potions
  typeInventaire  = RECORD
    equipement : typeEquipement;
    potion     : typePotion;
    // peut etre à ajouter type arme et type armure
  end;

  //typeArme qui contient
  typeArme = RECORD
    nom    : String;
    degats : Integer;
  end;
  //tableau contient 3 armes
  tabArme    = array[1..3] of typeArme;

  //typeArmure qui contient des informations de l'armure
  typeArmure = RECORD
    nom     : String;
    defense : Integer;
  end;
  //tableau contient 3 armures
  tabArmure   = array[1..3] of typeArmure;

  //typeMatiere cotient les informations des matières à récupèrer après avoir gagner le monstrer
   typeMatiere = RECORD
     nom     : string;
     compter : Integer;
     quantite: Integer;
  end;

  //typePersonnage contient des elements et les informations du personnage
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

  //typeMonstre contient des elements et les informations du monstre
  typeMonstre = RECORD
    nom    : string;
    vie    : Integer;
    attaque: Integer;
    armure : Integer;
    battu  : boolean;
    dropArgent  : Integer;
  end;

  //typeCantine qui contient les un repas qui donne un bonus
  typePlat = RECORD
    bonus : typePotion;
  end;

  //typeObjetMarchand contient des objets qu'on peut acheter au marché
  typeObjetMarchand = RECORD

  end;



implementation

end.

