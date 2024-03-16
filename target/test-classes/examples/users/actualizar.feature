@Actualizar
Feature: Actualizar un producto existente usando la API /api/v1/product/
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
		Given path ruta_crear,'/'
		And request {'name':'Original iphone', 'description':'Descripción actualizada', 'price':8000}
		When method post
		Then status 201
		* def sku_creado = response.sku
	
	Scenario Outline: Actualizar un producto de forma exitosa
	Given path ruta_crear,'/',sku_creado,'/'
	And request <producto>
	When method put
	Then status 200
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue actualizado con éxito'}
	Examples:
	| producto |
	| {'name':'Iphone Datatable 55','description':'Telefono de alta gama','price':2000} |
	| {'name':'Iphone Datatable 99','description':'Telefono de alta gama','price':2000} |	
	