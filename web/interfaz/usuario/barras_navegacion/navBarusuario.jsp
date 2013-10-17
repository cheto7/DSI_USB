<%-- 
    Document   : navBarusuario
    Created on : Nov 4, 2012, 3:04:59 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<%@ page contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

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

<div id="datos_persona" style="margin-bottom:20px;">
    <p>
        <bean:write name="autenticado" property="nombre"></bean:write> 
        <bean:write name="autenticado" property="apellido"></bean:write>
    </p>
</div>

<ul id="navbar">
    <%--<li>
        <html:form action = "/FormularioEditarAdmin" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Editar Información </html:submit>
        </html:form> 
    </li>--%>
    <li>
        <html:form action = "/VerInforPersonal" acceptCharset="ISO-8859-1" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:submit style="padding:10px 20px 40px 20px"> Datos Personales </html:submit>
        </html:form>
    </li>

    <li>
        <html:form action="/Ir_pag_pedido" onsubmit="return (this)">
            <html:hidden name="autenticado" property="usuario"/>
            <html:hidden name="autenticado" property="password"/>
            <html:submit style="padding:10px 20px 40px 20px"> Realizar Solicitud </html:submit>
        </html:form>
    </li>

    <li>
        <html:form action="/ListarPedido" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Solicitudes Anteriores</html:submit>
        </html:form> 
    </li>

    <li>
        <html:form action="/CerrarSesion" onsubmit="return (this)"> 
            <html:submit style="padding:10px 20px 40px 20px">Cerrar Sesión</html:submit>
        </html:form> 
    </li>

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
            <li>
                <html:form action="/CambiarMensaje" onsubmit="return (this)">
                    <html:submit style="padding:0px 10px 30px 0px">Mensajes</html:submit>
                </html:form>
            </li> 
        </div>


</ul>

