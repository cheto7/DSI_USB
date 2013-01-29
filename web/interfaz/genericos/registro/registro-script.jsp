<%-- 
    Document   : registro-script.jsp
    Created on : Nov 3, 2012, 9:43:10 PM
    Author     : sibs
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


<script>
    $(function() {
        $("#usbid").attr('placeholder', 'Ingrese su USB-ID');
        $("#usbid").attr('title', 'Ingrese su USB-ID');
                
        $("#password").attr('placeholder', 'Contraseña');
        $("#password").attr('title', 'Ingrese su contraseña');  
    
        $("#email").attr('placeholder', 'Email');
        $("#email").attr('title', 'Ingrese su correo electrónico'); 
    
        $("#nombre").attr('placeholder', 'Nombre');
        $("#nombre").attr('title', 'Ingrese su primer nombre'); 
    
        $("#apellido").attr('placeholder', 'Apellido');
        $("#apellido").attr('title', 'Ingrese su primer apellido');
    
        $("#fechanac").attr('placeholder', 'Fecha de nacimiento');
        $("#fechanac").attr('title', 'Ingrese su fecha de nacimiento con la sintaxis del ejemplo');
    
        $("#tele").attr('placeholder', 'Número de teléfono');
        $("#tele").attr('title', 'Ingrese su número de teléfono');
    
        $("#dir").attr('title', 'Ingrese su dirección de residencia');
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
                confirm_password: {	required: true,	minlength: 5, equalTo: "#password"},
                email: { required: false, email: true }
            },
				
            messages: {
                password: {
                    required: "Por favor introduzca una contraseña",
                    minlength: "La contraseña debe tener mínimo 5 caracteres"
                },
                confirm_password: {
                    required: "Por favor introduzca una contraseña",
                    minlength: "La contraseña debe tener mínimo 5 caracteres",
                    equalTo: "Las contraseñas no coinciden"
                },
                email: { 
                    required: "Por favor introduzca un correo electrónico", 
                    email: "la sintaxis de correo debe ser correcta" }
				
            } 
			 
        });
        var tooltips = $( "[title]" ).tooltip();
        tooltips.tooltip( "open" );
    });
</script>
