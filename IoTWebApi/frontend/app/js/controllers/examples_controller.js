angular.module("app").controller('ExamplesController',function($scope,$window, $location) {
  

  	$scope.message = "";

	$scope.login = function() {
	    $location.path('/login');
	}; 
	$scope.register = function() {
	    $location.path('/register');
	}; 
	$scope.documentation = function() {
	    $location.path('/documentation');
	}; 
	$scope.examples = function() {
	    $location.path('/examples');
	};

	$scope.csharpGit = function(){
		 $window.open('https://github.com/PF2000/IoTWebApiExamples/tree/master/C%23/APIClient','_blank');
	};

	$scope.javaGit = function(){
		 $window.open('https://github.com/PF2000/IoTWebApiExamples/tree/master/Java/JavaApiClient','_blank');
	};

	$scope.rubyGit = function(){
		 $window.open('https://github.com/PF2000/IoTWebApiExamples/tree/master/Ruby','_blank');
	};

});


