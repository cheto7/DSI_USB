<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>

<html:html lang="true">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><bean:message key="welcome.title"/></title>
        <html:base/>
    </head>
    <body style="background-color: white">
        
        <logic:notPresent name="org.apache.struts.action.MESSAGE" scope="application">
            <div  style="color: red">
                ERROR:  Application resources not loaded -- check servlet container
                logs for error messages.
            </div>
        </logic:notPresent>
        
        <h1>Pagina Inicio</h1>
        <html:form action="/Login" onsubmit="return (this)">
            Login<html:text name="Usuario" property="usuario"></html:text><br/>
            Password<html:password name="Usuario" property="password"></html:password>
            <html:submit> Loguearse </html:submit>
        </html:form>
        <br>
        <html:link action="/Registro"> Registrarse </html:link>
        <br>
        <a href="interfaz_pag_principal.jsp">Ir a Pagina Principal</a>
    </body>
</html:html>
