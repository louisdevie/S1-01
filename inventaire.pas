{
    Gestion de l'inventaire, des équipements et du coffre de la chambre
}
unit Inventaire;

interface

    type
        FamilleObjets = (
            RIEN,
            POTION, BOMBE,
            ARME, CASQUE, TORSE, GANTS, JAMBIERES, BOTTES,
            PARTIEMONSTRE);

        // Enregistrement qui représente un ou plusieurs objets identiques
        TypeObjets = record
            famille: FamilleObjets;
            idObjet,
            quantite: Integer;
        end;

    // initialise l'inventaire
    procedure initialiserInventaire;

    // retourne l’objet d'une case d’inventaire
    function regarderDansInventaire(numCase: Integer): TypeObjets;

    // place un nouvel objet dans l’inventaire
    // Renvoie un booléen :
    // - VRAI si l’objet à bien été placé
    // - FAUX si l’objet n’a pas pu être placé dans l’inventaire (plus de
    //   ... place par exemple)
    function mettreDansInventaire(objet: TypeObjets): Boolean;

    // récupère un objet depuis l’inventaire (enlève l’objet de l’inventaire
    // ... et le revoie)
    // si quantite vaut -1 ou dépasse le nomber d'objets dans la case,
    // ... tous les objets de la case sont récupérés
    function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;

    {
    procedure initialiserEquipement;
    
    function equipement(partie: FamilleObjets): Integer;
    
    procedure equiper(partie: FamilleObjets; idEquipement : Integer);
    
    procedure initialiserCoffre;
    
    function transférerDansCoffre(numCaseInventaire: Integer): Boolean;
    
    function transférerDepuisCoffre(numCaseCoffre: Integer): Boolean;
    }

implementation

    var
        _inventaire: array [0..8] of TypeObjets;

        {
        _armeEquipee,
        _casqueEquipe,
        _torseEquipe,
        _gantsEquipes,
        _jambieresEquipees,
        _bottesEquipees : Integer;
        
        _coffre : array [0..29] of TypeObjets;
        }

    // ...initialise l'inventaire
    procedure initialiserInventaire;
    var i: Integer;
    begin
        for i := 0 to 8 do
            _inventaire[i].famille := RIEN;
    end;

    // retourne l’objet d'une case d’inventaire
    function regarderDansInventaire(numCase: Integer): TypeObjets;
    begin
        regarderDansInventaire := _inventaire[numCase];
    end;

    // place un nouvel objet dans l’inventaire
    function mettreDansInventaire(objet: TypeObjets): Boolean;
    var i: Integer;
    begin
        mettreDansInventaire := false;
        // essayer de mettre les objets avec d'autres objets du même type
        for i := 0 to 8 do
            if (_inventaire[i].famille = objet.famille)
            and (_inventaire[i].idObjet = objet.idObjet) then begin
                _inventaire[i].quantite += objet.quantite;
                mettreDansInventaire := true;
                break;
            end;
        // essayer de mettre les objets dans une case vide
        if not mettreDansInventaire then
            for i := 0 to 8 do
                if (_inventaire[i].famille = RIEN) then begin
                    _inventaire[i] := objet;
                    mettreDansInventaire := true;
                    break;
                end;
    end;

    // récupère un objet depuis l’inventaire
    function sortirDeInventaire(numCase, quantite: Integer): TypeObjets;
    begin
        // retirer tous les objets d'une case
        if (quantite = -1) or (quantite >= _inventaire[numCase].quantite) then begin
            sortirDeInventaire            := _inventaire[numCase];
            _inventaire[numCase].famille  := RIEN;
            _inventaire[numCase].idObjet  := 0;
            _inventaire[numCase].quantite := 0; 
        // en retirer une partie
        end else begin
            sortirDeInventaire.famille    := _inventaire[numCase].famille;
            sortirDeInventaire.idObjet    := _inventaire[numCase].idObjet;
            sortirDeInventaire.quantite   := quantite;
            _inventaire[numCase].quantite -= quantite;
        end;
    end;

end.

