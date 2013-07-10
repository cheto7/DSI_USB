<%-- 
    Document   : conf-mensaje
    Created on : Jul 9, 2013, 10:59:34 AM
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
        
        <html:form action="/ModificarMensaje" onsubmit="return (this)">
                        <html:hidden name="mensaje" property="id"/>
                        <html:textarea name="mensaje" property="mensaje"></html:textarea>
                        <html:submit styleClass="btn btn-danger"> Modificar </html:submit>
                    </html:form>
        
    </logic:present>
                        
