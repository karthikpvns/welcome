
var app=angular.module("app",[])
 .controller("myController",function($scope,$http){
	$scope.getBookList=function(){
		$http.get("http://localhost:9080/welcome/getBooksList").success(function(data){
			$scope.books=data;
		})
	}
	$scope.addToCart=function(isbn){
		$http.put("http://localhost:9080/welcome/cart/add/"+isbn).success(function(){
			alert("Added Succesfully to the Cart");
		})
	}
	$scope.getCart=function(cartId){
		
		$scope.cartId=cartId;
		$scope.refreshCart(cartId);
	}
	
	$scope.refreshCart=function(){
		$http.get("http://localhost:9080/welcome/cart/getCart/"+$scope.cartId).success(function(data){
			$scope.cart=data;
			
		})
	}
	$scope.removeFromCart=function(cartItemId){
		$http.put("http://localhost:9080/welcome/cart/removecartitem/"+cartItemId).success(function(){
			$scope.refreshCart();
		})
	}
	$scope.clearCart=function(){
		$http.put("http://localhost:9080/welcome/cart/removeAllItems/"+$scope.cartId).success(function(){
			$scope.refreshCart();
			
		})
	}
	
	$scope.calculateGrandTotal=function(){
		var grandtotal=0.0
		for(var i=0;i<$scope.cart.cartItem.length;i++){
			grandtotal=grandtotal+$scope.cart.cartItem[i].price;
		}
		return grandtotal;
	}
	
	
});