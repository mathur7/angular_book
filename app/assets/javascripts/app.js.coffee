BookApp = angular.module("BookApp", [])

BookApp.controller("BooksCtrl", ["$scope", "$http", ($scope, $http)->	
	$scope.visible = false;
	$scope.books = []
	$http.get("/books.json").success (data)->
		$scope.books = data


	$scope.addBook = ->
		console.log $scope.newBook
		$http.post('/books.json', $scope.newBook).success (data) ->
			console.log "Saved!"
			$scope.newBook = {}
			$scope.books.push(data)	

	$scope.updateBook = ->
		# console.log @book
		$http.put("/books/#{@book.id}.json", @book).success (data)=>
			@editing = !@editing


	$scope.deleteBook = ->
		# console.log @book
		$http.delete("/books/#{@book.id}.json").success (data)=>
			console.log "book deleted"
			$scope.books.splice(@$index,1)

])

BookApp.config(["$httpProvider", ($httpProvider) ->
  $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
