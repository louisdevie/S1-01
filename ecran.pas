unit Ecran;

interface

     function IHM_EcranAccueil: integer;

implementation
    uses AideIHM;

    function IHM_EcranAccueil: integer;
    begin
      couleur(1, 0);
      texteCentre('=== Monster Hunter : New world ===', 5); 
      couleur(0, 0);
      texteGauche('Nouvelle Partie', 10, 27);
      texteGauche('Quitter', 12, 27);
      couleur(2, 0);
      IHM_EcranAccueil := listeDeChoix(10, 25, 2);
    end;

end.

