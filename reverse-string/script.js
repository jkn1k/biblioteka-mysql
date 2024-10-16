document.getElementById('reverse-string').addEventListener('submit', function(event) {

    event.preventDefault();

    const string = document.getElementById('string').value;

    function reverseString(str) {
        return str.split('').reverse().join('');
    }

    const reversedString = reverseString(string);

    document.getElementById('wynik').innerText = reversedString;
})
