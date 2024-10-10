document.getElementById('calculator').addEventListener('submit', function(event) {

    event.preventDefault();

    let liczba1 = parseFloat(document.getElementById('liczba1').value);
    let liczba2 = parseFloat(document.getElementById('liczba2').value);
    let operacja = document.getElementById('operacja').value;

    let wynik;

    if (operacja === 'dodawanie') {
        wynik = liczba1 + liczba2;
    } else if (operacja === 'odejmowanie') {
        wynik = liczba1 - liczba2;
    } else if (operacja === 'mnozenie') {
        wynik = liczba1 * liczba2;
    } else if (operacja === 'dzielenie') {
        wynik = liczba1 / liczba2;
    }

    document.getElementById('wynik').textContent = `Wynik: ${wynik}`;
})