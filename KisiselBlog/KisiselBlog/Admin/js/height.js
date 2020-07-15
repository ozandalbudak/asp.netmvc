function handleResize() {
var h = $(window).height();
        $('#sol').css({'height':h - '156' + 'px'});
}
$(function(){
        handleResize();

        $(window).resize(function(){
        handleResize();
    });
});