
$(document).ready( function() {
	var mycsv = '"name,age","Jun,33","Spencer,30","David,33"';
	var result = $.csv.toObjects(mycsv);
	console.log( result )
});
