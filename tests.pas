unit Tests;

interface

    procedure tester;

implementation

    uses TestUnitaire, Inventaire;

    procedure testerInventaire;
    var
      fail: Boolean;
      i: Integer;
    begin
        newTestsSeries('inventaire');

        newTest('inventaire', 'initialisation');
        initialiserInventaire;
        fail := false;
        for i := 0 to 9 do
            if regarderDansInventaire(i).famille <> RIEN then
                fail := true;
        testIsTrue(not fail);
    end;

    procedure tester;
    begin
        testerInventaire;

        summary;
        readln;
    end;

end.

