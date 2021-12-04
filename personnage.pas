unit Personnage;

interface

    //types
    type
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
    end;
    
    //InitialisationPersonnage le joueur va pouvoir creer son personnage
    procedure InitialisationPersonnage(personnage : typePersonnage);

implementation

    //InitialisationPersonnage le joueur va pouvoir creer son personnage
    procedure InitialisationPersonnage(personnage : typePersonnage);
    begin
        personnage.argent    := 0;
        personnage.vie       := 100;
        personnage.vieMax    := 100;
        personnage.attaque   := 10;
        personnage.armure    := 0;
        personnage.armureMax :=50;
        personnage.ressource.nom := 'Bois';
    end;

end.

