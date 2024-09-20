document.addEventListener("DOMContentLoaded", function(event) {
    var pre = document.getElementById('hostname-pre');
    pre.innerHTML = file_get_contents('karlsen.fr.ascii');
});

function file_get_contents(filename) {
    fetch(filename).then((resp) => resp.text()).then(function(data) {
        return data;
    });
}
