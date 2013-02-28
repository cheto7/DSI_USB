<%-- 
    Document   : content-consulta
    Created on : Feb 28, 2013, 4:27:23 PM
    Author     : cheto
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<fieldset>
    <legend>Consulta</legend> 

    <logic:notPresent name="ConSol">
        <center>
            <label> La consulta no devolvio resultados.</label>
        </center>
    </logic:notPresent>

    <logic:present name="ConSol">

        <logic:empty name="ConSol">
            <center>
                <label> La consulta no devolvio resultados con las caracteristicas pedidas.</label>
            </center>
        </logic:empty>
        <br>

        <logic:notEmpty name="ConSol">
            <table class="table table-hover">
                <tbody>
                    
                <logic:iterate name="ConSol" id="sol">
                    <tr>
                    <logic:iterate name="sol" id="str">
                    
                <th><center><bean:write name="str" property="value"></bean:write></center></th>
                
                    </logic:iterate>
                    </tr>
                </logic:iterate>
                
                </tbody>
            </table>
        </logic:notEmpty>
    </logic:present>
</fieldset>
