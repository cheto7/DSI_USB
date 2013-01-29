<%-- 
    Document   : conf-solicitud
    Created on : Nov 4, 2012, 2:19:41 AM
    Author     : sibs
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<legend>Pagina confirmacion solicitud</legend>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<h1>Pedido realizado por:</h1> 
<h5><bean:write name="Pedido" property="usuario"/></h5>
<label> Usted debe confirmar su pedido para continuar. </label>
<label> En caso que haya olvidado algo, puede volver a modificar su pedido. </label>

<table class="table table-hover">
    <tbody>
        <tr>
            <th>Material</th>
            <th>Imagen</th>
            <th>Frecuencia de uso</th>
            <th>Cantidad</th>
        </tr>

        <tr>
            <logic:equal name="Pedido" property="cascoSeguridad" value="true">
            <tr>
                <td> Casco Seguridad </td> 
                <td> <img src="assets/materiales/c1.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f1" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c1" /> </center></td>
            </tr>
        </logic:equal>

        <logic:equal name="Pedido" property="cascoMotorizado" value="true">
            <tr>
                <td> Casco Motorizado </td>
                <td> <img src="assets/materiales/c3.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f2" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c2" /> </center></td>
            </tr>
        </logic:equal>

        <logic:equal name="Pedido" property="lentesSeguridad" value="true">
            <tr>
                <td > Lentes de seguridad </td>
                <td > <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f3" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c3" /> </center></td>
            </tr>    
        </logic:equal>

        <logic:equal name="Pedido" property="lentesCopa" value="true">
            <tr>
                <td> Lentes de copa </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f4" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c4" /> </center></td>
            </tr>    
        </logic:equal>

        <logic:equal name="Pedido" property="respiradorCaraCompleta" value="true">
            <tr>
                <td> Respirador cara completa </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f5" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c5" /> </center></td>
            </tr>                
        </logic:equal>

        <logic:equal name="Pedido" property="respiradorMedioRostro" value="true">
            <tr>
                <td> Respirador medio rostro </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f6" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c6" /> </center></td>
             </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="mascarilla" value="true">
            <tr>
                <td>  Mascarilla desechable </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f7" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c7" /> </center></td>
             </tr>            
        </logic:equal>

        <logic:equal name="Pedido" property="gorro" value="true">
            <tr>
                <td>  Gorro </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f8" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c8" /> </center></td>
             </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="caretaSoldar" value="true">
            <tr>
                <td>  Careta para soldar </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f9" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c9" /> </center></td>
            </tr>              
        </logic:equal>

        <logic:equal name="Pedido" property="gorraAzul" value="true">
            <tr>
                <td>  Gorra azul belmont </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f12" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c12" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="gorraGrisLogo" value="true">
            <tr>
                <td>  Gorra gris con logo USB </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f11" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c11" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="sombreroTipoPava" value="true">
            <tr>
                <td>  Sombrero tipo pava </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f10" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c10" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="botasTipoMilitar" value="true">
            <tr>
                <td>  Botas tipo militar </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f16" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c16" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="botasVaquetaCanaLarga" value="true">
            <tr>
                <td> Botas vaqueta caña larga </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f17" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c17" /> </center></td>
            </tr>           
        </logic:equal>

        <logic:equal name="Pedido" property="botasMontanera" value="true">
            <tr>
                <td> Montañera </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f18" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c18" /> </center></td>
            </tr>            
        </logic:equal>

        <logic:equal name="Pedido" property="botasDielectricas" value="true">
            <tr>
                <td> Botas Dieléctricas </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f13" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c13" /> </center></td>
            </tr>           
        </logic:equal>

        <logic:equal name="Pedido" property="botasPHierro" value="true">
            <tr>
                <td> Botas Punta de Hierro </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f14" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c14" /> </center></td>
            </tr>           
        </logic:equal>

        <logic:equal name="Pedido" property="botasCueroVulcanizTactica" value="true">
            <tr>
                <td> Botas cuero vulcanizadas </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f19" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c19" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesCarnaza" value="true">
            <tr>
                <td>  Guantes de carnaza </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f20" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c20" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesCarnazaSoldador" value="true">
            <tr>
                <td>  Guantes de carnaza para soldador </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f21" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c21" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="guantesAntiAcido18" value="true">
            <tr>
                <td>  Guantes antiacido 18" </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f22" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c22" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesLatex" value="true">
            <tr>
                <td>  Guantes de latex </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f23" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c23" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="guantesKevlar14" value="true">
            <tr>
                <td>  Guantes Kevlar 14" </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f24" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c24" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesKevlar20" value="true">
            <tr>
                <td>  Guantes Kevlar 20"</td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f25" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c25" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="guantesVaqueta" value="true">
            <tr>
                <td>  Guantes de vaqueta </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f26" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c26" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesNitrilo" value="true">
            <tr>
                <td> Guantes de nitrilo </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f27" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c27" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="guantesMotorizado" value="true">
            <tr>
                <td>  Guantes para motorizado </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f28" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c28" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesAntideslizantes" value="true">
            <tr>
                <td> Guantes antideslizantes </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f29" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c29" /> </center></td>
            </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="guantesNeopreno" value="true">
            <tr>
                <td>  Guantes de neopreno </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f30" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c30" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="filtroVaporOrganico" value="true">
            <tr>
                <td>  Filtro de vapor orgánico </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f31" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c31" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="filtroCloro" value="true">
            <tr>
                <td> Filtro de cloro </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f32" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c32" /> </center></td>
             </tr>             
        </logic:equal>

        <logic:equal name="Pedido" property="filtroMercurio" value="true">
            <tr>
                <td> Filtro de mercurio </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f33" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c33" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="arnesSeguridad" value="true">
            <tr>
                <td> Arnes de seguridad </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f34" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c34" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="delantalCocinero" value="true">
            <tr>
                <td> Delantal Cocinero </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f35" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c35" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="delantalSoldadura" value="true">
            <tr>
                <td> Delantal para soldadura </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f36" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c36" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="delantalNeopreno" value="true">
            <tr>
                <td> Delantal Neopreno </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f37" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c37" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="delantalPVC" value="true">
            <tr>
                <td> Delantal PVC </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f38" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c38" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="calzadoAntideslizante" value="true">
            <tr>
                <td> Calzado antideslizante </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f39" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c39" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chaquetaBombero" value="true">
            <tr>
                <td> Chaqueta bombero </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f42" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c42" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="pantalonTipoBombero" value="true">
            <tr>
                <td> Pantalón tipo bombero </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f41" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c41" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="pantalonBomberoRescateAzul" value="true">
            <tr>
                <td> Pantalón tipo rescate azul </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f40" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c40" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="uniformeTipoMilitar" value="true">
            <tr>
                <td> Uniforme tipo militar </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f43" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c43" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="botasCombateIncendio" value="true">
            <tr>
                <td> Botas combate contra incendios </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f44" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c44" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="guantesCombateIncendio" value="true">
            <tr>
                <td> Guantes combate incendios </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f45" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c45" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="impermeableMotorizado" value="true">
            <tr>
                <td> Impermeable para motorizado </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f46" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c46" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bragaGrisDobleCostura" value="true">
            <tr>
                <td> Braga gris doble costura </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f47" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c47" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bragaNegraDobleCostura" value="true">
            <tr>
                <td> Braga negra doble costura </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f48" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c48" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bataAzul" value="true">
            <tr>
                <td> Bata azul </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f49" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c49" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bataGris" value="true">
            <tr>
                <td> Bata gris </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f50" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c50" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bataNegra" value="true">
            <tr>
                <td> Bata negra </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f51" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c51" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="bataBlanca" value="true">
            <tr>
                <td> Bata blanca </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f52" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c52" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chemisseAzul" value="true">
            <tr>
                <td> Chemisse azul </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f53" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c53" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chemisseBeige" value="true">
            <tr>
                <td> Chemisse beige </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f54" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c54" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chemisseVerde" value="true">
            <tr>
                <td> Chemisse verde </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f55" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c55" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chemisseBlanca" value="true">
            <tr>
                <td> Chemisse blanca </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f56" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c56" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chemisseGris" value="true">
            <tr>
                <td> Chemisse gris </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f57" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c57" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="blazerAzul" value="true">
            <tr>
                <td> Blazer azul </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f58" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c58" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="blueJeans" value="true">
            <tr>
                <td> Blue jeans </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f59" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c59" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="camisaBlanca" value="true">
            <tr>
                <td> Camisa blanca </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f60" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c60" /> </center></td>
            </tr>         
        </logic:equal>
            
        <logic:equal name="Pedido" property="camisaAzul" value="true">
            <tr>
                <td> Camisa azul </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f61" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c61" /> </center></td>
            </tr>         
        </logic:equal>
            
        <logic:equal name="Pedido" property="camisaBeige" value="true">
            <tr>
                <td> Camisa beige </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f62" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c62" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="paraguas" value="true">
            <tr>
                <td> Paraguas </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f63" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c63" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="pantallaAtalaje" value="true">
            <tr>
                <td> Pantalla con atalaje </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f64" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c64" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="maletin" value="true">
            <tr>
                <td> Maletín </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f65" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c65" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="camisaVestir" value="true">
            <tr>
                <td> Camisa de vestir </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f66" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c66" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="pantalonVestir" value="true">
            <tr>
                <td> Pantalón de vestir </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f67" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c67" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="zapatosVestir" value="true">
            <tr>
                <td> Zapatos de vestir </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f68" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c68" /> </center></td>
            </tr>         
        </logic:equal>

        <logic:equal name="Pedido" property="chaquetaVestir" value="true">
            <tr>
                <td> Chaqueta </td>
                <td> <img src="assets/materiales/img.png" /> </td>
                <td><center> <bean:write name="Pedido" property="f69" /> </center></td>
                <td><center> <bean:write name="Pedido" property="c69" /> </center></td>
            </tr>         
        </logic:equal>


        <html:form method="POST" action="/Almacenar_pedido?method=save" onsubmit="return (this)">
            <html:hidden name="Pedido" property="usuario"/>
            <html:hidden name="Pedido" property="cascoSeguridad"/>
            <html:hidden name="Pedido" property="cascoMotorizado"/>
            <html:hidden name="Pedido" property="lentesSeguridad"/>
            <html:hidden name="Pedido" property="lentesCopa"/>
            <html:hidden name="Pedido" property="respiradorCaraCompleta"/>
            <html:hidden name="Pedido" property="respiradorMedioRostro"/>
            <html:hidden name="Pedido" property="mascarilla"/>
            <html:hidden name="Pedido" property="gorro"/>
            <html:hidden name="Pedido" property="caretaSoldar"/>
            <html:hidden name="Pedido" property="gorraAzul"/>
            <html:hidden name="Pedido" property="gorraGrisLogo"/>
            <html:hidden name="Pedido" property="sombreroTipoPava"/>
            <html:hidden name="Pedido" property="botasTipoMilitar"/>
            <html:hidden name="Pedido" property="botasVaquetaCanaLarga"/>
            <html:hidden name="Pedido" property="botasMontanera"/>
            <html:hidden name="Pedido" property="botasDielectricas"/>
            <html:hidden name="Pedido" property="botasPHierro"/>
            <html:hidden name="Pedido" property="botasCueroVulcanizTactica"/>
            <html:hidden name="Pedido" property="guantesCarnaza"/>
            <html:hidden name="Pedido" property="guantesCarnazaSoldador"/>
            <html:hidden name="Pedido" property="guantesAntiAcido18"/>
            <html:hidden name="Pedido" property="guantesLatex"/>
            <html:hidden name="Pedido" property="guantesKevlar14"/>
            <html:hidden name="Pedido" property="guantesKevlar20"/>
            <html:hidden name="Pedido" property="guantesVaqueta"/>
            <html:hidden name="Pedido" property="guantesNitrilo"/>
            <html:hidden name="Pedido" property="guantesMotorizado"/>
            <html:hidden name="Pedido" property="guantesAntideslizantes"/>
            <html:hidden name="Pedido" property="guantesNeopreno"/>
            <html:hidden name="Pedido" property="filtroVaporOrganico"/>
            <html:hidden name="Pedido" property="filtroCloro"/>
            <html:hidden name="Pedido" property="filtroMercurio"/>
            <html:hidden name="Pedido" property="arnesSeguridad"/>
            <html:hidden name="Pedido" property="delantalCocinero"/>
            <html:hidden name="Pedido" property="delantalSoldadura"/>
            <html:hidden name="Pedido" property="delantalNeopreno"/>
            <html:hidden name="Pedido" property="delantalPVC"/>
            <html:hidden name="Pedido" property="calzadoAntideslizante"/>
            <html:hidden name="Pedido" property="chaquetaBombero"/>
            <html:hidden name="Pedido" property="pantalonTipoBombero"/>
            <html:hidden name="Pedido" property="pantalonBomberoRescateAzul"/>
            <html:hidden name="Pedido" property="uniformeTipoMilitar"/>
            <html:hidden name="Pedido" property="botasCombateIncendio"/>
            <html:hidden name="Pedido" property="guantesCombateIncendio"/>
            <html:hidden name="Pedido" property="impermeableMotorizado"/>
            <html:hidden name="Pedido" property="bragaGrisDobleCostura"/>
            <html:hidden name="Pedido" property="bragaNegraDobleCostura"/>
            <html:hidden name="Pedido" property="bataAzul"/>
            <html:hidden name="Pedido" property="bataGris"/>
            <html:hidden name="Pedido" property="bataNegra"/>
            <html:hidden name="Pedido" property="bataBlanca"/>
            <html:hidden name="Pedido" property="chemisseAzul"/>
            <html:hidden name="Pedido" property="chemisseBeige"/>
            <html:hidden name="Pedido" property="chemisseVerde"/>
            <html:hidden name="Pedido" property="chemisseBlanca"/>
            <html:hidden name="Pedido" property="chemisseGris"/>
            <html:hidden name="Pedido" property="blazerAzul"/>
            <html:hidden name="Pedido" property="blueJeans"/>
            <html:hidden name="Pedido" property="camisaBlanca"/>
            <html:hidden name="Pedido" property="camisaAzul"/>
            <html:hidden name="Pedido" property="camisaBeige"/>
            <html:hidden name="Pedido" property="paraguas"/>
            <html:hidden name="Pedido" property="pantallaAtalaje"/>
            <html:hidden name="Pedido" property="maletin"/>
            <html:hidden name="Pedido" property="camisaVestir"/>
            <html:hidden name="Pedido" property="pantalonVestir"/>
            <html:hidden name="Pedido" property="zapatosVestir"/>
            <html:hidden name="Pedido" property="chaquetaVestir"/>
            <html:hidden name="Pedido" property="f1"/>
            <html:hidden name="Pedido" property="c1"/>
            <html:hidden name="Pedido" property="f2"/>
            <html:hidden name="Pedido" property="c2"/>
            <html:hidden name="Pedido" property="f3"/>
            <html:hidden name="Pedido" property="c3"/>
            <html:hidden name="Pedido" property="f4"/>
            <html:hidden name="Pedido" property="c4"/>
            <html:hidden name="Pedido" property="f5"/>
            <html:hidden name="Pedido" property="c5"/>
            <html:hidden name="Pedido" property="f6"/>
            <html:hidden name="Pedido" property="c6"/>
            <html:hidden name="Pedido" property="f7"/>
            <html:hidden name="Pedido" property="c7"/>
            <html:hidden name="Pedido" property="f8"/>
            <html:hidden name="Pedido" property="c8"/>
            <html:hidden name="Pedido" property="f9"/>
            <html:hidden name="Pedido" property="c9"/>
            <html:hidden name="Pedido" property="f10"/>
            <html:hidden name="Pedido" property="c10"/>
            <html:hidden name="Pedido" property="f11"/>
            <html:hidden name="Pedido" property="c11"/>
            <html:hidden name="Pedido" property="f12"/>
            <html:hidden name="Pedido" property="c12"/>
            <html:hidden name="Pedido" property="f13"/>
            <html:hidden name="Pedido" property="c13"/>
            <html:hidden name="Pedido" property="f14"/>
            <html:hidden name="Pedido" property="c14"/>
            <html:hidden name="Pedido" property="f15"/>
            <html:hidden name="Pedido" property="c15"/>
            <html:hidden name="Pedido" property="f16"/>
            <html:hidden name="Pedido" property="c16"/>
            <html:hidden name="Pedido" property="f17"/>
            <html:hidden name="Pedido" property="c17"/>
            <html:hidden name="Pedido" property="f18"/>
            <html:hidden name="Pedido" property="c18"/>
            <html:hidden name="Pedido" property="f19"/>
            <html:hidden name="Pedido" property="c19"/>
            <html:hidden name="Pedido" property="f20"/>
            <html:hidden name="Pedido" property="c20"/>
            <html:hidden name="Pedido" property="f21"/>
            <html:hidden name="Pedido" property="c21"/>
            <html:hidden name="Pedido" property="f22"/>
            <html:hidden name="Pedido" property="c22"/>
            <html:hidden name="Pedido" property="f23"/>
            <html:hidden name="Pedido" property="c23"/>
            <html:hidden name="Pedido" property="f24"/>
            <html:hidden name="Pedido" property="c24"/>
            <html:hidden name="Pedido" property="f25"/>
            <html:hidden name="Pedido" property="c25"/>
            <html:hidden name="Pedido" property="f26"/>
            <html:hidden name="Pedido" property="c26"/>
            <html:hidden name="Pedido" property="f27"/>
            <html:hidden name="Pedido" property="c27"/>
            <html:hidden name="Pedido" property="f28"/>
            <html:hidden name="Pedido" property="c28"/>
            <html:hidden name="Pedido" property="f29"/>
            <html:hidden name="Pedido" property="c29"/>
            <html:hidden name="Pedido" property="f30"/>
            <html:hidden name="Pedido" property="c30"/>
            <html:hidden name="Pedido" property="f31"/>
            <html:hidden name="Pedido" property="c31"/>
            <html:hidden name="Pedido" property="f32"/>
            <html:hidden name="Pedido" property="c32"/>
            <html:hidden name="Pedido" property="f33"/>
            <html:hidden name="Pedido" property="c33"/>
            <html:hidden name="Pedido" property="f34"/>
            <html:hidden name="Pedido" property="c34"/>
            <html:hidden name="Pedido" property="f35"/>
            <html:hidden name="Pedido" property="c35"/>
            <html:hidden name="Pedido" property="f36"/>
            <html:hidden name="Pedido" property="c36"/>
            <html:hidden name="Pedido" property="f37"/>
            <html:hidden name="Pedido" property="c37"/>
            <html:hidden name="Pedido" property="f38"/>
            <html:hidden name="Pedido" property="c38"/>
            <html:hidden name="Pedido" property="f39"/>
            <html:hidden name="Pedido" property="c39"/>
            <html:hidden name="Pedido" property="f40"/>
            <html:hidden name="Pedido" property="c40"/>
            <html:hidden name="Pedido" property="f41"/>
            <html:hidden name="Pedido" property="c41"/>
            <html:hidden name="Pedido" property="f42"/>
            <html:hidden name="Pedido" property="c42"/>
            <html:hidden name="Pedido" property="f43"/>
            <html:hidden name="Pedido" property="c43"/>
            <html:hidden name="Pedido" property="f44"/>
            <html:hidden name="Pedido" property="c44"/>
            <html:hidden name="Pedido" property="f45"/>
            <html:hidden name="Pedido" property="c45"/>
            <html:hidden name="Pedido" property="f46"/>
            <html:hidden name="Pedido" property="c46"/>
            <html:hidden name="Pedido" property="f47"/>
            <html:hidden name="Pedido" property="c47"/>
            <html:hidden name="Pedido" property="f48"/>
            <html:hidden name="Pedido" property="c48"/>
            <html:hidden name="Pedido" property="f49"/>
            <html:hidden name="Pedido" property="c49"/>
            <html:hidden name="Pedido" property="f50"/>
            <html:hidden name="Pedido" property="c50"/>
            <html:hidden name="Pedido" property="f51"/>
            <html:hidden name="Pedido" property="c51"/>
            <html:hidden name="Pedido" property="f52"/>
            <html:hidden name="Pedido" property="c52"/>
            <html:hidden name="Pedido" property="f53"/>
            <html:hidden name="Pedido" property="c53"/>
            <html:hidden name="Pedido" property="f54"/>
            <html:hidden name="Pedido" property="c54"/>
            <html:hidden name="Pedido" property="f55"/>
            <html:hidden name="Pedido" property="c55"/>
            <html:hidden name="Pedido" property="f56"/>
            <html:hidden name="Pedido" property="c56"/>
            <html:hidden name="Pedido" property="f57"/>
            <html:hidden name="Pedido" property="c57"/>
            <html:hidden name="Pedido" property="f58"/>
            <html:hidden name="Pedido" property="c58"/>
            <html:hidden name="Pedido" property="f59"/>
            <html:hidden name="Pedido" property="c59"/>
            <html:hidden name="Pedido" property="f60"/>
            <html:hidden name="Pedido" property="c60"/>
            <html:hidden name="Pedido" property="f61"/>
            <html:hidden name="Pedido" property="c61"/>
            <html:hidden name="Pedido" property="f62"/>
            <html:hidden name="Pedido" property="c62"/>
            <html:hidden name="Pedido" property="f63"/>
            <html:hidden name="Pedido" property="c63"/>
            <html:hidden name="Pedido" property="f64"/>
            <html:hidden name="Pedido" property="c64"/>
            <html:hidden name="Pedido" property="f65"/>
            <html:hidden name="Pedido" property="c65"/>
            <html:hidden name="Pedido" property="f66"/>
            <html:hidden name="Pedido" property="c66"/>
            <html:hidden name="Pedido" property="f67"/>
            <html:hidden name="Pedido" property="c67"/>
            <html:hidden name="Pedido" property="f68"/>
            <html:hidden name="Pedido" property="c68"/>
            <html:hidden name="Pedido" property="f69"/>
            <html:hidden name="Pedido" property="c69"/>

        </tbody>
    </table>

    <br>
    <center>
        <a class="btn btn-info" href="javascript: history.go(-1)">Modificar Pedido</a>
        <html:submit styleClass="btn btn-primary">
            Confirmar
        </html:submit>
    </center>
    <br>
    <br>
</html:form>