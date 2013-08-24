<%-- 
    Document   : ver-factura
    Created on : 23/08/2013, 11:53:29 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<legend>Confirmación de factura</legend>

<logic:empty name="equipos">
    <center>
        <label style="color:red">Usted no ha ingresado ningún equipo de protección a la factura.</label>
    </center>    
</logic:empty>
<logic:notEmpty name="equipos">
    <h1>Pedido realizado a:</h1>
    <h5><bean:write name="proveedor" property="value"/></h5>

    <table class="table table-hover" width="100%">

        <tbody>
            <tr>
                <th>Equipo</th>
                <th><center>Imagen</center></th>
                <th><center>Cantidad</center></th>
                <th><center>Talla</center></th>
            </tr>

            <logic:iterate name="equipos" id="equipo">
                <tr>
                    <td width="60%"> <bean:write name="equipo" property="nombre_vista" /> </td>
                    
                    <td>
                        <center>
                            <img width="70px" src="assets/materiales/<bean:write name="equipo" property="nombre_vista"/>.png" />
                        </center>
                    </td>

                    <td>
                        <center>
                            <bean:write name="equipo" property="cantidad" />
                        </center>
                    </td>
                    <td>
                        <center>
                            <bean:write name="equipo" property="talla" />
                        </center>
                    </td>          
                </tr>
            </logic:iterate>
        </tbody>
    </table>
</logic:notEmpty>