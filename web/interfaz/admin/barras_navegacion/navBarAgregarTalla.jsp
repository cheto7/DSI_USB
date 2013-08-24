<%-- 
    Document   : navBarAgregarTala
    Created on : 15/07/2013, 09:41:26 PM
    Author     : ivan
--%>

<%-- 
    Document   : navBarDatosEquipo
    Created on : 14/07/2013, 11:37:17 PM
    Author     : ivan
--%>

<%-- 
    Document   : navBarListaEquipos
    Created on : 13/02/2013, 02:20:07 PM
    Author     : ivan
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
        <html:form action = "/VerDatosEquipo" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:hidden name="equipo" property="serial"/>
            <html:hidden name="equipo" property="imagen"/>
            <html:hidden name="equipo" property="tipo"/>
            <html:hidden name="equipo" property="nombre_vista"/>
            <html:hidden name="equipo" property="cantidad"/>
            <html:hidden name="equipo" property="evaluacion"/>
            <html:hidden name="equipo" property="funcionalidad"/>
            <html:hidden name="equipo" property="sector"/>
            <html:hidden name="equipo" property="vida_util"/>
            <html:hidden name="equipo" property="tipo_talla"/>
            <html:hidden name="equipo" property="norma"/>            
            <html:submit style="padding:10px 20px 40px 20px"> Volver </html:submit>
        </html:form> 
    </li>
    <li>
        <html:form action="/CerrarSesion" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Cerrar Sesión</html:submit>
        </html:form> 
    </li>
</ul>
