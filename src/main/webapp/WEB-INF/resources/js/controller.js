
var app=angular.module('app',[]);
app.controller('myController',function($scope,$http){
	$scope.getBookList=function(){
		$http.get("http://localhost:9080/welcome/getBooksList").then(function(response){
			$scope.books=response.data;
		});
	};
});