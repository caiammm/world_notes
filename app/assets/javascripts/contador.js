
function limitaTextarea(valor) {
	quantidade = 5000;
	total = valor.length;

	if(total <= quantidade) {
		resto = quantidade- total;
		document.getElementById('contador').innerHTML = resto;
	} else {
		document.getElementById('texto').value = valor.substr(0, quantidade);
	}
}
