<%-- 
    Document   : navBarAdmin
    Created on : 07/05/2013, 03:41:42 PM
    Author     : ivan
--%>
<%-- 
    Document   : navBarusuario
    Created on : Nov 4, 2012, 3:04:59 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="assets/css/jquery-ui.css" />
<script src="assets/js/jquery-ui.js"></script>

<script>
    $(function() {
        $( "#accordion" ).accordion({
            collapsible: true,
            active: 2,
            horizontal: true
        });
    });
</script>
<ul id="navbar">
    <div id="accordion">
        <h3>Administración</h3>
        <div>

            <li>
                <html:form action="/ListadosGenerales" onsubmit="return (this)"> 
                    <html:submit style="padding:0px 10px 30px 0px">Consolidados</html:submit>
                </html:form>
            </li>    
            <li>
                <html:form action="/periodoEntrega" onsubmit="return (this)"> 
                    <html:submit style="padding:0px 10px 30px 0px">Entregas</html:submit>
                </html:form>
            </li>    

            <li>
                <html:form action="/ColeccionUsuarios" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Usuarios</html:submit>
                </html:form>
            </li>

            <li>
                <html:form action="/ListarEquipo" onsubmit="return (this)">
                    <html:submit style="padding:0px 10px 30px 0px">Equipos</html:submit>
                </html:form>
            </li>

            <li>
                <html:form action="/ListarNoticia" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Noticias</html:submit>
                </html:form>
            </li>
            <li>
                <html:form action="/ListarProveedores" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Proveedores</html:submit>
                </html:form>
            </li>
            <li>
                <html:form action="/ListarFacturas" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Facturas</html:submit>
                </html:form>
            </li>
            <%--BORRAR Solicitudes--%>
            <%--<li>
                <html:form action="/ListarSolicitudes" onsubmit="return (this)">
                    <html:hidden name="autenticado" property="usuario"/>
                    <html:submit style="padding:0px 10px 30px 0px">Solicitudes</html:submit>
                </html:form>
            </li>--%>
            <li>
                <html:form action="/ListadoGeneral" onsubmit="return (this)">
                    <html:submit style="padding:0px 10px 30px 0px">Consultar</html:submit>
                </html:form>
            </li>
            <li>
                <html:form action="/ListarPeriodos" onsubmit="return (this)">
                    <html:submit style="padding:0px 10px 30px 0px">Períodos</html:submit>
                </html:form>
            </li>    
        </div>


</ul>