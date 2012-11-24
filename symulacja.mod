param N; # liczba produktow
param majatekTrwaly;
param maksymalnyKredyt;
param gotowka;
param zadluzenie;
param amortyzacja;
param kosztyStale {1..N};
param oprocentowanieKonta;
param oprocentowanieKredytu;
param stawkaPodatku;
param cenaOdsprzedawanych;
param zdolnoscProdukcyjna {1..N};
param liczbaEtapow;
param liczbaZespolow;
param czasRundy;
param kredyt;
param wspolczynnikReklamy;

var jakosc {1..N};
var cenaSprzedazy {1..N};
var kosztyZmienne {1..N};

var wielkoscProdukcji {1..N};
var promocjaInternet {1..N};
var promocjaMagazyny {1..N};
var promocjaTelewizja {1..N};

var kosztyReklamy;
var wolnaGotowka;
var splacanaRata;
var zysk;


subject to kosztyReklamyC: kosztyReklamy = sum {i in 1..N} promocjaInternet[i] + promocjaMagazyny[i] + promocjaTelewizja[i];
subject to kosztyZmienneC: kosztyZmienne = sum {i in 1..N} wielkoscProdukcji[i] * cenaSprzedazy[i];
subject to wolnaGotowkaC: wolnaGotowka = gotowka + kredyt - splacanaRata - amortyzacja - kosztyReklamy - kosztyStale[1] - kosztyStale[2] - kosztyZmienne;

subject to bankructwo: wolnaGotowka >= 0;

subject to zyskC: zysk[i] = wielkoscProdukcji[i] * cenaSprzedazy[i];
subject to reklamaDoProdukcjiZwyklyC: kosztyReklamy <= wspolczynnikReklamy * (wolumen * wielkoscProdukcji)

data;

# do modelu podajemy: jakosc, ceneSprzedazy, aktualny stan konta
# uwzględnić prognozy rynku przy ograniczeniach na wielkoscProdukcji
# wielkosc produkcji nie może przekraczać zdolności produkcyjnej fabryk
# metoda punktu odniesienia marketing vs wielkosc produkcji
# minimalizujemy 
