<%-- 
    Document   : interfaz-usuario
    Created on : Nov 4, 2012, 3:04:08 AM
    Author     : sibs
--%>

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

<fieldset>
    <legend>Noticias</legend> 

    <logic:notPresent name="informacion">
        <label>
            <center> No hay noticias que mostrar.</center>
        </label>
    </logic:notPresent>
    
    <logic:present name="solicitudProcesada">
        <center>
            <label style="color:blue">Solicitud procesada satisfactoriamente</label>
        </center>
    </logic:present>

    <logic:present name="informacion">

        <logic:empty name="informacion">
            <label>
            <center> No hay noticias que mostrar.</center>
            </label>
        </logic:empty>

        <logic:iterate name="informacion" id="Noticia">

            <h1>
                <p> <bean:write name="Noticia" property="titulo"></bean:write></p>
            </h1>
            <p> <bean:write name="Noticia" property="contenido"></bean:write> </p>

        </logic:iterate>
    </logic:present>
</fieldset>