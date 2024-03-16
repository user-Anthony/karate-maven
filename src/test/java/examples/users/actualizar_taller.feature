@actualizar_taller
Feature: Actualizar producto existente usando la API /api/v1/product/
	
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	* def result = callonce read('nuevo.feature')
	* def sku_incorrecto = 1
	* print result.response

	Scenario Outline: Actualizar un producto de forma exitosa
	Given path ruta_crear,'/',result.response.sku,'/'
	And request <producto>
	When method put
	Then status 200
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue actualizado con éxito'}
	Examples:
	| producto |
	| {'name':'Foco','description':'Con cable','price':10} |
	
	Scenario Outline: Actualizar un producto de forma incorrecta
	Given path ruta_crear,'/',sku_incorrecto,'/'
	And request <producto>
	When method put
	Then status 400
	And match $ == {'sku':"#notnull",'status':false,'message':'El producto no fue encontrado'}
	Examples:
	| producto |
	| {'name':'Foco','description':'Con cable','price':10} |