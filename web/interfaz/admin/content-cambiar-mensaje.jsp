<%-- 
    Document   : content-lista-factura
    Created on : Mar 20, 2013, 7:49:41 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 


<fieldset>
    <legend>Lista de Mensajes</legend> 
    
    <logic:notPresent name="mensajes">
        <center>
            <label> No hay mensajes que mostrar.</label>
        </center>
    </logic:notPresent>

    <logic:present name="mensajes">

        <logic:empty name="mensajes">
            <center>
                <label> No hay mensajes que mostrar.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="mensajes">
            <table class="table table-hover">
                <tbody>
                    <tr>
                        <th><center>ID</center></th>
                        <th><center>Ver</center></th>
                        <th><center>Modificar</center></th>
                </tr>

                <logic:iterate name="mensajes" id="mensaje">

                    <tr>
                        <td>
                            <h1>
                                <p> <bean:write name="mensaje" property="id"></bean:write></p>
                            </h1>
                        </td>

                        <td>
                    <center>
                        <html:form action = "/FormularioEditarFactura" onsubmit = "return (this)">
                            <html:hidden name="mensaje" property="id"/>
                            <html:hidden name="mensaje" property="mensaje"/>
                            <html:submit styleClass="btn btn-success"> Ver </html:submit>
                        </html:form> 
                    </center>
                    </td>
                    
                        
                        <td>
                    <center>
                        <html:form action = "/FormularioEditarFactura" onsubmit = "return (this)">
                            <html:hidden name="mensaje" property="id"/>
                            <html:submit styleClass="btn btn-success"> Editar </html:submit>
                        </html:form> 
                    </center>
                    </td>
                    
                    </tr>

                </logic:iterate>
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>