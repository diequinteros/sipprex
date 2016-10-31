
$(document).on("scroll",function(){
    if($(document).scrollTop()>75){
        $("nav").removeClass("extendido").addClass("contraido");
    } else{
        $("nav").removeClass("contraido").addClass("extendido");
    }
});
        
        