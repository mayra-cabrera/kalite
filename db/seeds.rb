# -*- coding: utf-8 -*-

puts 'Loading administrators...'

Administrator.create!(:first_name =>  'María de Lourdes', :last_name =>  'Hernández Rodríguez', :email =>  'mhernand@lania.mx', :password =>  'password')
Administrator.create!(:first_name =>  'Mayra', :last_name =>  'Cabrera Díaz', :email =>  'mcabrera@lania.mx', :password =>  'password')

puts 'Loading programmers...'

Programmer.create!(:first_name =>  'Yesenia', :last_name =>  'Hernández', :email =>  'yhernandez@lania.mx', :password =>  'password')
Programmer.create!(:first_name =>  'Saul', :last_name =>  'Dominguez', :email =>  'sdominguez@lania.mx', :password =>  'password')
Programmer.create!(:first_name =>  'Yahaira', :last_name =>  'Rodriguez', :email =>  'yrodriguez@lania.mx', :password =>  'password')
Programmer.create!(:first_name =>  'Karla', :last_name =>  'Martinez', :email =>  'kmartine@lania.mx', :password =>  'password')

puts 'Loading atributtes...'
Attribute.create!(:name => 'Anotado') #1
Attribute.create!(:name => 'Completo') #2 
Attribute.create!(:name => 'Consistente') #3
Attribute.create!(:name => 'Correcto') #4
Attribute.create!(:name => 'Exacto') #5
Attribute.create!(:name => 'Verificable') #6
Attribute.create!(:name => 'Trazable') #7

puts 'Loading diagrams..'
Diagram.create!(:name => 'Diagrama de casos de uso', :folio => "CU") #1
Diagram.create!(:name => 'Modelo de dominio', :folio => "MD") #2
Diagram.create!(:name => 'Diagrama de actividades', :folio => "DA") #3
Diagram.create!(:name => 'Diagrama de estados', :folio => "DE") #4

