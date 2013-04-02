<%-- 
    Document   : form-edit-content.jsp
    Created on : Nov 4, 2012, 3:24:36 AM
    Author     : sibs

    Modified on : Mar 29, 2012
    Author     : Karen
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>


<legend>Datos Personales</legend>
<h1 style="display: inline">Nombre de usuario:</h1> 
<bean:write name="Usuario" property="usuario"/><br>
<h1 style="display: inline"><br>Nombres y Apellidos:</h1> 
<bean:write name="Usuario" property="nombre"/> <bean:write name="Usuario" property="apellido"/><br><br>
<h1 style="display: inline">Cedula:</h1> 
<bean:write name="Usuario" property="ci"/><br><br>
<h1 style="display: inline">Fecha de Ingreso a la USB:</h1> 
<bean:write name="Usuario" property="fecha"/><br><br>

<html:form action = "/Editar" styleId="Form" onsubmit = "return (this)">
    <html:hidden name="Usuario" property="usuario"/>
    <html:hidden name="Usuario" property="administrador"/>
    <html:hidden name="autenticado" property="usuario"/>

    <label><br>Contraseña: </label>
        <html:password name="Usuario" property="password" styleId="password"></html:password>
    <br>

    <label>Confirmar Contraseña:</label>
    <input id="confirm_password" type="password" class="text" name="confirm_password" placeholder="Confirmar Contraseña" title="Ingrese su contraseña"/>
    <br>

    <label>Correo electrónico alternativo:</label>
    <html:text name="Usuario" property="email"></html:text><br>      
    <label>Teléfono: </label>
    <html:text name="Usuario" property="telefono"></html:text>
    <br>  

        <label>Unidad Adscripción:</label>
    <logic:present name="select">
        <logic:empty name="select">
            <html:select name="Usuario" property="unidad_adscripcion" styleClass="span1" style="width:250px">

                <html:option value= "" > Unidad de Adscripcion</html:option>                    

            </html:select>
        </logic:empty>

        <logic:notEmpty name="select">
            <html:select name="Usuario" property="unidad_adscripcion" styleClass="span1" style="width:250px">                  
                <html:optionsCollection name="select" value="nombre" label="nombre" />                                            
            </html:select>
        </logic:notEmpty>

    </logic:present>
    <br>   
    <label>Cargo </label>
    <html:text name="Usuario" property="cargo"></html:text>
    <br>  
    <br/>

    <legend>Talla de equipos:</legend>
    <h1 style="display: inline">Talla Mascara:</h1>
    <html:select name="Usuario" property="talla_mascara" style="width: 55px">
        <option>
            <bean:write name="Usuario" property="talla_mascara"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    <h1 style="display: inline">Talla de Camisa:</h1>
    <html:select name="Usuario" property="talla_camisa" style="width: 55px">
        <option>
            <bean:write name="Usuario" property="talla_camisa"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    <h1 style="display: inline">Talla de Pantalón:</h1>
    <html:select name="Usuario" property="talla_pantalon" style="width: 55px">
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
    <br>
    <h1 style="display: inline">Talla de Guantes:</h1>
    <html:select name="Usuario" property="talla_guantes" style="width: 55px">
        <option>
            <bean:write name="Usuario" property="talla_guantes"></bean:write>
        </option>
        <option>S</option>
        <option>M</option>
        <option>L</option>
        <option>XL</option>
    </html:select>
    <br>
    <h1 style="display: inline">Talla de Zapato:</h1>
    <html:select name="Usuario" property="talla_zapato" style="width: 55px">
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
    <legend>Área laboral:</legend>
    <html:select name="Usuario" property="area_laboral" styleClass="span1" style="width: 150px">
        <option>
            <bean:write name="Usuario" property="area_laboral"></bean:write>
        </option>
        <option>Administrativa</option>
        <option>Académica</option>
        <option>Bombero</option>
        <option>Obrero</option> 
    </html:select> 

    <br>
    <br>
    <center>
        <html:submit styleClass="btn btn-primary">Modificar </html:submit>
    </center>
</html:form>
