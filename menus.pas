{
 ... les menus
}
unit Menus;

interface

    // affiche un dialogue qui demande à l'utilisateur de confirmer qu’il veut bien quitter
    function IHM_MenuQuitter: Boolean;

implementation
    uses AideIHM;
               
    function IHM_MenuQuitter: Boolean;
    begin
      if IHM_DemanderOuiOuNon('Voulez-vous vraiment quitter ?') = 1 then
          IHM_MenuQuitter := true
      else
          IHM_MenuQuitter := false;
    end;

end.

