                   
          /// WCIŚNIĘCIE KLAWISZA >> F5 << INICUJE WYKONANIE PROGRAMU ///


A= [4,10,8;1,4,2;4.12,10.77,8.25]   // zdefiniowana macierz wartosci wyjsciowych MOCY (1 wiersz moc czynna, 2 wiersz moc bierna, 3 wiersz moc pozorna)
T= [0.25,0.5,0.75]  // czas 15min, 30 min, 45min 
disp(A) // wyswietlenie macierzy z wartosciami wyjsciowymi
disp('^^^^^^^^^^^^^^^^^^^^^^^^')    // znaki specjalne - dla wiekszej czytelnosc w konsoli

W1 = [];    // utworzenie pustej macierzy W1 w ktorej beda przechowywane wartosci energii dla mocy czynnej (1 wiersz)
W2 = [];    // utworzenie pustej macierzy W2 w ktorej beda przechowywane wartosci energii dla mocy biernej (2 wiersz)
W3 = [];    // utworzenie pustej macierzy W3 w ktorej beda przechowywane wartosci energii dla mocy pozornej (3 wiersz)
WwartoscSrednia=[]  // utowrzenie pustej macierzy wartości średnich
Wmnozenie=[]    // utworzenie pustej macierzy ktora docelowo bedzie zawierac wszystkie obliczone energie (po czasie) dla kazdej z mocy
for i = 1:3 // zadeklarowanie petli FOR ktora wykona się dla 3 wierszy macierzy wyjsciowej
        
        j=1;    // zadeklarowanie 'licznika' zmiennej j do petli WHILE, zaczyna sie od 1 ponieważ pierwsza pozycja w macierzy to A(i,j) czyli A(1,1)
        while j < 4 // petla WHILE wykona sie 3 razy (j=1,j=2,j=3)
                        
            E1 = A(i,j)*T(j)    //zmienna E1 zapisuje wynik energii 
                       
            if i == 1 then  // warunek spradzajacy czy wartosc mocy znajduje sie w 1 wierszu macierzy - jezeli tak to wykonuje sie pięć poniższych instrukcji: 
                
                printf('\n Moc CZYNNA o wartości >> %g kW <<',A(i,j))   // wyswietlenie informajci, ze jest to moc CZYNNA - oraz jej wartosc 
                printf('\n Wartosc energii po czasie %g h: %g kW * %g h = %g kWh ',T(j), A(i,j),T(j),E1)    // wyswietlnie informacji o wykonanym dzialaniu ( moc * czas) i wyniku tego dzialania (przechowanego w zmiennej E1)
                disp('---------------------------------------------------------')   // dla zwiekszenia czytelnosc w konsoli - znaki oddzielajace 
                
                W1(1,j) = E1    //do wczesniej utworzonej pustej macierzy W1 - wstawiamy wartosc aktualnego mnozenia 
                             
                j = j + 1;  // zwiekszenie licznika j o jeden - aby móc przejść do drugiej kolumny (a w nastepnym kroku do trzeciej) w macierzy A (w tym momencie program przechodzi tylko przez pierwszy wiersz macierzy A - czyli moc CZYNNA)
                                
            elseif i == 2 then  // warunek spradzajacy czy wartosc mocy znajduje sie w 2 wierszu macierzy - jezeli tak to wykonuje sie pięć poniższych instrukcji:
                
                printf('\n Moc BIERNA o wartości >> %g kvar <<',A(i,j)) // analogicznie jak dla warunku powyżej
                printf('\n Wartosc energii po czasie %g h: %g kvar * %g h = %g kvarh ',T(j), A(i,j),T(j),E1)    // analogicznie jak dla warunku powyżej
                disp('---------------------------------------------------------')   // dla zwiekszenia czytelnosc w konsoli - znaki oddzielajace 
                
                W2(1,j) = E1    //do wczesniej utworzonej pustej macierzy W2 - wstawiamy wartosc aktualnego mnozenia                 
                
                j = j + 1;  // zwiekszenie licznika j o jeden - aby móc przejść do drugiej kolumny w macierzy A (w tym momencie program przechodzi tylko przez drugi wiersz macierzy A - czyli moc BIERNA)
                                
            else    // warunek spradzajacy czy wartosc mocy znajduje sie w 3 wierszu macierzy - jezeli tak to wykonuje sie pięć poniższych instrukcji:
                
                printf('\n Moc POZORNA o wartości >> %g kVa <<',A(i,j))     // jw.
                printf('\n Wartosc energii po czasie %g h: %g kVA * %g h = %g kVAh ',T(j), A(i,j),T(j),E1)  //jw.
                disp('---------------------------------------------------------')   // jw.
                
                W3(1,j) = E1    // jw.
                
                j = j + 1;  //jw.

            end // zamkniecie petli IF( elseif, else)
        end // zamkniecie petli WHILE
