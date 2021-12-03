unit TestUnitaire;

{$mode objfpc}{$H+}
{$codepage utf8}

interface
uses
  Classes, SysUtils,fgl;

//Crée une nouvelle série de test
procedure newTestsSeries(name : String);
//Crée un nouveau test dans la série de tests
procedure newTest(nameOfSerie : String; nameOfTest : String);

//Test d'égalité entre deux entiers
procedure testIsEqual(value,expectedValue : integer);
//Test d'égalité entre deux réels
procedure testIsEqual(value,expectedValue : real);
//Test d'égalité entre deux chaines de caractères
procedure testIsEqual(value,expectedValue : String);
//Test d'un booléen
procedure testIsTrue(value : boolean);

//Affiche un résumé de tous les tests effectués
procedure Summary();




implementation
uses GestionEcran;
type
  ECustomException = Class(Exception);                       //Exception personnalisée
  Test = record                                              //Un test
       name : String;                                        //Nom du test
       message : String;                                     //Message à afficher
       isValidate : boolean;                                 //Le test passe-t-il ?
       isDefine : boolean;                                   //Le test a-t-il été défini ?
  end;

  TestSeries = specialize TFPGMap<String,Test>;              //Map de tests indexés par nom
  TestSeriesDict = specialize  TFPGMap<String,TestSeries>;   //Map de série de tests indexés par nom

const
     SUCCESMESSAGE = 'Le test unitaire passe';

var
     Dict: TestSeriesDict;             //Liste des séries de test
     currentSerieName : String;        //Nom de la série de test en cours
     currentTestName : String;         //Nom du test en cours
     hasCurrentTest : boolean = false; //Y a-t-il un test en cours

//---------------------------- OUTILS ------------------------------------------
//Affiche le message de démarrage d'un test
procedure Start(name : String);
begin
  couleurFond(Black);
  couleurTexte(White);
  Writeln('----- Exécution du test : '+name+' ----- ');
end;

//Affichage d'un message d'erreur
procedure Error(message : String);
begin
     couleurFond(Black);
     couleurTexte(LightRed);
     Write('----- ERROR ----- ');
     Writeln(message);
     readln;
     halt(1);
end;

//Initialisation
procedure init();
begin
     //Crée la map des séries de tests si elle n'existe pas déjà
     if (not Assigned(Dict)) then Dict :=  TestSeriesDict.Create;
end;

//Test si un il y a un test en cours et si celui-ci n'a pas déjà été fait
function isTestValide() : boolean;
begin
     isTestValide := True;
     if(not hasCurrentTest) then
     begin
          isTestValide := False;
          ERROR('Aucun test en cours !');
     end;
     if(Dict.KeyData[currentSerieName].KeyData[currentTestName].isDefine) then
     begin
          isTestValide := False;
          ERROR('Le test '+Dict.KeyData[currentSerieName].KeyData[currentTestName].name+' a déjà été défini !');
     end;
end;

//----------------------- GESTION DES TESTS ------------------------------------


//Crée un nouveau test non initialisé
function createTest(name : String) : Test;
begin
   createTest.name := name;
   createTest.message:='';
   createTest.isValidate:= false;
   createTest.isDefine:= false;
   hasCurrentTest:=True;
end;

//Crée une nouvelle série de test
procedure newTestsSeries(name : String);
var
    serie : TestSeries;
begin
  init();

  //Test si la série de test existe déjà
  if Dict.TryGetData(name,serie) then Error('Une série de test porte déjà le nom : '+name)
  //Crée la série de test
  else Dict.add(name,TestSeries.Create);
end;

//Crée un nouveau test dans la série de tests
procedure newTest(nameOfSerie : String; nameOfTest : String);
var
    serie : TestSeries;
    currentTest : Test;
begin
  init();

  //Test si la série de test existe
  if Dict.TryGetData(nameOfSerie,serie) then
  begin
       if serie.TryGetData(nameOfTest,currentTest) then Error('Un test porte déjà le nom : '+nameOfTest+' dans la série : '+nameOfSerie)
       else if  nameOfTest = '' then  Error('Impossible de créer un test avec un nom vide !')
       else
         begin
              currentSerieName :=nameOfSerie;
              currentTestName :=nameOfTest;
              serie.add(nameOfTest,createTest(nameOfTest));
              Start(nameOfSerie+' - '+nameOfTest);
         end;
  end
  //Si la série n'existe pas
  else
     Error('La série de test : '+nameOfSerie+' n''existe pas');
