$(document).ready(function(){
    var lat, lng;

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(
            function(position) {
                lat = position.coords.latitude;
                lng = position.coords.longitude;
                $.ajax('/clothes/' + lat + ',' + lng, {
                    success: function(response) {
                                $("<img src=img/" + $.parseJSON(response).clothes + ".png />").appendTo($(".container"));
                            }   
                });
            });
    }

    console.log("lat= " + lat + " long:" + lng);

    
});
