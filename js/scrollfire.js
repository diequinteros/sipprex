
$(document).on("scroll",function(){
    if($(document).scrollTop()>(screen.availHeight/10)){
        $("nav").removeClass("extendido").addClass("contraido");
    } else{
        $("nav").removeClass("contraido").addClass("extendido");
    }
});
        
        