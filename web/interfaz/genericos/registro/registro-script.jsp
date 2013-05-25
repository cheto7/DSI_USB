<%-- 
    Document   : registro-script.jsp
    Created on : Nov 3, 2012, 9:43:10 PM
    Author     : sibs

    Modified on : Mar 29, 2012
    Author     : Karen
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Dirección de Seguridad Integral</title>
<script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<script>
    $(function($){
        $.datepicker.regional['es'] = {
            closeText: 'Cerrar',
            prevText: 'Anterior',
            nextText: 'Siguiente',
            monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
            dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
            dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
            weekHeader: 'Sm',
            dateFormat: 'dd/mm/y',
            firstDay: 1,
            isRTL: false,
            showMonthAfterYear: false,
            yearRange: '-60:+0',
            yearSuffix: ''
        };
        $.datepicker.setDefaults($.datepicker.regional['es']);
    });      
      
    $(document).ready(function(){
        $("#fecha").datepicker({
            changeMonth: true,
            changeYear: true
        });

    });
</script>

<script>
    $(function() {
        $("#usbid").attr('placeholder', 'Ingrese su USB-ID');
        $("#usbid").attr('title', 'Ingrese su USB-ID');
                
        $("#password").attr('placeholder', 'Contraseña');
        $("#password").attr('title', 'Ingrese su contraseña');  
    
        $("#email").attr('placeholder', 'Correo Electrónico');
        $("#email").attr('title', 'Ingrese su correo electrónico'); 
    
        $("#nombre").attr('placeholder', 'Nombres');
        $("#nombre").attr('title', 'Ingrese sus nombres'); 
    
        $("#apellido").attr('placeholder', 'Apellidos');
        $("#apellido").attr('title', 'Ingrese sus apellidos');
        
        $("#cedula").attr('placeholder', 'Cedula');
        $("#cedula").attr('title', 'Ingrese su cedula de identidad');
    
        $("#fecha").attr('placeholder', 'Fecha de ingreso');
        $("#fecha").attr('title', 'Seleccione su fecha de ingreso');
    
        $("#tele").attr('placeholder', 'Número de teléfono');
        $("#tele").attr('title', 'Ingrese su número de teléfono');
    
        $("#unidadads").attr('placeholder', 'Unidad Adscripción');
        $("#unidadads").attr('title', 'Ingrese la unidad de adscripcion donde labora');
        
        $("#cedula").attr('placeholder', 'Cédula');
        $("#cedula").attr('title', 'Ingrese su cedula');
    });
    
</script>


<script type="text/javascript" src="assets/js/jquery.validate.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/jquery-ui.css" />

<style>
    fieldset div {
        margin-bottom: 2em;
    }
    fieldset .help {
        display: inline-block;
    }
    .ui-tooltip {
        width: 210px;
    }
</style>

<!--Script para la ayuda de llenado del formulario -->

<script>
    $(document).ready(function(){    
        $("#Form").validate({
            rules: {
                password: {required: true,minlength: 5},
                confirm_password: {	required: true,	minlength: 5, equalTo: "#password"}
       
            },
				
            messages: {
                password: {
                    required: "Por favor introduzca una contraseña",
                    minlength: "Contraseña mínima de 5 caracteres"
                },
                confirm_password: {
                    required: "Por favor introduzca una contraseña",
                    minlength: "Contraseña mínima de 5 caracteres",
                    equalTo: "Las contraseñas no coinciden"
                }

				
            } 
			 
        });
        var tooltips = $( "[title]" ).tooltip();
        tooltips.tooltip( "open" );
    });
</script>
