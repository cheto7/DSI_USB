<%-- 
    Document   : form-agregar-noticia-content
    Created on : Nov 10, 2012, 6:22:03 PM
    Author     : smaf
--%>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<script type="text/javascript" src="assets/js/jquery-te-1.0.5.min.js" charset="utf-8"></script>
<link type="text/css" rel="stylesheet" href="assets/css/jquery-te-Style.css" charset="utf-8" />

<legend>Editar una noticia</legend>

<logic:present name="noticiaNula">
    <logic:notEmpty name="noticiaNula">
        <center>
            <label style="color:red">Error: <bean:write name="noticiaNula" property="mensaje"/></label>
        </center>
    </logic:notEmpty>
</logic:present>

<html:form action = "/EditarNoticia" acceptCharset="ISO-8859-1" onsubmit = "return (this)">

    <label>Título</label>
    <html:text name="Noticia" property="titulo" styleClass="span5">
        <bean:write name="noticia" property="titulo"/>
    </html:text>
    <br>  
    <label>Contenido</label>
    <html:textarea  name="Noticia" property="contenido" rows="10" styleClass="span5">
        <bean:write name="noticia" property="contenido"/>
    </html:textarea>
    <script>
        $('textarea').jqte();
    </script>
    <br>
    <html:hidden name="noticia" property="tituloAnterior"/>
    <html:hidden name="noticia" property="usuario"/>
    <html:submit styleClass="btn btn-primary"> Editar </html:submit>
</html:form>