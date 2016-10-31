
$(document).on("scroll",function(){
    if($(document).scrollTop()>1){
        $("nav").removeClass("extendido").addClass("contraido");
    } else{
        $("nav").removeClass("contraido").addClass("extendido");
    }
});
        
        