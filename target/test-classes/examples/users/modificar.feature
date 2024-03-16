@actualizar
Feature: Actualizar producto existente usando la API /api/v1/product/
	
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	* def result = callonce read('nuevo.feature')
	* print result.response

	Scenario Outline: Actualizar un producto de forma exitosa
	Given path ruta_crear,'/',result.response.sku,'/'
	And request <producto>
	When method put
	Then status 200
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue actualizado con éxito'}
	Examples:
	| producto |
	| {'name':'Iphone Datatable 1','description':'Telefono de alta gama','price':1} |
	| {'name':'Iphone Datatable 2','description':'Telefono de alta gama','price':2} |