@ignore
	Feature: Escenario reutilizable para crear producto
	Scenario: Crear producto de forma satisfactoria
		Given url 'http://localhost:8081/api/v1/product/'
		And request {'name':'Oppo', 'description':'Camara 20 MP', 'price':999999}
		When method post
		Then status 201