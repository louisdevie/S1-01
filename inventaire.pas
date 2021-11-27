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

        // ...initialise l'inventaire
        procedure initialiserInventaire;

        // retourne l’objet d'une case d’inventaire
        function regarderDansInventaire(numCase: Integer): TypeObjets;

        // place un nouvel objet dans l’inventaire
        // Renvoie un booléen : VRAI si l’objet à bien été placé
        //                      FAUX si l’objet n’a pas pu être placé dans l’inventaire (plus de place par exemple)
        function mettreDansInventaire(objet: TypeObjets): Boolean;

        // récupère un objet depuis l’inventaire (enlève l’objet de l’inventaire et le revoie)
        function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;

implementation

    var inventaire: TypeInventaire;

    // ...initialise l'inventaire
    procedure initialiserInventaire;
    var i: Integer;
    begin
        for i := 0 to 9 do
            inventaire[i].famille := RIEN;
    end;

    // retourne l’objet d'une case d’inventaire
    function regarderDansInventaire(numCase: Integer): TypeObjets;
    begin
        regarderDansInventaire := inventaire[numCase];
    end;

    // place un nouvel objet dans l’inventaire
    function mettreDansInventaire(objet: TypeObjets): Boolean;
    begin
        mettreDansInventaire := false;
        // essayer de mettre les objets avec d'autres objets du même type
        for i := 0 to 9 do
            if (inventaire[i].famille = objet.famille)
            and (inventaire[i].idObjet = objet.idObjet) then begin
                inventaire[i].quantite += objet.quantite;
                mettreDansInventaire := true;
                break;
            end;
        // essayer de mettre les objets dans une case vide
        if not mettreDansInventaire then
            for i := 0 to 9 do
                if (inventaire[i].famille = RIEN) then begin
                    inventaire[i] := objet;
                    mettreDansInventaire := true;
                    break;
                end;
    end;

    // récupère un objet depuis l’inventaire
    function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;
    begin
        // À FAIRE
    end;

end.

