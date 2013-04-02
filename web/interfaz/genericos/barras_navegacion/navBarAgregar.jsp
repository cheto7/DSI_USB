<%-- 
    Document   : navBarAgregar
    Created on : Apr 1, 2013, 3:18:25 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div id="datos_persona" style="margin-bottom:20px; display:none">
    <a href="#" style="margin-left:10px; color:#F30; text-decoration:none; display:block"> Salir </a>
</div>

<ul id="navbar">              
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
    </p> 
    
    <li>
        <html:form action="/Ir_pag_pedido_factura" onsubmit="return (this)">
            <html:hidden name="Factura" property="numero_factura"/>
            <html:submit style="padding:10px 20px 40px 20px"> Agregar Equipo </html:submit>
        </html:form>
    </li>
    
    <li>
        <html:form action="/ListarFacturas" onsubmit="return (this)">
            <html:submit style="padding:10px 20px 40px 20px"> Volver </html:submit>
        </html:form>
    </li>
</ul>
