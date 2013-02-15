<%-- 
    Document   : noticias.jsp
    Created on : 24/10/2012, 05:37:49 PM
    Author     : Alfred
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<logic:present name="mensaje">
    <logic:notEmpty name="mensaje">
        <center>
            <label style="color:red">Error: <bean:write name="mensaje" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<logic:present name="mensajeRegistrado">
    <logic:notEmpty name="mensajeRegistrado">
        <center>
            <label style="color:blue"><bean:write name="mensajeRegistrado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>
    <logic:present name="solicitudProcesada">
        <center>
            <label style="color:blue">Solicitud procesada satisfactoriamente</label>
        </center>
    </logic:present>

<logic:present name="mensajePedidoAceptado">
    <logic:notEmpty name="mensajePedidoAceptado">
        <center>
            <label style="color:blue"><bean:write name="mensajePedidoAceptado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<logic:present name="mensajePedidoRechazado">
    <logic:notEmpty name="mensajePedidoRechazado">
        <center>
            <label style="color:orange"><bean:write name="mensajePedidoRechazado" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<logic:present name="mensajeUsuarioEditado">
    <logic:notEmpty name="mensajeUsuarioEditado">
        <center>
            <label style="color:blue"><bean:write name="mensajeUsuarioEditado" property="mensaje"/></label>
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

    <legend>Noticias</legend> 

    <logic:notPresent name="informacion">
        <label>
            <center> No hay noticias que mostrar.</center>
        </label>
    </logic:notPresent>

    <logic:present name="informacion">

        <logic:empty name="informacion">
            <label>
                <center> No hay noticias que mostrar.</center>
            </label>
        </logic:empty>

        <logic:iterate name="informacion" id="Noticia">

            <h1>
                <p style="float:left; font-size: 15px;"> <bean:write name="Noticia" property="titulo"></bean:write> </p>
                <bean:write name="Noticia" property="fechaNoticia"></bean:write>
            </h1>
            
            <bean:write name="Noticia" property="contenido" filter="|true|"></bean:write>
                <br><br><br>
        </logic:iterate>
    </logic:present>
</fieldset>
