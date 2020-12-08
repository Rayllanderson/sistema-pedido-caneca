$('.alert').hide();


Dropzone.autoDiscover = false;
var myDropzone = new Dropzone("#upload", { url: "file?action=upload" });
myDropzone.on("complete", function(file) {
	loadMiniature(file);
});

function loadMiniature(file) {
	$.ajax({
		url: 'file?action=load-miniature',
		type: 'GET',
		success: function() {
			$.get("file", function(response) {
				$("#start").html($(response).find("data").html());
			});
			setTimeout(function() {
				myDropzone.removeFile(file);
			}, 2000);
			console.log('Success')
		},
		error: function() {
			console.log('error')
		}
	});
}


