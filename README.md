Projekt zaliczeniowy z systemu operacyjnego Linux. W projektcie wykorzystałem podstawowe instrukcje sterujące typu "if", pętle "for" i "while'.
Program zaczyna się od inicjalizaji zmiennych, które posłużą do przechowywania stanu aktualnej gry. Słowa które będą zgadywane pobierane są z pliku słowa.txt.
Plik ten powinien znajdować się w tym samym katalogu w celu poprawnośći działania programu.

Przebieg programu:
1. Probranie ścieżki pliku ze słowami. Odczytanie ilośći lini pliku za pomocą polecenia "wc".
2. Wylosowanie numeru linijki z użyciem polecniea "shuf" i zwrócenie tej linijki przez polecenie "sed". To nasze słowo do odgadnięcia.
3. Inicjalizacja zmiennych pomocniczych do przechowania stanu gry (w tym tez stworzenie tablicy "____" zamaskowanego słowa).
4. Deklaracje funkcji:
  a) główna funkcja find_and_replace, która pobiera litere sprawdza czy dana litera znajduję się w słowie. Jeżeli tak to podbija licznik znalezionych liter i pokazuje ją graczowi.
  b) sprawdza czy ilość odgadniętych liter jest równa ilości liter w słowie. Jeżeli tak to ustanawia gracza wygranym i wychodzi z głownej pętli.
  c) jeżeli pobrana litera nie pasuje, to podbija licznik błędnych odpowiedzi
5. Deklaracje funkcji banner i wrongX, które są elementami graficznymi programu.
6. Deklaracje funkcji game_win i game_over wyświetlających stosowne komunikaty na zakończenie gry.
7. Funkcja z główną pętlą programu:
  a) wyświetla banner i za pomocą instrukcji case wyświetla odpowiedni obrazek wisielca,
  b) wyświetla słowo w postaci "__X_X__" gdzie X to odgadnięte litery, a pod tym ilość pozostałych prób,
  c) sprawdza czy gracz ma jeszcze próby do wykorzystania jeżeli ma ich 0 to kończy grę,
  d) pobiera literę od użytkownika,
  c) wywołuje funkcję find_and_replace z pobraną od użytkownika literą.
8. Sprawdzenie statusu wygranej gracza i wywołanie odpowiedniej funkcji game_over lub game_win.
