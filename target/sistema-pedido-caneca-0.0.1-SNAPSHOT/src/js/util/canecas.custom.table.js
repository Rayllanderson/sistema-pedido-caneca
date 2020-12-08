function customSort(sortName, sortOrder, data) {
	var order = sortOrder === 'desc' ? -1 : 1
	data.sort(function(a, b) {
		var aa = +((a._etapa_data.etapaid + '').replace(/[^\d]/g, ''))
		var bb = +((b._etapa_data.etapaid + '').replace(/[^\d]/g, ''))
		if (aa < bb) {
			return order * -1;
		}
		if (aa > bb) {
			return order
		}
		return 0
	})
}

var $table = $('#table')
var $button = $('#button')

// filtro personalizado
$(document).on("change", '#filter-etapa', function() {
	if ($('#filter-etapa').val() == '0') {
		$table.bootstrapTable('filterBy', {});
	} else {
		var value = $("#filter-etapa option:selected").text()
		console.log(value)
		$table.bootstrapTable('filterBy', {
			etapa: value
		})
	}
});


$('.fixed-table-toolbar').css('padding', '10px')
