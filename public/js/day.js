$(document).ready(function(){
    var lat, lng;
    // images from http://www.mycutegraphics.com/graphics/seasons-images.html

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            function(position) {
                lat = position.coords.latitude;
                lng = position.coords.longitude;
                $.ajax('/clothes/' + lat + ',' + lng, {
                    success: function(response) {
                                $("<img src=img/" + $.parseJSON(response).clothes + ".png />").appendTo($(".clothes-container"));
                            }   
                });
            });
    }

    console.log("lat= " + lat + " long:" + lng);

    
});
