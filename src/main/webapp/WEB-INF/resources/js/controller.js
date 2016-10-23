
var app=angular.module("app",[]);
app.controller("myController",function($scope,$http){
	$scope.getBookList=function(){
		$http.get("http://localhost:9080/welcome/getBooksList").success(function(data){
			$scope.books=data;
		});
	};
	$scope.addToCart=function(isbn){
		$http.put("http://localhost:9080/welcome/cart/add/"+isbn).success(function(){
			alert("Added Succesfully to the Cart");
		})
	};
});