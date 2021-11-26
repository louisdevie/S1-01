unit Inventaire;

interface

    type
        FamilleObjets = (
            RIEN,
            POTION, BOMBE,
            CASQUE, TORSE, GANTS, JAMBIERES, BOTTES);

        // Enregistrement qui représente un ou plusieurs objets identiques
        TypeObjets = record
            famille: FamilleObjets;
            idObjet,
            quantite: Integer;
        end;

        TypeInventaire = array [0..9] of TypeObjets;

        // Enregistrement contenant les différents équipements (représentés par des entiers) du joueur.
        TypeEquipement = record
            casque,
            torse,
            gants,
            jambieres,
            bottes: Integer;
        end;

        TypeCoffre = array [0..29] of TypeObjets;

        // retourne l’objet d'une case d’inventaire
        function regarderDansInventaire(numCase: Integer): TypeObjets;

        // place un nouvel objet dans l’inventaire
        // Renvoie un booléen : VRAI si l’objet à bien été placé
        //                      FAUX si l’objet n’a pas pu être placé dans l’inventaire (plus de place par exemple)
        function mettreDansInventaire(objet: TypeObjets): Boolean;

        // récupère un objet depuis l’inventaire (enlève l’objet de l’inventaire et le revoie)
        function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;

implementation

    // retourne l’objet d'une case d’inventaire
    function regarderDansInventaire(numCase: Integer): TypeObjets;
    begin

    end;

    // place un nouvel objet dans l’inventaire
    function mettreDansInventaire(objet: TypeObjets): Boolean;
    begin

    end;

    // récupère un objet depuis l’inventaire
    function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;
    begin

    end;

end.

