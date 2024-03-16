@eliminar
	Feature: Eliminar uun producto usando la api
	
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	* def result = callonce read('nuevo.feature')
	* print result.response
	
	Scenario: Actualizar un producto de forma exitosa
	Given path ruta_crear,'/',result.response.sku,'/'
	When method delete
	Then status 200
	And match $ == {'count':'#number','status':true,'message':'El producto fue eliminado con éxito'}