# <p align="center">PIC16F887</p>
<br>
El PIC16F887 es un poderoso y económico microcontrolador de 40 terminales, tiene una arquitectura de 8 bits, ADC, PWM, comunicación serial, oscilador interno, entre otras muchas características, lo hacen un reemplazo obvio del antiguo PIC16F877A.
<br>
El microcontrolador tiene una memoria de 8 KB, suficiente para aplicaciones en la industria o en dispositivos electrónicos donde se requiera conectar varios periféricos, pues cuenta hasta con 36 líneas de entrada/salida‏
<IMG SRC="https://learn.mikroe.com/ebooks/wp-content/uploads/sites/37/2016/02/al-mundo-de-los-microcontroladores-chapter-03-fig3-1.gif">

* [Caracteristicas del PIC](#características-del-pic)
 * [Diagramas del PIC](#diagramas)
* [Descripcion pines](#descripcion-de-pines)
* [Unidad de procesamiento central (CPU)](#unidad-central-de-procesamiento-cpu)
* [Memoria](#memoria)
* [Memoria ROM](#memoria-rom)
* [Memoria EEPROM](#memoria-eeprom)
* [Memoria ram](#memoria-ram)
* [Registro de proposito general](#registros-de-propÓsito-general)
* [Mas información](#mas-información)
* [Sobre el proyecto](#sobre-el-proyecto)

## Características del PIC
<div class="fleft">
<ul class="default_font flat"><li><b>Arquitectura RISC</b>
<ul class="default_font flat"><li>El microcontrolador cuenta con solo 35 instrucciones diferentes</li>
<li>Todas las instrucciones son uni-ciclo excepto por las de ramificación</li>
</ul></li>
<li><b>Frecuencia de operación 0-20 MHz</b></li>
<li><b>Oscilador interno de alta precisión</b>
<ul class="default_font flat"><li>Calibrado de fábrica</li>
<li>Rango de frecuencia de 8MHz a 31KHz seleccionado por software</li>
</ul></li>
<li><b>Voltaje de la fuente de alimentación de 2.0V a 5.5V</b>
<ul class="default_font flat"><li>Consumo: 220uA (2.0V, 4MHz), 11uA (2.0 V, 32 KHz) 50nA (en modo de espera)</li>
</ul></li>
<li><b>Ahorro de energía en el <i>Modo de suspensión</i></b></li>
<li><b>Brown-out Reset (BOR) con opción para controlar por software</b></li>
<li><b>35 pines de entrada/salida</b>
<ul class="default_font flat"><li>Alta corriente de fuente y de drenador para manejo de LED</li>
<li>Resistencias <i>pull-up</i> programables individualmente por software</li>
<li>Interrupción al cambiar el estado del pin</li>
</ul></li>
<li><b>Memoria ROM de 8K con tecnología FLASH</b>
<ul class="default_font flat"><li>El chip se puede re-programar hasta 100.000 veces</li>
</ul></li>
<li><b>Opción de <i>programación serial en el circuito</i></b>
<ul class="default_font flat"><li>El chip se puede programar incluso incorporado en el dispositivo destino.</li>
</ul></li>
</ul></div>
<div class="fleft">
<ul class="default_font flat"><li><b>256 bytes de memoria EEPROM</b>
<ul class="default_font flat"><li>Los datos se pueden grabar más de 1.000.000 veces</li>
</ul></li>
<li><b>368 bytes de memoria RAM</b></li>
<li><b>Convertidor A/D:</b>
<ul class="default_font flat"><li>14 canales</li>
<li>resolución de 10 bits</li>
</ul></li>
<li><b>3 temporizadores/contadores independientes</b></li>
<li><b>Temporizador perro guardián</b></li>
<li><b>Módulo comparador analógico con</b>
<ul class="default_font flat"><li>Dos comparadores analógicos</li>
<li>Referencia de voltaje fija (0.6V)</li>
<li>Referencia de voltaje programable en el chip</li>
</ul></li>
<li><b>Módulo PWM incorporado</b></li>
<li><b>Módulo USART mejorado</b>
<ul class="default_font flat"><li>Soporta las comunicaciones seriales RS-485, RS-232 y LIN2.0</li>
<li>Auto detección de baudios</li>
</ul></li>
<li><b>Puerto Serie Síncrono Maestro (MSSP)</b>
<ul class="default_font flat"><li>Soporta los modos SPI e I2C</li>
</ul></li>
</ul></div>

## Diagramas
<img src='http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204117/al-mundo-de-los-microcontroladores-chapter-03-fig3-1.gif'>
<img src='http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204132/al-mundo-de-los-microcontroladores-chapter-03-fig3-2.gif'>
<img src='http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204148/al-mundo-de-los-microcontroladores-chapter-03-fig3-3.gif'>

## Descripcion de pines
<p>La mayoría de los pines del microcontrolador PIC16F887 son multipropósito como se muestra en la figura anterior. Por ejemplo, la asignación RA3/AN3/Vref+/C1IN+ para el quinto pin del microcontrolador indica que éste dispone de las siguientes funciones:</p>
<ul class="default_font flat"><li>RA3 Tercera entrada/salida digital del puerto A</li>
<li>AN3 Tercera entrada analógica</li>
<li>Vref+ Referencia positiva de voltaje</li>
<li>C1IN+ Entrada positiva del comparador C1</li>
</ul>
<p>La funcionalidad de los pines presentados anteriormente es muy útil puesto que permite un mejor aprovechamiento de los recursos del microcontrolador sin afectar a su funcionamiento. Estas funciones de los pines no se pueden utilizar simultáneamente, sin embargo se pueden cambiar en cualquier instante durante el funcionamiento.</p>
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204201/al-mundo-de-los-microcontroladores-chapter-03-fig3-4.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-4" width="670" height="817" class="aligncenter size-full wp-image-142"></div
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204218/al-mundo-de-los-microcontroladores-chapter-03-fig3-5.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-5" width="675" height="787" class="aligncenter size-full wp-image-143"></div>
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204231/al-mundo-de-los-microcontroladores-chapter-03-fig3-6.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-6" width="668" height="715" class="aligncenter size-full wp-image-144"></div>

## UNIDAD CENTRAL DE PROCESAMIENTO (CPU)
<p>Con el propósito de explicar en forma clara y concisa, sin describir profundamente el funcionamiento de la CPU, vamos a hacer constar que la CPU está fabricada con la tecnología RISC ya que esto es un factor importante al decidir qué microcontrolador utilizar.</p>
<p>RISC es un acrónimo derivado del inglés <i>Reduced Instruction Set Computer</i>, lo que proporciona al PIC16F887 dos grandes ventajas:</p>
<ul class="default_font flat"><li>La CPU cuenta con sólo 35 instrucciones simples. Cabe decir que para poder programar otros microcontroladores en lenguaje ensamblador es necesario saber más de 200 instrucciones</li>
<li>El tiempo de ejecución es igual para casi todas las instrucciones y tarda 4 ciclos de reloj. La frecuencia del oscilador se estabiliza por un cristal de cuarzo. Las instrucciones de salto y de ramificación tardan ocho ciclos de reloj en ejecutarse. Esto significa que si la velocidad de operación del microcontrolador es 20 MHz, el tiempo de ejecución de cada instrucción será 200nS, o sea, ¡el programa ejecutará 5millones de instrucciones por segundo!</li>
</ul>
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204251/al-mundo-de-los-microcontroladores-chapter-03-fig3-7.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-7" width="650" height="390" class="aligncenter size-full wp-image-145"></div>

## MEMORIA
<p>El PIC16F887 tiene tres tipos de memoria: ROM, RAM y EEPROM. Como cada una tiene las funciones, características y organización específicas, vamos a presentarlas por separado.</p>

## MEMORIA ROM
<p>La memoria ROM se utiliza para guardar permanente el programa que se está ejecutando. Es la razón por la que es frecuentemente llamada “memoria de programa”. El PIC16F887 tiene 8Kb de memoria ROM (en total 8192 localidades). Como la memoria ROM está fabricada con tecnología FLASH, su contenido se puede cambiar al proporcionarle un voltaje de programación especial (13V).</p>
<p>No obstante, no es necesario explicarlo en detalles puesto que se realiza automáticamente por un programa especial en la PC y un simple dispositivo electrónico denominado programador.</p>
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204303/al-mundo-de-los-microcontroladores-chapter-03-fig3-8.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-8" width="650" height="325" class="aligncenter size-full wp-image-146"></div>

## Memoria EEPROM
<p>Similar a la memoria de programa, el contenido de memoria EEPROM está permanentemente guardado al apagar la fuente de alimentación. Sin embargo, a diferencia de la ROM, el contenido de la EEPROM se puede cambiar durante el funcionamiento del microcontrolador. Es la razón por la que esta memoria (256 localidades) es perfecta para guardar permanentemente algunos resultados creados y utilizados durante la ejecución del programa.</p>

## Memoria RAM
<p>Es la tercera y la más compleja parte de la memoria del microcontrolador. En este caso consiste en dos partes: en registros de propósito general y en los registros de funciones especiales (SFR). Todos estos registros se dividen en cuatro bancos de memoria de los que vamos a hablar más tarde en este capítulo.</p>
<p>A unque los dos grupos de registros se ponen a cero al apagar la fuente de alimentación, además están fabricados de la misma forma y se comportan de la manera similar, sus funciones no tienen muchas cosas en común.</p>
<div class="center"><img src="http://cdn.mikroe.com/ebooks/sites/37/2016/02/16204316/al-mundo-de-los-microcontroladores-chapter-03-fig3-9.gif" alt="al-mundo-de-los-microcontroladores-chapter-03-fig3-9" width="700" height="633" class="aligncenter size-full wp-image-147"></div>

## REGISTROS DE PROPÓSITO GENERAL
<p>Los registros de propósito general se utilizan para almacenar los datos temporales y los resultados creados durante el funcionamiento. Por ejemplo, si el programa realiza el conteo (de los productos en una cadena de montaje), es necesario tener un registro que representa lo que en la vida cotidiana llamamos “suma”. Como el microcontrolador no es nada creativo, es necesario especificar la dirección de un registro de propósito general y asignarle esa función. Se debe crear un programa simple para incrementar el valor de este registro por 1, después de que cada producto haya pasado por el sensor.</p>
<p>Ahora el microcontrolador puede ejecutar el programa ya que sabe qué es y dónde está la suma que se va a incrementar. De manera similar, a cada variable de programa se le debe pre-asignar alguno de los registros de propósito general.</p>

## Mas información
<p>Para saber mas informacion del PIC te dejo los siguientes enlaces:</p>

* [Caracteristicas basicas del PIC16F887 (Español)](http://learn.mikroe.com/ebooks/microcontroladorespicc/chapter/caracteristicas-basicas-del-pic16f887/)

* [Manual completo del PIC16f887 (Ingles)](http://ww1.microchip.com/downloads/en/DeviceDoc/41291D.pdf)


## Sobre el proyecto
Este proyecto lo inicie para poder ayudar a las personas a utilizar el PIC16f887 ya que no hay mucha informacion en internet
y mucho menos en español, espero les sea de ayuda, si tienen alguna duda o sugerencia pueden contactarme a mi cuenta de[Telegram](http://telegram.me/JackCloudman).