puts 'Loading concepts..'
Concept.create!(:description => "Cada actor representa un rol del sistema", :section_id => 1,:attribute_id => 4, :diagram_id => 1, :folio => "CU_15", :is_automatic => false)
Concept.create!(:description => "Su nombre refleja un rol realizado por una persona, base de datos u otro sistema", :section_id => 1, :attribute_id => 4, :diagram_id => 1, :folio => "CU_16", :is_automatic => false)
Concept.create!(:description => "Reflejan todas las entidades que intercambian información", :section_id => 1, :attribute_id => 2, :diagram_id => 1, :folio => "CU_1", :is_automatic => true)
Concept.create!(:description => "La relación entre el actor y el caso de uso refleja una funcionalidad del sistema", :section_id => 1, :attribute_id => 5, :diagram_id => 1, :folio => "CU_17", :is_automatic => false)
Concept.create!(:description => "Cada nombre es expresado en singular", :section_id => 1, :attribute_id => 4, :diagram_id => 1, :folio => "CU_2", :is_automatic => true)
Concept.create!(:description => "Existe un nombre asociado a cada actor", :section_id => 1,:attribute_id => 1,  :diagram_id => 1, :folio => "CU_3", :is_automatic => true)
Concept.create!(:description => "La relación de generalizacion refleja herencia entre el hijo y el padre", :section_id => 1,  :attribute_id => 4, :diagram_id => 1, :folio => "CU_18", :is_automatic => false)
Concept.create!(:description => "Expresan un requerimiento del sistema", :section_id => 2, :attribute_id => 4, :diagram_id => 1, :folio => "CU_19", :is_automatic => false)
Concept.create!(:description => "Cada requerimiento no tiene conflictos entre sí", :section_id => 2,  :attribute_id => 3,  :diagram_id => 1, :folio => "CU_20", :is_automatic => false)
Concept.create!(:description => "Su descripción es una frase verbal en infinitivo", :section_id => 2, :attribute_id => 1, :diagram_id => 1, :folio => "CU_5", :is_automatic => true)
Concept.create!(:description => "Su descripción es precisa y sin ambiguedades", :section_id => 2, :attribute_id => 5, :diagram_id => 1, :folio => "CU_21", :is_automatic => false)
Concept.create!(:description => "Están organizados en paquetes", :section_id => 2,:attribute_id => 4, :diagram_id => 1, :folio => "CU_6", :is_automatic => true)
Concept.create!(:description => "Cada caso de uso es único", :section_id => 2, :attribute_id => 4, :diagram_id => 1, :folio => "CU_22", :is_automatic => false)
Concept.create!(:description => "Cada nombre de caso de uso es único", :section_id => 2,  :attribute_id => 1, :diagram_id => 1, :folio => "CU_7", :is_automatic => true)
Concept.create!(:description => "Los elementos del diagrama son del color indicado", :section_id => 2, :attribute_id => 1, :diagram_id => 1, :folio => "CU_8", :is_automatic => false)
Concept.create!(:description => "Cada requerimiento tiene relación con los casos de uso que lo implementa", :section_id => 2, :attribute_id => 7, :diagram_id => 1, :folio => "CU_9", :is_automatic => true)
Concept.create!(:description => "Cuenta con al menos un caso de prueba", :section_id => 2, :attribute_id => 4, :diagram_id => 1, :folio => "CU_10", :is_automatic => true)
Concept.create!(:description => "Cada caso de prueba es comprobable", :section_id => 2, :attribute_id => 6, :diagram_id => 1, :folio => "CU_23", :is_automatic => false)
Concept.create!(:description => "Cada caso de prueba tiene asignado un estatus", :section_id => 2, :attribute_id => 1,  :diagram_id => 1, :folio => "CU_11", :is_automatic => true)
Concept.create!(:description => "Cada caso de prueba tiene asignado un tipo", :section_id => 2, :attribute_id => 1, :diagram_id => 1, :folio => "CU_12", :is_automatic => true)
Concept.create!(:description => "Existe una descripción asociada a cada caso de uso", :section_id => 2,  :attribute_id => 1,:diagram_id => 1, :folio => "CU_4", :is_automatic => true)
Concept.create!(:description => "Están escritos en voz activa, en presente, describiendo acciones y respuestas del usuario y del sistema", :section_id => 3, :attribute_id => 4, :diagram_id => 1, :folio => "CU_24", :is_automatic => false)
Concept.create!(:description => "Siguen la estructura verbo-sustantivo", :section_id => 3,  :attribute_id => 4, :diagram_id => 1, :folio => "CU_25", :is_automatic => false)
Concept.create!(:description => "Especifican escenarios detallados de lo que hace el usuario", :section_id => 3, :attribute_id => 4, :diagram_id => 1, :folio => "CU_26", :is_automatic => false)
Concept.create!(:description => "Cada caso de uso cuenta con al menos un curso básico", :section_id => 3, :attribute_id => 2, :diagram_id => 1,  :folio => "CU_13", :is_automatic => true)
Concept.create!(:description => "Cada caso de uso cuenta con al menos un curso alterno", :section_id => 3,  :attribute_id => 2, :diagram_id => 1, :folio => "CU_14", :is_automatic => true)
Concept.create!(:description => "El nombre de cada diagrama de casos de uso refleja la funcionalidad del conjunto de casos de uso que contiene", :section_id => 4, :attribute_id => 4, :diagram_id => 1, :folio => "CU_27", :is_automatic => false)
Concept.create!(:description => "Un caso de uso con el símbolo de composición, denota una referencia a un conjunto de casos de uso", :section_id => 4,  :attribute_id => 4, :diagram_id => 1, :folio => "CU_28", :is_automatic => false)
Concept.create!(:description => "Un elemento compuesto no tiene escenarios asociados", :section_id => 4,  :attribute_id => 4, :diagram_id => 1, :folio => "CU_15", :is_automatic => true)
Concept.create!(:description => "Agrupan casos de acuerdo al proceso que cubren", :section_id => 4,  :attribute_id => 4, :diagram_id => 1, :folio => "CU_29", :is_automatic => false)
Concept.create!(:description => "La relación include refleja la ejecución obligatoria del caso de uso asociado", :section_id => 5,:attribute_id => 5,  :diagram_id => 1, :folio => "CU_30", :is_automatic => false)
Concept.create!(:description => "La relación extends indica flujos alternos opcionales del caso de uso", :section_id => 5, :attribute_id => 5, :diagram_id => 1, :folio => "CU_31", :is_automatic => false)
#Diagrama de actividades
Concept.create!(:description => "Representan de forma detallada una secuencia de actividades", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_9", :is_automatic => false)
Concept.create!(:description => "Capturan acciones y los resultados de estas acciones", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_10", :is_automatic => false)
Concept.create!(:description => "Representan caminos lógicos de un proceso", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_11", :is_automatic => false)
Concept.create!(:description => "El nombre de cada diagrama cumple con las especificaciones", :section_id => 6,  :attribute_id => 1, :diagram_id => 3, :folio => "DA_12", :is_automatic => false)
Concept.create!(:description => "Todos los diagramas tienen un punto inicial", :section_id => 6,  :attribute_id => 2, :diagram_id => 3, :folio => "DA_13", :is_automatic => false)
Concept.create!(:description => "Todos los diagramas tienen al menos un punto final", :section_id => 6, :attribute_id => 2, :diagram_id => 3, :folio => "DA_14", :is_automatic => false)
Concept.create!(:description => "Los objetos de conexión son usados adecuadamente", :section_id => 6,  :attribute_id => 4, :diagram_id => 3, :folio => "DA_15", :is_automatic => false)
Concept.create!(:description => "Representan puntos de decisión o nodos fusión mediante gateways", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_16", :is_automatic => false)
Concept.create!(:description => "Las barras fork/join son usadas para representar la sincronización de actividades paralelas", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_17", :is_automatic => false)
Concept.create!(:description => "Utiliza regiones para representar actividades interrumpidas o procesos que se realizan múltiples veces", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_18", :is_automatic => false)
Concept.create!(:description => "Utiliza eventos de envío o recepción para representar envío de señales o peticiones, y aceptación o recepción de una petición", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_19", :is_automatic => false)
Concept.create!(:description => "Utiliza manejadores de excepciones para operaciones donde ocurren excepciones", :section_id => 6, :attribute_id => 4, :diagram_id => 3, :folio => "DA_20", :is_automatic => false)
Concept.create!(:description => "Las anotaciones de texto son claras y sin ambigüedades", :section_id => 6, :attribute_id => 5, :diagram_id => 3, :folio => "DA_21", :is_automatic => false)
Concept.create!(:description => "Los diagramas reflejan los requerimientos indicados en el documento F01 (propuesta técnica) y el modelo de dominio", :section_id => 6, :attribute_id => 7, :diagram_id => 3, :folio => "DA_22", :is_automatic => false)
Concept.create!(:description => "Cada responsable de alguna actividad es representado por medio de carriles", :section_id => 7, :attribute_id => 4, :diagram_id => 3, :folio => "DA_23", :is_automatic => false)
Concept.create!(:description => "Las actividades asignadas a cada responsable son apropiadas de acuerdo a su función", :section_id => 7, :attribute_id => 4, :diagram_id => 3, :folio => "DA_24", :is_automatic => false)
Concept.create!(:description => "Cada responsable es identificado por el nombre de su rol (Ej. Gerente, Operador, Analista, etc.)", :section_id => 7, :attribute_id => 4,  :diagram_id => 3, :folio => "DA_25", :is_automatic => false)
Concept.create!(:description => "Los responsables considerados en los diagramas se relacionan con el mapa de actores del modelo de casos de uso", :section_id => 7, :attribute_id => 4, :diagram_id => 3, :folio => "DA_26", :is_automatic => false)
Concept.create!(:description => "Es lógica y clara la secuencia de actividades de cada diagrama", :section_id => 8, :attribute_id => 5, :diagram_id => 3, :folio => "DA_1", :is_automatic => false)
Concept.create!(:description => "Las actividades reflejan el control y flujo de datos de un proceso", :section_id => 8, :attribute_id => 4,  :diagram_id => 3, :folio => "DA_2", :is_automatic => false)
Concept.create!(:description => "Las acciones describen un proceso básico o una transformación que ocurre dentro del sistema", :section_id => 8, :attribute_id => 4,  :diagram_id => 3, :folio => "DA_3", :is_automatic => false)
Concept.create!(:description => "Las actividades estructuradas están identificadas por el símbolo “∞” y enlazan hacia un diagrama que describe su detalle", :section_id => 8, :attribute_id => 4, :diagram_id => 3, :folio => "DA_4", :is_automatic => false)
Concept.create!(:description => "Las actividades estructuradas se relacionan con el tipo que representan (estructurada, condicional, secuencial, etc.)", :section_id => 8, :attribute_id => 4, :diagram_id => 3, :folio => "DA_5", :is_automatic => false)
Concept.create!(:description => "Las actividades que no son claras tienen asociadas anotaciones de texto", :section_id => 8, :attribute_id => 1, :diagram_id => 3, :folio => "DA_6", :is_automatic => false)
Concept.create!(:description => "Las actividades están escritas en infinitivo", :section_id => 8, :attribute_id => 4, :diagram_id => 3, :folio => "DA_7", :is_automatic => false)
Concept.create!(:description => "Las actividades no generan conflictos entre sí.", :section_id => 8, :attribute_id => 3, :diagram_id => 3, :folio => "DA_8", :is_automatic => false)

#Modelo de dominio
Concept.create!(:description => "Representa todas los objetos que intercambian información y sus asociaciones", :section_id => 9, :attribute_id => 2,  :diagram_id => 2, :folio => "MD_1", :is_automatic => false)
Concept.create!(:description => "Los objetos reflejan la perspectiva del usuario funcional o dueño del proceso de negocio", :section_id => 9,  :attribute_id => 4, :diagram_id => 2, :folio => "MD_2", :is_automatic => false)
Concept.create!(:description => "No existen subprocesos pendientes de especificar", :section_id => 9,  :attribute_id => 2,  :diagram_id => 2, :folio => "MD_3", :is_automatic => false)
Concept.create!(:description => "Las relaciones entre objetos representan funcionalidad", :section_id => 9, :attribute_id => 3,:diagram_id => 2, :folio => "MD_4", :is_automatic => false)
Concept.create!(:description => "El nombre del diagrama refleja el dominio de los objetos", :section_id => 9, :attribute_id => 4,  :diagram_id => 2, :folio => "MD_5", :is_automatic => false)
Concept.create!(:description => "No existen objetos fuera del contexto", :section_id => 9, :attribute_id => 4,  :diagram_id => 2, :folio => "MD_6", :is_automatic => false)

Concept.create!(:description => "Los objetos están definidos sin ambigüedades", :section_id => 10, :attribute_id => 3, :diagram_id => 2, :folio => "MD_7", :is_automatic => false)
Concept.create!(:description => "Los objetos no causan conflictos entre sí", :section_id => 10,  :attribute_id => 3, :diagram_id => 2, :folio => "MD_8", :is_automatic => false)
Concept.create!(:description => "Los objetos representan entidades de la realidad física", :section_id => 10, :attribute_id => 2,  :diagram_id => 2, :folio => "MD_9", :is_automatic => false)
Concept.create!(:description => "Los objetos se definen a través de sustantivos", :section_id => 10, :attribute_id => 1,  :diagram_id => 2, :folio => "MD_10", :is_automatic => false)
Concept.create!(:description => "Las asociaciones entre objetos se definen a través de frases verbales", :section_id => 10, :attribute_id => 1,  :diagram_id => 2, :folio => "MD_11", :is_automatic => false)

#Diagrama de estados
Concept.create!(:description => "Representa una máquina de estados finito", :section_id => 11,  :attribute_id => 3,  :diagram_id => 4, :folio => "DE_1", :is_automatic => false)
Concept.create!(:description => "Todos los diagramas tienen un punto inicial", :section_id => 11, :attribute_id => 4,  :diagram_id => 4, :folio => "DE_2", :is_automatic => false)
Concept.create!(:description => "Todos los diagramas tienen al menos un punto final", :section_id => 11, :attribute_id => 4,  :diagram_id => 4, :folio => "DE_3", :is_automatic => false)
Concept.create!(:description => "Una transición entre estados representa un cambio de un estado origen a un estado sucesor", :section_id => 11,  :attribute_id => 4,  :diagram_id => 4, :folio => "DE_4", :is_automatic => false)
Concept.create!(:description => "El nombre del diagrama cumple con las especificaciones", :section_id => 11, :attribute_id => 1,  :diagram_id => 4, :folio => "DE_5", :is_automatic => false)
Concept.create!(:description => "Representa los diferentes estados de un objeto", :section_id => 11,  :attribute_id => 3,  :diagram_id => 4, :folio => "DE_6", :is_automatic => false)
Concept.create!(:description => "Las etiquetas de transición están escritas en expresiones regulares", :section_id => 11, :attribute_id => 1,  :diagram_id => 4, :folio => "DE_7", :is_automatic => false)
Concept.create!(:description => "Cada objeto está en un estado en cierto instante", :section_id => 11, :attribute_id => 3,  :diagram_id => 4, :folio => "DE_8", :is_automatic => false)
Concept.create!(:description => "Todos los estados están relacionados con un mismo objeto", :section_id => 11,  :attribute_id => 4,  :diagram_id => 4, :folio => "DE_9", :is_automatic => false)
Concept.create!(:description => "La secuencia de estados del diagrama representa un ciclo de vida lógico", :section_id => 11, :attribute_id => 4,  :diagram_id => 4, :folio => "DE_10", :is_automatic => false)
Concept.create!(:description => "Es una de las posibles situaciones en la cual un estado puede existir", :section_id => 12,  :attribute_id => 4,  :diagram_id => 4, :folio => "DE_11", :is_automatic => false)
Concept.create!(:description => "Abarca todas las condiciones en las cuales un objeto puede existir", :section_id => 12,  :attribute_id => 4,  :diagram_id => 4, :folio => "DE_12", :is_automatic => false)
Concept.create!(:description => "Los atributos caracterizan el estado del objeto", :section_id => 12,  :attribute_id => 3,  :diagram_id => 4, :folio => "DE_13", :is_automatic => false)
Concept.create!(:description => "El estado determina el comportamiento del objeto", :section_id => 12,  :attribute_id => 3,  :diagram_id => 4, :folio => "DE_14", :is_automatic => false)
Concept.create!(:description => "Cada estado pertence a un objeto", :section_id => 12, :attribute_id => 3,  :diagram_id => 4, :folio => "DE_15", :is_automatic => false)
Concept.create!(:description => "Los estados no causan conflictos entre sí", :section_id => 12,  :attribute_id => 3,  :diagram_id => 4, :folio => "DE_16", :is_automatic => false)
Concept.create!(:description => "El nombre del estado está acorde a la especificación", :section_id => 12, :attribute_id => 1,  :diagram_id => 4, :folio => "DE_17", :is_automatic => false)


puts 'Loading System Type...'
SystemType.create!(:name => "Sistema de soporte")
SystemType.create!(:name => "Científico")
SystemType.create!(:name => "Aplicaciones de negocios")
SystemType.create!(:name => "Embebido")
SystemType.create!(:name => "Sistema web")
SystemType.create!(:name => "Inteligencia Artificial")


puts 'Loding system...'

System.create!(:name => "SATI", :system_type_id => 5, :description => "Sistema de administración de tiendas IMSS")
System.create!(:name => "LIS", :system_type_id => 3, :description => "Lis es un sistema que?")

puts 'Loading subsystems...'

Subsystem.create!(:name => "SATI - Central", :system_id => 1, :description => "Subsistema general del IMSS")
Subsystem.create!(:name => "LIS - General", :system_id => 2, :description => "Subsistema de LIS")

puts 'Loading Sections...'
#Casos de uso
Section.create!(:name => "Actores", :diagram_id => 1)
Section.create!(:name => "Casos de uso", :diagram_id => 1)
Section.create!(:name => "Escenarios", :diagram_id => 1)
Section.create!(:name => "Diagrama", :diagram_id => 1)
Section.create!(:name => "Relaciones", :diagram_id => 1)
#Diagrama de actividades
Section.create!(:name => "Diagrama", :diagram_id => 3)
Section.create!(:name => "Responsable", :diagram_id => 3)
Section.create!(:name => "Actividades", :diagram_id => 3)
#Modelo de dominio
Section.create!(:name => "Diagrama", :diagram_id => 2)
Section.create!(:name => "Objeto", :diagram_id => 2)
#Diagrama de estados
Section.create!(:name => "Diagrama", :diagram_id => 4)
Section.create!(:name => "Estados", :diagram_id => 4)



puts 'Loading score...'
Score.create!(:description => "No aceptable", :start => 0.0, :end => 60.0)
Score.create!(:description => "Deficiente", :start => 61.0, :end => 70.0)
Score.create!(:description => "Regular", :start => 71.0, :end => 80.0)
Score.create!(:description => "Bueno", :start => 81.0, :end => 90.0)
Score.create!(:description => "Muy bueno", :start => 91.0, :end => 100.0)

puts 'Loading assigments...'

#1
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 3, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 1, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 3, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 2, :weight => 0.1)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 3, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 3, :attribute_id => 7, :weight => 0.1)

Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 3, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 1, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)

#2
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 3, :weight => 0.15)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 5, :weight => 0.15)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 1, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 3, :weight => 0.15)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 5, :weight => 0.15)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 2, :weight => 0.2 )
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 3, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 2, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)

#3
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 2, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 3, :weight => 0.15)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 6, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 1, :attribute_id => 7, :weight => 0.1)

Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 2, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 3, :weight => 0.25)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 6, :weight => 0.15)
Assignment.create!(:system_type_id => 3, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 1, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 2, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 3, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 4, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 6, :weight => 0.15)
Assignment.create!(:system_type_id => 3, :diagram_id => 3, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 2, :weight => 0.25)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 4, :weight => 0.25)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 3, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)

#4
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 1, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 3, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 2, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 3, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 4, :weight => 0.3)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 5, :weight => 0.2)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 4, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)

#5
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 1, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 3, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 5, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)

#6
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 1, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 2, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 3, :attribute_id => 7, :weight => 0.05)

Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 1, :weight => 0.05)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 2, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 3, :weight => 0.3)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 4, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 5, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 6, :weight => 0.1)
Assignment.create!(:system_type_id => 6, :diagram_id => 4, :attribute_id => 7, :weight => 0.05)



