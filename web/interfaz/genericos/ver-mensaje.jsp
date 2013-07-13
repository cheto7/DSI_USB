<%-- 
    Document   : ver-mensaje
    Created on : Jul 10, 2013, 10:13:38 AM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<legend>Modificar Mensaje</legend>

<logic:notPresent name="mensaje">
        <center>
            <label> No hay mensaje que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="mensaje">

        <br>
        <center>
            <label> <bean:write name="mensaje" property="mensaje"/></label>
        </center>
        <br>
        <center>
        <html:form action="/FormularioEditarMensaje" onsubmit="return (this)">
                        <html:hidden name="mensaje" property="id"/>
                        <html:submit styleClass="btn btn-success"> Editar </html:submit>
                    </html:form>
        </center>
    </logic:present>
                        
