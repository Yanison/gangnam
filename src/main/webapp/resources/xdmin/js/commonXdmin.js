divSearchControl = function() {
    var screenWidth = $(window).width();
    if (screenWidth < BOOTSTRAP5_SM_DIMENSIONS) {
        $('#divSearch').hide();
        $('#iSearchControlUp').hide();
        $('#iSearchControlDown').show();
    } else {
        // by pass
    }
}
 
 
$('#divSearchControl').on('click', function() {
    if ($('#divSearch').is(':visible')) {
         $('#divSearch').hide();
         $('#iSearchControlUp').hide();
         $('#iSearchControlDown').show();
    } else {
         $('#divSearch').show();
         $('#iSearchControlUp').show();
         $('#iSearchControlDown').hide();
    }
 });