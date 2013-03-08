$(document).ready(function(){
    var priorities = {
        sleep:      0,
        nutrition:  0,
        exercise:   0,
        meditation: 0,
        love:       0,
        stuff:      0,
        work:       0, 
        passion:    0, 
        growth:     0,
        service:    0    
    }
    //attaches a jQuery UI slider to each div with .slider class 
    $(".slider").slider();
    //when slider changes, set appropriate attribute of prioritities obj to slider value 
    $(".slider").slider( {
        change: function( event, ui ) {
            var id = $(this).attr('id'); 
            priorities[id] = ui.value 
        }
    });
    $("#checkin-form").submit(function(e){
        e.preventDefault();
        $.post('/checkins', priorities).done(function(checkin_id){
           window.location = "http://localhost:9292/checkins/" + checkin_id 
         });
        
    });
});
    


