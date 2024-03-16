@eliminar_taller
	Feature: Eliminar un producto usando la API /api/v1/product/
	
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	* def result = callonce read('nuevo.feature')
	* def sku_incorrecto = 'abc'
	* print result.response
	
	Scenario: Actualizar un producto de forma exitosa
	Given path ruta_crear,'/',result.response.sku,'/'
	When method delete
	Then status 200
	And match $ == {'count':'#number','status':true,'message':'El producto fue eliminado con éxito'}
	
	Scenario: Eliminar un producto de forma inválida
	Given path ruta_crear,'/',sku_incorrecto,'/'
	When method delete
	Then status 400
	And match $ == {'count':0,'status':false,'message':'El producto no fue encontrado'}
	
	