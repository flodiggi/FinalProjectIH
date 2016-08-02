$(document).ready(function(){


var $myGroup = $('#collapsegroup');
$myGroup.on('show.bs.collapse','.collapse', function() {
    $myGroup.find('.collapse.in').collapse('hide');
});

});
