<%-- 
    Document   : navBarSupervisor
    Created on : 22/03/2013, 11:54:23 AM
    Author     : Azocar
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<script src="assets/js/jquery-ui.js"></script>

<script>
    $(function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            active: 2
        });
    });
</script>

<div id="datos_persona" style="margin-bottom:20px;">
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
    </p>
</div>

<ul id="navbar">
    <li>
        <html:form action = "/FormularioEditarAdmin" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Editar Información </html:submit>
        </html:form> 
    </li>

    <li>
        <html:form action="/Ir_pag_pedido" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:hidden name="autenticado" property="password"/>
            <html:submit style="padding:10px 20px 40px 20px"> Realizar Solicitud </html:submit>
        </html:form>
    </li>

    <li>
        <html:form action="/ListarPedido" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Solicitudes Anteriores</html:submit>
        </html:form> 
    </li>

    <li>
        <html:form action="/CerrarSesion" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Cerrar Sesión</html:submit>
        </html:form> 
    </li>

    <div id="accordion">
        <h3>Supervisar</h3>
        <div>             

            <li>
                <html:form action="/ColeccionUsuarios" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Usuarios</html:submit>
                </html:form>
            </li> 

            <%--<li>
                <html:form action="/ColeccionUsuarios" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Pedidos</html:submit>
                </html:form>
            </li> --%>
        </div>


</ul>

