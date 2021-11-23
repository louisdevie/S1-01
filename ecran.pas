unit Ecran;

interface

     function IHM_EcranAccueil: integer;

implementation
    uses AideIHM;

    function IHM_EcranAccueil: integer;
    var
        choix: Integer;
    begin
        couleur(1, 0);
        texteCentre('=== Monster Hunter : New world ===', 5);
        couleur(0, 0);
        texteGauche('Nouvelle Partie', 10, 27);
        texteGauche('Quitter', 12, 27);
        couleur(0, 0);
        texteCentre('Utilisez les touches fl'#232'ches pour s'#233'lectionner une option et [ENTER] pour valider', 29);
        couleur(2, 0);

        choix := -1;
        while choix = -1 do begin
            choix := listeDeChoix(10, 25, 2);
            if choix = 0 then
                choix := 1
            else begin
                choix := demanderOuiOuNon('Voulez-vous vraiment quitter ?');
                if choix = 1 then choix := 0;
            end;
        end;
    end;

end.

