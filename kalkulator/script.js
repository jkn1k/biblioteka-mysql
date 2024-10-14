document.getElementById('calculator').addEventListener('submit', function(event) {

    event.preventDefault();

    const liczba1 = parseFloat(document.getElementById('liczba1').value);
    const liczba2 = parseFloat(document.getElementById('liczba2').value);
    const operacja = document.getElementById('operacja').value;

    let wynik;

    switch (operacja) {
        case 'dodawanie':
            wynik = liczba1 + liczba2;
            break;
        case 'odejmowanie':
            wynik = liczba1 - liczba2;
            break;
        case 'mnozenie':
            wynik = liczba1 * liczba2;
            break;
        case 'dzielenie':
            if (liczba2 !== 0) {
                wynik = liczba1 / liczba2;
            } else {
                wynik = 'Nie można dzielić przez zero!';
            }
            default:
                wynik = "Nieprawidłowa operacja"
    }
    

    document.getElementById('wynik').innerText = `${wynik}`;
})
