unit Ecrans;

interface

     function IHM_EcranAccueil: integer;

implementation
    uses AideIHM;

    function IHM_EcranAccueil: integer;
    var
        choix: Integer;
    begin
        choix := 0;
        while choix = 0 do begin
            IHM_Couleur(1, 0);
            IHM_Effacer;
            IHM_TexteCentre('=== Monster Hunter : New world ===', 5);
            IHM_Couleur(0, 0);
            IHM_TexteGauche('Nouvelle Partie', 10, 28);
            IHM_TexteGauche('Quitter', 12, 28);
            IHM_Couleur(2, 0);

            choix := IHM_ListeDeChoix(10, 25, 2);
            if choix = 1 then
                IHM_EcranAccueil := 1
            else begin
                choix := IHM_DemanderOuiOuNon('Voulez-vous vraiment quitter ?');
                if choix = 1 then IHM_EcranAccueil := 0;
            end;
        end;
    end;

end.

