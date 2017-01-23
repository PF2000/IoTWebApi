angular.module('app').config(function($routeProvider, $locationProvider,$httpProvider) {

  //Push in to the httpProvider what we want
  $httpProvider.interceptors.push('sessionInjector');


  $locationProvider.html5Mode({enabled:false});

  $routeProvider.when('/login', {
    templateUrl: 'login.html',
    controller: 'LoginController'
  });
  
  $routeProvider.when('/managment/:id', {
    templateUrl: 'managment.html',
    controller: 'managmentController',
  });
  
  $routeProvider.when('/manageUsers', {
    templateUrl: 'manageUsers.html',
    controller: 'ManageUsersController'
  });

  $routeProvider.when('/register', {
    templateUrl: 'register.html',
    controller: 'RegisterController'
  });

  $routeProvider.when('/home', {
    templateUrl: 'home.html',
    controller: 'HomeController'
  });

  $routeProvider.when('/documentation', {
    templateUrl: 'documentation.html',
    controller: 'DocumentationController'
  });
  $routeProvider.when('/examples', {
    templateUrl: 'examples.html',
    controller: 'ExamplesController'
  });
  $routeProvider.when('/passRecovery', {
    templateUrl: 'passRecovery.html',
    controller: 'PassRecoveryController'
  });

   $routeProvider.when('/changePassword/:token', {
   templateUrl: 'changePassword.html',
   controller: 'ChangePasswordController'
  });

  $routeProvider.when('/changePassword', {
    templateUrl: 'changePassword.html',
    controller: 'ChangePasswordController'
  });

  $routeProvider.when('/resetConfirm', {
    templateUrl: 'resetConfirm.html',
    controller: 'ResetConfirmController'
  });

 $routeProvider.when('/about', {
    templateUrl: 'about.html',
    controller: 'aboutController'
  });

  $routeProvider.otherwise({ redirectTo: '/home' });

});