end // zamkniecie petli FOR 
sredniaEnergiaCzynna = mean(W1)     // zmienna ta zawiera wartosc srednia z macierzy W1 - czyli od mocy czynnej
sredniaEnergiaBierna = mean(W2)     // -||- z macierzy W2 - czyli od mocy biernej
sredniaEnergiaPozorna = mean(W3)    // -||- z macierzy W3 - czyli od mocy pozornej

WwartoscSrednia(1,1)= sredniaEnergiaCzynna  //
WwartoscSrednia(1,2)= sredniaEnergiaBierna  //// wstawienie do uprzednio stworzonej (pustej) macierzy - wartosci srednich energii 
WwartoscSrednia(1,3)= sredniaEnergiaPozorna //

Wmnozenie=[W1;W2;W3] // połączenie macierzy przedstawiających wartość energi po czasie (łączenie wierszami)

// Ponizej wyswietlenie informacji tekstowych o wartosciach srednich energii
disp('-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-')
printf('\n\t\t\tWARTOŚCI ŚREDNIE ENERGII')
disp('-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-')

printf('\nMacierz wynikowa energii dla mocy CZYNNEJ ')
disp(W1)
printf('\n\t Srednia wartosc energii obliczona dla mocy CZYNNEJ = %g kWh', sredniaEnergiaCzynna)
disp('')

printf('\nMacierz wynikowa energii dla mocy BIERNEJ ')
disp(W2)
printf('\n\t Srednia wartosc energii obliczona dla mocy BIERNEJ = %g kvarh', sredniaEnergiaBierna)
disp('')

printf('\nMacierz wynikowa energii dla mocy POZORNEJ ')
disp(W3)
printf('\n\t Srednia wartosc energii obliczona dla mocy POZORNEJ = %g kVAh', sredniaEnergiaPozorna)

disp('-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-')
// Poniżej zapisywanie macierzy do plików csv
filenameA = 'macierz_wyjsciowa.csv';    // ta zmienna przechowuje 'nazwe pliku' który zawiera macierz wyjsciowa
csvWrite(A, filenameA,';');     // zapisanie pliku na dysku w domyslnej lokalizacji 
printf('\n\n Zapisano plik : %s', filenameA)    // wyswietlenie informacji o zapisanym pliku

filenameB = 'macierz_wartosci_srednich_czynna_bierna_pozorna.csv';  // ta zmienna przechowuje 'nazwe pliku' który zawiera macierz wartosci srednich energii
csvWrite(WwartoscSrednia, filenameB,';');   // zapisanie pliku na dysku w domyslnej lokalizacji  
printf('\n\n Zapisano plik : %s', filenameB)    // wyswietlenie informacji o zapisanym pliku

filenameC = 'macierz_wartosci_energii_po_czasie_czynna_bierna_pozorna.csv';     // ta zmienna przechowuje 'nazwe pliku' który zawiera macierz wartosci energii po czasie
csvWrite(Wmnozenie, filenameC,';'); // zapisanie pliku na dysku w domyslnej lokalizacji 
printf('\n\n Zapisano plik : %s', filenameC)    // wyswietlenie informacji o zapisanym pliku





