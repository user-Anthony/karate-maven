@crear_taller
Feature: Crear un nuevo producto usando la API /api/v1/product/
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'

	Scenario Outline: Crear producto exitoso
	Given path ruta_crear,'/'
	And request <producto>
	When method post
	Then status 201
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue creado con éxito!'}
	Examples:
	| producto |
	| {'name':'Xiaomi 11 note pro','description':'Telefono de alta gama proveniente de china','price':1300} |
	| {'name':'Iphone 9','description':'Telefono de alta gama proveniente de Rusia','price':5000} |	
	
	Scenario Outline: Crear productos incorrectos
	Given path ruta_crear,'/'
	And request <producto>
	When method post
	Then status 400
	And match $ == {'sku':'','status':false,'message':'#notnull'}
	Examples:
	| producto |
	| {'name':'','description':'Telefono de alta gama proveniente de china','price':1300} |		
	| {'name':'Taladro Magnétivo','description':'','price':899} |		
	| {'name':'Clavo','description':'Acero inolvidalble','price':0} |		