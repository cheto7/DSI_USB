<%-- 
    Document   : script-form-edit
    Created on : Nov 4, 2012, 3:16:06 AM
    Author     : sibs

    Modified on : Mar 29, 2012
    Author     : Karen
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Direcci�n de Seguridad Integral</title>
<script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
<script>
    $(function() {
        $("#password").attr('placeholder', 'Contrase�a');
        $("#password").attr('title', 'Ingrese su contrase�a');  
    
        $("#correo").attr('placeholder', 'Email');
        $("#correo").attr('title', 'Ingrese su correo electr�nico'); 
    
        $("#tele").attr('placeholder', 'N�mero de tel�fono');
        $("#tele").attr('title', 'Ingrese su n�mero de tel�fono');
    
        $("#unidadads").attr('placeholder', 'Unidad Adscripci�n');
        $("#unidadads").attr('title', 'Ingrese la unidad de adscripcion donde labora');
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
                password: {required: false,minlength: 5},
                confirm_password: {	required: false,minlength: 5, equalTo: "#password"}
       
            },
				
            messages: {
                password: {
                    required: "Por favor introduzca una contrase�a",
                    minlength: "La contrase�a debe tener m�nimo 5 caracteres"
                },
                confirm_password: {
                    required: "Por favor introduzca una contrase�a",
                    minlength: "La contrase�a debe tener m�nimo 5 caracteres",
                    equalTo: "Las contrase�as no coinciden"
                }

				
            } 
			 
        });
        var tooltips = $( "[title]" ).tooltip();
        tooltips.tooltip( "open" );
    });
</script>

