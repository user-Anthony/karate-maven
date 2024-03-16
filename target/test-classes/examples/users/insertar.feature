@insertar
	Feature: Insertar productos desde un archivo CSV
	Background:
	* url 'http://localhost:8081'
	* def ruta_crear = '/api/v1/product/'
	
	Scenario Outline: Insertar productos desde un CSV de forma exitosa
	Given path ruta_crear,'/'
	And request { name: <name>, description: <description>, price: <price> }
	When method post
	Then status 201
	And match $ == {'sku':'#notnull','status':true,'message':'El producto fue creado con éxito!'}
	Examples:
	| read('productos.csv') |