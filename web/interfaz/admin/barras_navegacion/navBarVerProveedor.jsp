<%-- 
    Document   : navBarVerProveedor
    Created on : 02/02/2013, 08:08:52 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<ul id="navbar">              
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
        </p> 
    <li>
        <html:form action = "/VerProveedor" acceptCharset="ISO-8859-1" onsubmit="return (this)">
            <html:hidden name="proveedor" property="rif"/>
            <html:hidden name="proveedor" property="nombre"/>
            <html:hidden name="proveedor" property="email"/>
            <html:hidden name="proveedor" property="contacto"/>
            <html:hidden name="proveedor" property="telefono"/>
            <html:hidden name="proveedor" property="direccion"/>
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Volver </html:submit>
        </html:form> 
    </li>
    <li>
        <html:form action="/CerrarSesion" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Cerrar Sesión</html:submit>
        </html:form> 
    </li>
</ul>
