<%-- 
    Document   : navBarUsuarioHabilitado
    Created on : Nov 12, 2012, 3:36:03 PM
    Author     : smaf
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="datos_persona" style="margin-bottom:20px;">
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
        </p>
    </div>

    <ul id="navbar">   

    <li>
        <html:form action = "/VerInforPersonal" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Datos Personales </html:submit>
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
</ul>