end;


//---------------------------- TESTS -------------------------------------------

//Test d'égalité entre deux entiers
procedure testIsEqual(value,expectedValue : integer);
var
    currentTest : Test;
begin
     if(isTestValide()) then
     begin
       currentTest := Dict.KeyData[currentSerieName].KeyData[currentTestName];
       currentTest.isDefine:=True;
       if(value=expectedValue) then
       begin
            currentTest.isValidate:=True;
            currentTest.message:=SUCCESMESSAGE;
       end
       else
       begin
            currentTest.isValidate:=False;
            currentTest.message:='Le test ne passe pas. Valeur attendue : '+IntToStr(expectedValue)+'   Valeur obtenue : '+IntToStr(value);
       end;
       Dict.KeyData[currentSerieName].Add(currentTestName,currentTest);
     end;
end;

//Test d'égalité entre deux réels
procedure testIsEqual(value,expectedValue : real);
var
    currentTest : Test;
begin
     if(isTestValide()) then
     begin
       currentTest := Dict.KeyData[currentSerieName].KeyData[currentTestName];
       currentTest.isDefine:=True;
       if(value=expectedValue) then
       begin
            currentTest.isValidate:=True;
            currentTest.message:=SUCCESMESSAGE;
       end
       else
       begin
            currentTest.isValidate:=False;
            currentTest.message:='Le test ne passe pas. Valeur attendue : '+FloatToStr(expectedValue)+'   Valeur obtenue : '+FloatToStr(value);
       end;
       Dict.KeyData[currentSerieName].Add(currentTestName,currentTest);
     end;
end;

//Test d'un booléen
procedure testIsTrue(value : boolean);
var
    currentTest : Test;
begin
     if(isTestValide()) then
     begin
       currentTest := Dict.KeyData[currentSerieName].KeyData[currentTestName];
       currentTest.isDefine:=True;
       if(value) then
       begin
            currentTest.isValidate:=True;
            currentTest.message:=SUCCESMESSAGE;
       end
       else
       begin
            currentTest.isValidate:=False;
            currentTest.message:='Le test ne passe pas';
       end;
       Dict.KeyData[currentSerieName].Add(currentTestName,currentTest);
     end;
end;

//Test d'égalité entre deux chaines de caractères
procedure testIsEqual(value,expectedValue : String);
var
    currentTest : Test;
begin
     if(isTestValide()) then
     begin
       currentTest := Dict.KeyData[currentSerieName].KeyData[currentTestName];
       currentTest.isDefine:=True;
       if(value=expectedValue) then
       begin
            currentTest.isValidate:=True;
            currentTest.message:=SUCCESMESSAGE;
       end
       else
       begin
            currentTest.isValidate:=False;
            currentTest.message:='Le test ne passe pas. Valeur attendue : '+expectedValue+'   Valeur obtenue : '+value;
       end;
       Dict.KeyData[currentSerieName].Add(currentTestName,currentTest);
     end;
end;



//Affiche un résumé de tous les tests effectués
procedure Summary();
var
    i,j:integer;
    nbPassed,nbFailed : integer;
begin
      couleurFond(Black);
      couleurTexte(White);
      writeln;
      Writeln('----- Résumé des tests -----');
      if Assigned(Dict) then
      begin
        for i:=0 to Dict.Count-1 do
           begin
           nbPassed:=0;
           nbFailed:=0;

           for j:=0 to Dict.Data[i].Count-1 do
              begin
                   if Dict.Data[i].Data[j].isDefine then
                   begin
                        if Dict.Data[i].Data[j].isValidate then nbPassed := nbPassed+1
                        else nbFailed:=nbFailed+1;
                   end;
              end;

           if(nbFailed=0) then couleurTexte(Green)
           else couleurTexte(LightRed);
           Writeln();
           Writeln(' --> Série de tests : '+Dict.Keys[i]+'   ('+IntToStr(nbPassed)+' test(s) validé(s) / '+IntToStr(nbFailed)+' test(s) échoués)');

           for j:=0 to Dict.Data[i].Count-1 do
              begin
                   if Dict.Data[i].Data[j].isDefine then
                   begin
                        if Dict.Data[i].Data[j].isValidate then couleurTexte(Green)
                        else couleurTexte(LightRed);
                        Writeln('     --> Test '+Dict.Data[i].Data[j].name+' : '+Dict.Data[i].Data[j].message);
                   end;
              end;
           end;
      end;
end;
end.


