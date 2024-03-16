@crear
Feature: Crear un nuevo producto usando la API /api/v1/product/
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	* def nuevo_producto = 
	"""
	{
		"name":"Iphone 20",
		"description":"Telefono de alta gama",
		"price":2000
	}
	"""
	
	Scenario: Crear nu nuevo producto de forma exitosa
	* def producto =
	"""
	{
		"name":"Iphone 20",
		"description":"Telefono de alta gama",
		"price":2000
	}
	"""
	Given url 'http://localhost:8081/api/v1/product/'
	And request nuevo_producto
	And header Accept = 'application/json'
	When method post
	Then status 201
	
	Scenario: Crear producto usando json incrustado
	Given url 'http://localhost:8081/api/v1/product/'
	And request nuevo_producto
	When method post
	Then status 201
	
	Scenario: Crear producto usando path, variable de background
	Given path ruta_crear,'/'
	And request nuevo_producto
	When method post
	Then status 201
	
	Scenario: Crear producto usando path, variable de background, validar response
	Given path ruta_crear,'/'
	And request nuevo_producto
	When method post
	Then status 201
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue creado con éxito!'}
	
	Scenario Outline: Crear producto usando path, variable de background, validar response, datatable
	Given path ruta_crear,'/'
	And request <producto>
	When method post
	Then status 201
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue creado con éxito!'}
	Examples:
	| producto |
	| {'name':'Iphone Datatable 1','description':'Telefono de alta gama','price':2000} |
	| {'name':'Iphone Datatable 2','description':'Telefono de alta gama','price':2000} |	
	