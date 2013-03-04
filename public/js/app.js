$(document).ready(function(){
    $(".slider").slider();

    $("#checkin-form").submit(function(e){
        e.preventDefault();
       // sturggling to build assoc array to send data to Ruby World 
        // var data = {}; 
        // $('#checkin-form').find('a').each( function(i,e){
        //     data.i = $(e).attr('style');
        // }); 

        // alert(data)
        
        // $.post('/checkins/new', data).done(function(){
        //    console.log("And we're back");
        //  });
        
    });
});
    


