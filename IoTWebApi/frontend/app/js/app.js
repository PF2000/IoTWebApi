angular.module("app", ["ngResource", "ngRoute","ui"]).run(function($rootScope,$http,$templateCache) {
  
	


  $rootScope.log = function(thing) {
    console.log(thing);
  };

  $rootScope.alert = function(thing) {
    alert(thing);
  };

});
