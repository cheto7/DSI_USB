<%-- 
    Document   : form-edit-content-admin
    Created on : 06/03/2013, 09:31:12 PM
    Author     : ivan
--%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<legend>Datos del usuario</legend>

<h1 style="display: inline">Usuario:</h1> 
<bean:write name="Usuario" property="usuario"/><br>


<html:form action = "/EditarAdmin" styleId="Form" onsubmit = "return (this)">
    <html:hidden name="Usuario" property="usuario"/>
    <%--<html:hidden name="Usuario" property="administrador"/>--%>
    <html:hidden name="Usuario" property="habilitado"/>
    <html:hidden name="autenticado" property="usuario"/>
    <table>
        <tr>
            <td>
                <h1 style="display: inline">Nombres:</h1> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <html:text name="Usuario" property="nombre"></html:text>
            </td>
            <td>
                <h1 style="display: inline">Apellidos:</h1> 
                <html:text name="Usuario" property="apellido"></html:text>
            </td>
        </tr>
        <tr>
            <td>
                <h1 style="display: inline">Fecha de nacimiento: </h1>
                <html:text name="Usuario" property="fecha"></html:text>
            </td>
            <td>
                <h1 style="display: inline">Tel�fono: </h1>
                <html:text name="Usuario" property="telefono"></html:text><br>
            </td>
        </tr>
        <tr>
            <td>
                <h1 style="display: inline">Correo electr�nico alternativo:</h1>
                <html:text name="Usuario" property="email"></html:text>
            </td>
        </tr>
        <tr>
            <td>
                <h1 style="display: inline">Unidad adscripci�n: </h1>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
                <%--<html:textarea name="Usuario" property="unidad_adscripcion" rows="5" styleId="dir" styleClass="span5"></html:textarea><br>    --%>
                <logic:present name="select">
                    <logic:notEmpty name="select">
                        <html:select name="Usuario" property="unidad_adscripcion" styleClass="span1" style="width:250px">
                    <option value="<bean:write name="Usuario" property="unidad_adscripcion"/>">
                        <bean:write name="Usuario" property="unidad_adscripcion"/>
                    </option>
                    <logic:iterate name="select" id="unidadAdscripcion">
                        <option value="<bean:write name="unidadAdscripcion" property="nombre"/>">
                            <bean:write name="unidadAdscripcion" property="nombre"></bean:write>
                            </option>
                    </logic:iterate>

                </html:select>
            </logic:notEmpty>
        </logic:present>              
    </td>
</tr>
<tr>
    <td>
        <h1 style="display: inline"><br>Sexo: </h1>
        <label class="radio">
            <html:radio property="sexo" value="masculino">
                Masculino
            </html:radio>
        </label>
        <label class="radio">
            <html:radio property="sexo" value="femenino">
                Femenino
            </html:radio>
        </label>
    </td>
    <td></td>
</tr>


<%--<h1 style="display: inline"><br>Password: </h1>
<html:password name="Usuario" property="password" styleId="password"></html:password><br>--%>






<br/>
</table>


<legend>Tallas corporales:</legend>
<table width="100%">
    <tr>
        <td>
    <h1 style="display: inline">Talla de M�scara:</h1>
    <html:select name="Usuario" property="talla_mascara" styleClass="span2">
        <option>
            <bean:write name="Usuario" property="talla_mascara"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
        </td>
        <td>

    <h1 style="display: inline">Talla de Camisa:</h1>
    <html:select name="Usuario" property="talla_camisa" styleClass="span2">
        <option>
            <bean:write name="Usuario" property="talla_camisa"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
        </td>
</tr>
<tr>
    <td>
<h1 style="display: inline">Talla de Pantal�n:</h1>
<html:select name="Usuario" property="talla_pantalon" styleClass="span2">
    <option>
        <bean:write name="Usuario" property="talla_pantalon"></bean:write>
    </option>
    <option>28</option>
    <option>30</option>
    <option>32</option>
    <option>34</option>
    <option>36</option>
    <option>38</option>
    <option>40</option>
    <option>42</option>
    <option>44</option>
    <option>48</option>
</html:select>
    </td>
    <td>
<h1 style="display: inline">Talla de Guantes:</h1>
<html:select name="Usuario" property="talla_guantes" styleClass="span2">
    <option>
        <bean:write name="Usuario" property="talla_guantes"></bean:write>
    </option>
    <option>S</option>
    <option>M</option>
    <option>L</option>
    <option>XL</option>
</html:select>
    </td>
</tr>
<tr>
<td>
<h1 style="display: inline">Talla de Zapato:</h1>
&nbsp;&nbsp;
<html:select name="Usuario" property="talla_zapato" styleClass="span2">
    <option>
        <bean:write name="Usuario" property="talla_zapato"></bean:write>
    </option>
    <option>36</option>
    <option>36.5</option>
    <option>37</option>
    <option>37.5</option>
    <option>38</option>
    <option>38.5</option>
    <option>39</option>
    <option>39.5</option>
    <option>40</option>
    <option>40.5</option>
    <option>41</option>
    <option>41.5</option>
    <option>42</option>
    <option>42.5</option>
    <option>44</option>
    <option>44.5</option>
    <option>45</option>
</html:select>
    </td>
    <td></td>
</tr>
</table>
<table width="100%">
    <tr>
        <td>
<legend>�rea laboral:</legend>
<html:select name="Usuario" property="area_laboral" styleClass="span3" >
    <option>
        <bean:write name="Usuario" property="area_laboral"></bean:write>
    </option>
    <option>Administrativa</option>
    <option>Acad�mica</option>
    <option>Bombero</option>
    <option>Obrero</option> 
</html:select>
</td>
<td>
<legend>Permisos:</legend>
<html:select name="Usuario" property="administrador" styleClass="span3" >
    <option>
        <bean:write name="Usuario" property="administrador"></bean:write>
    </option>
    <option>Usuario</option>
    <option>Supervisor</option>
    <option>Inspector</option>
    <option>Administrador</option> 
</html:select>
    </td>
</tr>

</table>
<br>
<br>
<center>
    <html:submit styleClass="btn btn-primary">Modificar</html:submit>
</center>
</html:form>