'use strict';
/*
Pour créer une "API" et pouvoir communiquer en JSON entre JS et PHP, tout en respectant notre MVC
Il nous faut :
1. Une route pour accéder aux données JSON (/api/meals par exemple)
2. Donc, un controlleur (dans controllers/api/meals/MealsController.class.php)
    - On appel le model correspondant pour récupérer les données
    - Celui-ci doit return avec _raw_template => true pour ne pas inclure le LayoutView
3. Une View qui encode en json le résultat du controlleur avec un header pour spécifier que le contenu est en JSON

Coté JS
1. On fait un requete ajax vers la route qui correspond aux données que l'on veut récupérer (/api/meals?id=1 par exemple)
2. Dans la fonction de retour, la reponse contient le JSON !
*/

/////////////////////////////////////////////////////////////////////////////////////////
// FONCTIONS                                                                           //
/////////////////////////////////////////////////////////////////////////////////////////
function onClickExecute() {
    let value =  $('#select').val();
    
    $('#target').addClass('meal-details');

    $.getJSON(ServerConfig.requestUrl + '/api/meals', {id: value}, function(response) {
        $('#target').html('<img src="'+ServerConfig.wwwUrl+'/images/meals/'+response.Photo+'"><p>'+response.Description+'</p><p>Prix : '+response.SalePrice+' €');
        loadedItems[response.Id] = response;
    });
}
/////////////////////////////////////////////////////////////////////////////////////////
// CODE PRINCIPAL                                                                      //
/////////////////////////////////////////////////////////////////////////////////////////
$(function() {
    $('#select').on('change', onClickExecute);
});