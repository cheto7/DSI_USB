<%-- 
    Document   : conf-eliminar
    Created on : Nov 12, 2012, 10:01:38 AM
    Author     : smaf
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<fieldset>
    <center>
        <br><br><br>
        <label>¿Desea eliminar la noticia
            '<bean:write name="noticia" property="titulo"/>'
            ?
        </label>
        <br>
        <html:form action="/EliminarNoticia" onsubmit="return (this)">
            <html:hidden name="noticia" property="titulo"/>
            <html:hidden name="noticia" property="usuario"/>
            <html:hidden name="noticia" property="contenido"/>
            <html:submit styleClass="btn btn-primary">
                Si, deseo eliminar
            </html:submit>
        </html:form>
    </center>
</fieldset>
