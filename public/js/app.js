$(document).ready(function(){
    var MySliders = {
        sleep: 0,
        meditation: 0,
        // ... etc
    }

    // MySliders.sleep = 1; == MySliders["sleep"] = 1;

    $(".slider").slider();
    $(".slider").slider({
        change: function( event, ui ) {
            // gets called when a slider is changed
            // $(this) is the slider -- how do I get its id?   
            id = $(this).attr('html'); 
            MySliders[id] = ui.value,
            // get rid of inputs 
            // console.log(ui.value);
            // console.log($(ui).next());
            // $(this).next().attr('value', ui.value);
            console.log(MySliders);
        }
    });

    $("#checkin-form").submit(function(e){
        e.preventDefault();

        // var params = {};
        // var values = [];
        // // this loop shouldnt be necesarry 
        // $(".slider").each(function(i,e){
        //     values.push($(e).slider("value"));
        // });
        // params['values'] = values;
        // // { "values" => [1,2,3,4, ...] }
        $.post('/checkins/new', MySliders).done(function(){
           console.log("And we're back");
         });
        
    });
});
    


