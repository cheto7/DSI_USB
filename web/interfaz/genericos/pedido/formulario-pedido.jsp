<%-- 
    Document   : formulario-pedido
    Created on : Nov 4, 2012, 2:33:41 AM
    Author     : sibs
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- FORMULARIO DE REGISTRO -->
<div id="tabs">
    <ul>
        <li><a href="#tabs-1">Obrero</a></li>
        <li><a href="#tabs-2">Profesor</a></li>
        <li><a href="#tabs-3">Bombero</a></li>
        <li><a href="#tabs-4">Administrativo</a></li>
        <li><a href="#tabs-5">Genéricos</a></li>
    </ul>

    <html:form method="POST" action="/Pedido?method=save" onsubmit="return (this)">
        <html:hidden name="autenticado" property="usuario"/>

        <div id="tabs-1">
            <legend>Materiales para la cara/cabeza</legend>

            <div class="selector">
                <h1>1) Cascos:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="cascoSeguridad"/>
                        Seguridad
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/c1.png" />
                        </div>
                    </center>

                    <!--- TODO ESTO ES LO QUE HAY QUE COPIAR EN CADA CUADRO CON LA RESPECTIVA PROPIEDAD --->
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f1" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c1" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                    <!--- HASTA AQUI --->
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="cascoMotorizado"/> 
                        Motorizado
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/c3.png" />
                        </div>
                    </center> 
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f2" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c2" styleClass="span1" styleId="spinner1" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="pantallaAtalaje"/> 
                        Pantalla atalaje
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f64" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c64" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">         

                <h1>2) Lentes:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="lentesSeguridad"/> 
                        Seguridad
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f3" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c3" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="lentesCopa"/> 
                        De copa
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f4" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c4" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">   
                <h1>3) Mascarilla:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="mascarilla"/> 
                        Desechable
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f7" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c7" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">   
                <h1>4) Gorro:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="gorro"/> 
                        Gorro para cocinero
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f8" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c8" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">   
                <h1>5) Caretas:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="caretaSoldar"/> 
                        Para soldar
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f9" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c9" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">   
                <h1>6) Gorra/Sombrero:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="gorraAzul"/> 
                        Gorra color azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f12" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c12" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="gorraGrisLogo"/> 
                        Gorra gris logo USB
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f11" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c11" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="sombreroTipoPava"/> 
                        Sombrero tipo pava
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f10" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c10" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para los pies</legend>     

            <div class="selector">   
                <h1>1) Botas:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasTipoMilitar"/> 
                        Tipo militar
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f16" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c16" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasVaquetaCanaLarga"/> 
                        Vaqueta caña larga
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f17" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c17" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasMontanera"/> 
                        Montañera
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f18" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c18" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasDielectricas"/> 
                        Dieléctricas
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f13" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c13" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasPHierro"/>
                        Goma P.Hierro
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f14" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c14" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasCueroVulcanizTactica"/> 
                        Cuero vulcanizado
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f19" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c19" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para las manos</legend>

            <div class="selector">
                <h1>1) Guantes:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesCarnaza"/> 
                        De carnaza
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f20" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c20" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesCarnazaSoldador"/> 
                        De carnaza soldador
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f21" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c21" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesAntiAcido18"/> 
                        Antiácido 18"
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f22" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c22" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para el cuerpo</legend>

            <div class="selector">
                <h1>1) Delantales:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="delantalCocinero"/> 
                        Cocinero
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f35" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c35" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1> 2) Impermeables: </h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="impermeableMotorizado"/> 
                        Motorizado
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f46" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c46" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1> 3) Bragas: </h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bragaGrisDobleCostura"/> 
                        Gris
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f47" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c47" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bragaNegraDobleCostura"/> 
                        Negra
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f48" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c48" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1> 4) Batas: </h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bataAzul"/> 
                        Azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f49" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c49" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bataGris"/> 
                        Gris
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f50" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c50" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bataNegra"/> 
                        Negra
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f51" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c51" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>
        </div>


        <div id="tabs-2">

            <legend>Materiales para cara/cabeza</legend> 

            <div class="selector">   
                <h1>1) Respirador:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="respiradorCaraCompleta"/> 
                        Cara completa
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f5" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c5" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>


                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="respiradorMedioRostro"/> 
                        Medio rostro
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f6" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c6" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para las manos</legend>

            <div class="selector">
                <h1>1) Guantes:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesLatex"/> 
                        De látex
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f23" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c23" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesKevlar14"/> 
                        Kevlar 14"
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f24" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c24" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesKevlar20"/> 
                        Kevlar 20"
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f25" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c25" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesVaqueta"/> 
                        Vaqueta
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f26" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c26" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesNitrilo"/> 
                        De nitrilo
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f27" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c27" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesMotorizado"/> 
                        Para Motorizado
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f28" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c28" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesCarnaza"/> 
                        De carnaza
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f20" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c20" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesAntideslizantes"/> 
                        Antideslizantes
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f29" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c29" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesNeopreno"/> 
                        De neopreno
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f30" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c30" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

            </div>

            <legend>Materiales para mascaras</legend> 

            <div class="selector">   
                <h1>1) Filtros:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="filtroVaporOrganico"/> 
                        Vapor orgánico
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f31" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c31" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="filtroCloro"/> 
                        Cloro
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f32" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c32" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="filtroMercurio"/> 
                        Mercurio
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f33" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c33" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales contra caidas </legend> 

            <div class="selector">   
                <h1>1) Arnés:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="arnesSeguridad"/> 
                        De seguridad
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f34" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c34" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para el cuerpo</legend>

            <div class="selector">
                <h1>1) Delantales:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="delantalSoldadura"/> 
                        Para soldadura
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f36" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c36" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="delantalNeopreno"/> 
                        De neopreno
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f37" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c37" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="delantalPVC"/> 
                        PVC
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f38" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c38" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1> 2) Batas: </h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="bataBlanca"/> 
                        Blanca
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f52" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c52" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend>Materiales para los pies </legend> 

            <div class="selector">   
                <h1>1) Calzado:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="calzadoAntideslizante"/> 
                        Antideslizante
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f39" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c39" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>
        </div>

        <div id="tabs-3">
            <legend>Materiales para el cuerpo</legend>

            <div class="selector">
                <h1>1) Uniforme:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="uniformeTipoMilitar"/> 
                        Tipo militar
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f43" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c43" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1>2) Chaqueta:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chaquetaBombero"/> 
                        Bombero
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f42" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c42" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div> 

            <div class="selector">   
                <h1>3) Pantalón:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="pantalonTipoBombero"/> 
                        Tipo bombero
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f41" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c41" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="pantalonBomberoRescateAzul"/> 
                        De rescate azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f40" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c40" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend> Material para los pies </legend>

            <div class="selector">   
                <h1>1) Botas:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasCombateIncendio"/> 
                        Combate incendio
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f44" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c44" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="botasCueroVulcanizTactica"/> 
                        Vulcanizadas tácticas
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f19" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c19" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <legend> Materiales para las manos </legend>
            <div class="selector">
                <h1>1) Guantes:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="guantesCombateIncendio"/> 
                        Combate incendio
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f45" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c45" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div> 
        </div>

        <div id="tabs-4">
            <legend>Uniforme de oficina</legend>

            <div class="selector">
                <h1>1) Uniforme:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="camisaVestir"/> 
                        Camisa de vestir
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f66" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c66" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chaquetaVestir"/> 
                        Chaqueta
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f69" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c69" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="pantalonVestir"/> 
                        Pantalón de vestir
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f67" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c67" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="zapatosVestir"/> 
                        Zapatos de vestir
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f68" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c68" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="maletin"/> 
                        Maletín
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f65" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c65" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>
        </div>

        <div id="tabs-5">
            <legend>Materiales para el cuerpo</legend>

            <div class="selector">
                <h1>1) Chemisse:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chemisseAzul"/> 
                        Azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f53" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c53" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chemisseBeige"/> 
                        Beige
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f54" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c54" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chemisseVerde"/> 
                        Verde
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f55" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c55" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chemisseBlanca"/> 
                        Blanca
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f56" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c56" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="chemisseGris"/> 
                        Gris
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f57" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c57" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1>2) Camisas manga corta:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="camisaBlanca"/> 
                        Blanca
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f60" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c60" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="camisaAzul"/> 
                        Azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f61" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c61" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>

                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="camisaBeige"/> 
                        Beige
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f62" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c62" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1>3) Blazer:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="blazerAzul"/> 
                        Azul
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f58" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c58" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1>4) Pantalón:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="blueJeans"/> 
                        Blue jean
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f59" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c59" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>

            <div class="selector">
                <h1>5) Otros:</h1>
                <div class="casilla">
                    <label class="checkbox inline">
                        <html:checkbox value="true" name="Pedido" property="paraguas"/> 
                        Paraguas
                    </label>

                    <center>
                        <div class="casillaimg">
                            <img src="assets/materiales/img.png" />
                        </div>
                    </center>
                    <div>
                        <p style="float:left">Frecuencia de Uso:</p>
                        <html:select name="Pedido" property="f63" styleClass="spana">
                            <option>Diaria</option>
                            <option>Semanal</option>
                            <option>Mensual</option>
                            <option>Trimestral</option>
                            <option>Anual</option>
                        </html:select>

                        <p style="float:left">Cantidad:</p>

                        <html:text name="Pedido" property="c63" styleClass="span1" styleId="spinner" value="1">                
                        </html:text>

                    </div>
                </div>
            </div>
        </div>
        <center>
            <html:submit styleClass="btn btn-primary"> 
                Enviar 
            </html:submit>
        </html:form>
    </center>
</div>

<div style="display:none;" class="nav_up" id="nav_up"></div>
<div style="display:none;" class="nav_down" id="nav_down"></div>