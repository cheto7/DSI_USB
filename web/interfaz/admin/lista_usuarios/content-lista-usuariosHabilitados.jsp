<%-- 
    Document   : content-lista-usuarios
    Created on : 
    Author     : azocar
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Dirección de Seguridad Integral</title>
<script type="text/javascript" src="assets/js/jquery-1.8.2.js"></script>
<script type="text/javascript" src="assets/js/jquery-ui.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="assets/js/scroll-startstop.events.jquery.js"></script>
<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<link href="assets/bootstrap/css/bootstrap-responsive.css" rel="stylesheet" type="text/css"/>
<link href="assets/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<html>
    <head>
        <script>

            $(function() {
                $( "#tabs" ).tabs();

                var $elem = $('#content');

                $('#nav_up').fadeIn('slow');
                $('#nav_down').fadeIn('slow');  

                $(window).bind('scrollstart', function(){
                    $('#nav_up,#nav_down').stop().animate({'opacity':'0.2'});
                });

                $(window).bind('scrollstop', function(){
                    $('#nav_up,#nav_down').stop().animate({'opacity':'1'});
                });

                $('#nav_down').click(
                function (e) {
                    $('html, body').animate({scrollTop: $elem.height()}, 800);
                }
            );

                $('#nav_up').click(
                function (e) {
                    $('html, body').animate({scrollTop: '0px'}, 800);
                }
            );
            });
        </script>
    </head>
    <logic:present name="mensajeUsuarioEditado">
        <logic:notEmpty name="mensajeUsuarioEditado">
            <center>
                <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/>
                    <bean:write name="usuario" property="usuario"/> han sido modificados.
                </label>
            </center>
        </logic:notEmpty>
    </logic:present>

    <logic:present name="mensajeUsuarioNoEditado">
        <logic:notEmpty name="mensajeUsuarioNoEditado">
            <center>
                <label style="color:red">Error:<bean:write name="mensajeUsuarioNoEditado" property="mensaje"/></label>
            </center>
        </logic:notEmpty>
    </logic:present>

    <fieldset>
        <legend>Lista de Usuarios</legend>
    </fieldset>
    <div id="tabs">
        <ul>            
            <li><a href="#tabs-2">Habilitados</a></li>
        </ul>
        <div id="tabs-2">

            <logic:notPresent name="usuariosHab">
                <center>
                    <label> No hay usuarios habilitados que mostrar.</label>
                </center>
            </logic:notPresent>

            <logic:present name="usuariosHab">

                <logic:empty name="usuariosHab">
                    <center>
                        <label> No hay usuarios habilitados que mostrar.</label>
                    </center>
                </logic:empty>
                <br>

                <logic:notEmpty name="usuariosHab">
                    <table class="table table-hover">
                        <tbody>
                            <tr>
                                <th>USB-ID</th>
                                <th>Nombres y Apellidos</th>
                                
                        </tr>

                        <logic:iterate name="usuariosHab" id="usuario">

                            <tr>
                                <td >
                                    <h1>
                                        <p> <bean:write name="usuario" property="usuario"></bean:write></p>
                                    </h1>
                                </td>

                                <td>
                                    <p> <bean:write name="usuario" property="nombre"/>
                                    <bean:write name="usuario" property="apellido"/> </p>
                                </td>

                                <td>
                                    <html:form action = "/realizar_solicitudOtros" onsubmit = "return (this)">
                                        <html:hidden name="usuario" property="usuario"/>

                                        <html:submit styleClass="btn btn-success"> Realizar Solicitud </html:submit>
                                    </html:form> 
                                </td>

                                <td>
                                    <%-- html:form action = "/Deshabilitar" onsubmit = "return (this)"--%>
                                    <%--<html:form action = "/Formulario_OtorgarPermiso" onsubmit = "return (this)">
                                        <html:hidden name="usuario" property="usuario"/>
                                        <html:hidden name="autenticado" property="usuario"/>
                                        <html:submit styleClass="btn btn-warning"> Permisos </html:submit>
                                    </html:form>--%>
                                </td>
                            </tr>

                        </logic:iterate>
                        </tbody>
                    </table>
                </logic:notEmpty>
            </logic:present>
        </div>                

    </div>
</html>

