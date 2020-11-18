
function setEtapa(etapa){
	var n = null;
	switch (etapa){
		case 'PEDIDO_REALIZADO':
			n = 1;
			break;
		case 'ESCOLHA':
			n = 2;
			break;
		case 'ALTERACAO':
			n = 3;
			break;
		case 'MODELO_ESCOLHIDO':
			n = 4;
			break;
		case 'PRODUCAO':
			n = 5;
			break;
		case 'PRONTO_ENTREGA':
			n = 6;
			break;
		case 'FINALIZADO':
			n = 7;
			break;
	}
	$('#etapa').val(n);
}
