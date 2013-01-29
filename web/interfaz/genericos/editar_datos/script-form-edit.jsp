<%-- 
    Document   : script-form-edit
    Created on : Nov 4, 2012, 3:16:06 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Dirección de Seguridad Integral</title>
        <script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
        <script type="text/javascript" src="assets/js/jquery-ui.js"></script>
        <script>
            $(function() {
                $("#usbid").attr('placeholder', 'Ingrese su USB-ID');
                $("#usbid").attr('title', 'Ingrese su USB-ID');
                
                $("#contrasenia").attr('placeholder', 'Contraseña');
                $("#contrasenia").attr('title', 'Ingrese su contraseña');  
    
                $("#correo").attr('placeholder', 'Email');
                $("#correo").attr('title', 'Ingrese su correo electrónico'); 
    
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
            $(function() {
                var tooltips = $( "[title]" ).tooltip();
                tooltips.tooltip( "open" );
            });
        </script>
