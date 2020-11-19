
function changeClassGalery(size) {
	if (size > 0) {
		console.log('metodo chamado..')
		let col = $("#col-size");
		if (size == 1) {
			col.removeClass();
			col.toggleClass("col-sm-6 col-md-7");
		} else {

			let className = col.attr('class');
			if (className.includes('7')) {
				col.removeClass();
				$("#col-size").toggleClass("col-sm-6 col-md-4");
			}
		}
	}
}


$('#edit').on('click', function() {
	disableDisabled()
})

$('#etapa').on('change', function() {
	checkSelectValue();
})

function checkSelectValue() {
	if ($('#etapa').val() == 3) {
		disableDisabled();
	}
}

function disableDisabled() {
	$('#temas').prop("disabled", false);
	$('#etapa').prop("disabled", false);
	$('#qtd').prop("disabled", false);
	$('#text-area').prop("disabled", false);
}

$('#next').on('click', function() {
	next();
})

$('#preview').on('click', function() {
	preview();
})
function next() {
	const etapa = $('#etapa option:selected');
	let number = (Number(etapa.val()) + Number(1));
	if (number > 7) {
		number = Number(1);
	}
	$('#etapa').val(number)
	checkSelectValue();
}

function preview() {
	const etapa = $('#etapa option:selected');
	let number = (Number(etapa.val()) - Number(1));
	if (number < 1) {
		number = Number(7);
	}
	$('#etapa').val(number)
	checkSelectValue();
}
