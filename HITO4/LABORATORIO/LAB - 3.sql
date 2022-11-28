 hito4_Funciones


-- VERSIÓN 1
alterar  la función Op(@num1 entero , @num2 entero , @action varchar ( 20 ))
devuelve  entero  como
empezar
	declarar @response entero   =  0 ;
	si (@acción =  ' suma' )
	empezar
		establecer @response = @num1 + @num2;

	final
	si (@acción =  ' resta' )
	empezar
		establecer @response = @num1 - @num2;

	final
	if (@action =  ' multiplicacion' )
	empezar
		establecer @response = @num1 * @num2;

	final
	si (@acción =  ' división' )
	empezar
		establecer @response = @num1 / @num2;

	final 
	devolver @response;
final


seleccione  dbo . Op ( 54 , 12 , ' suma ' ) como SUMA

seleccione  dbo . Op ( 54 , 12 , ' resta ' ) como RESTA

seleccione  dbo . Op ( 54 , 12 , ' multiplicacion' ) como MULTIPLICACION

seleccione  dbo . Op ( 12 , 5 , ' división' ) como DIVISIÓN




-- VERSIÓN 2 MEJOR
CREAR  función Op2(@num1 entero , @num2 entero , @action varchar ( 20 ))
devuelve  entero  como
empezar
	si (@acción =  ' suma' )
		devuelve   @num1 + @num2;

	si (@acción =  ' resta' )
		devolver    @num1 - @num2;
	
	if (@action =  ' multiplicacion' )
		devolver @num1 * @num2;

	si (@acción =  ' división' )
		devolver @num1 / @num2;
	 
	RETORNO   1 ;
final

seleccione  dbo . Op2 ( 54 , 12 , ' ' ) como SUMA


-- VERSIÓN 3 CASO
CREAR  función Op3(@num1 entero , @num2 entero , @action varchar ( 20 ))
devuelve  entero  como
empezar
	si (@acción =  ' suma' )
		devuelve   @num1 + @num2;

	si (@acción =  ' resta' )
		devolver    @num1 - @num2;
	
	if (@action =  ' multiplicacion' )
		devolver @num1 * @num2;

	si (@acción =  ' división' )
		devolver @num1 / @num2;
	 
	RETORNO   1 ;
final




-- FUNCIONES DE AGREGACION Y FUNCION PROPIOS
SELECCIONE  CONTEO ( EST . id_est )
DESDE Estudiantes AS EST
DONDE  EST . edad  >  25

-- CREAR UNA FUNCIÓN QUE PERMITA SABER LA CANTIDAD DE ESTUDIANTES MAYORES A 25
CREAR  FUNCION EJEMPLO1(@edad entero )
DEVUELVE UN  ENTERO  COMO
EMPEZAR
	
	DECLARAR @RESPONSE INTEGER  =  0
	
		SELECCIONE @RESPUESTA =  CONTAR ( EST . id_est )
		DESDE Estudiantes AS EST
		DONDE  EST . edad  > @edad;


	volver @RESPUESTA

FIN ;

SELECCIONE  dbo . EJEMPLO1 ( 25 )



-- MAYOR A CIERTA EDAD FEMENINO QUE FORMA PARTE DE LA ESCUELA
CREAR  FUNCION EJEMPLO2(@edad integer ,@genero varchar ( 25 ))
DEVUELVE UN  ENTERO  COMO
EMPEZAR
	
	DECLARAR @RESPONSE INTEGER  =  0
	
		SELECCIONE @RESPUESTA =  CONTAR ( EST . id_est )
		DESDE Estudiantes AS EST
		unión interna Escuela como esc en  esc . id_esc  =  est . id_esc
		DONDE  EST . edad  > @edad y  esc . nombre  =  ' Andrés Bello'  y  est . genero  = @genero;


	volver @RESPUESTA

FIN ;
 seleccione  dbo . EJEMPLO2 ( 20 , ' Femenino ' )



 
 -- ultimo de la lista
 CREAR  FUNCION  EJEMPLO3 ()
DEVUELVE UN  ENTERO  COMO
EMPEZAR
	
	DECLARAR @RESPONSE INTEGER  =  0
	
	
	SELECCIONE @RESPONSE =  MAX ( EST . id_est )
	DESDE Estudiantes AS est
	

	volver @RESPUESTA

FIN ;

SELECCIONE EST. *
DESDE Estudiantes AS EST
DONDE  EST . id_est  =  dbo . EJEMPLO3 ();