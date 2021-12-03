program S1_01;

uses Ecrans, AideIHM, Menus, Inventaire;

const NAVIGATION: array [1..8, 0..5] of Integer = (
    (0, 2, 0, 0, 0, 0),
    (1, 3, 0, 0, 0, 0),
    (0, 4, 5, 6, 7, 8),
    (0, 3, 0, 0, 0, 0),
    (0, 3, 0, 0, 0, 0),
    (0, 3, 0, 0, 0, 0),
    (0, 3, 0, 0, 0, 0),
    (0, 3, 0, 0, 0, 0)  );

var
    ecran, ecranSuivant: Integer;
begin
    IHM_Initialiser;

    ecran := 4;

    while ecran > 0 do begin
        case ecran of
            1: ecranSuivant := IHM_EcranAccueil;
            2: ecranSuivant := IHM_Personnage;
            3: ecranSuivant := IHM_EcranVille;   
            4: ecranSuivant := IHM_EcranChambre;
            5: ecranSuivant := IHM_EcranForge;
            6: ecranSuivant := IHM_EcranMarchand;
            7: ecranSuivant := IHM_EcranCantine;
            8: ecranSuivant := IHM_EcranCombattreMonstre;
        end;
        ecran := NAVIGATION[ecran][ecranSuivant];
    end;
end.

