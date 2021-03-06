<%-- 
    Document   : form-edit-admin-content
    Created on : Nov 4, 2012, 3:28:21 AM
    Author     : sibs

    Modified on : Mar 29, 2012
    Author     : Karen, Azocar
--%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean" %>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html" %>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic" %>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles" %>

<legend>Editar informaci�n de usuario</legend>
<legend>Datos Personales</legend> 

<h1 style="display: inline">Usuario: </h1>
<bean:write name="autenticado" property="usuario"/><br>
<br>

<h1 style="display: inline">Nombre: </h1>
<bean:write name="autenticado" property="nombre"/><br>
<br>

<h1 style="display: inline">Apellido: </h1>
<bean:write name="autenticado" property="apellido"/><br>
<br>

<h1 style="display: inline">CI: </h1>
<bean:write name="autenticado" property="ci"/><br>
<br>

<html:form styleId="Form" method="POST" action="/EditarAdmin" onsubmit="return (this)">

    <html:hidden name="autenticado" property="usuario"/>

    <label>Contrase�a:</label>
    <html:password name="autenticado" property="password" styleId="password"></html:password>

        <label>Confirmar Contrase�a:</label>
        <input id="confirm_password" type="password" class="text" name="confirm_password" placeholder="Confirmar Contrase�a" title="Ingrese su contrase�a"/>
        <br>



        <label>Correo electr�nico:</label>
    <html:text name="autenticado" property="email"></html:text>
        <br>

        <label>Tel�fono</label>
    <html:text name="autenticado" property="telefono" styleId="tele"></html:text>
        <br>  

        <label>Unidad Adscripci�n:</label>
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

    <label>Cargo:</label>
    <html:text name="autenticado" property="cargo" styleId="unidadads"></html:text>
        <br>
        <br>

        <legend>Talla de equipos:</legend>
        <label>Talla de M�scara:</label>
    <html:select name="autenticado" property="talla_mascara">

        <option>
            <bean:write name="autenticado" property="talla_mascara"></bean:write>
            </option>

            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
    </html:select>
    <br>
    <label>Talla de Camisa:</label>
    <html:select name="autenticado" property="talla_camisa">
        <option>
            <bean:write name="autenticado" property="talla_camisa"></bean:write>
            </option>
            <option>SS</option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
            <option>XXL</option>
            <option>XXXL</option>
    </html:select>
    <br>
    <label>Talla de Pantal�n:</label>
    <html:select name="autenticado" property="talla_pantalon">
            <option>
                <bean:write name="autenticado" property="talla_pantalon"></bean:write>
            </option>
            <option>26</option>
            <option>28</option>
            <option>30</option>
            <option>32</option>
            <option>34</option>
            <option>36</option>
            <option>38</option>
            <option>40</option>
            <option>42</option>
            <option>44</option>
            <option>46</option>
            <option>48</option>
    </html:select>
    <br>
    <label>Talla de Guantes:</label>
    <html:select name="autenticado" property="talla_guantes">
        <option>
            <bean:write name="autenticado" property="talla_guantes"></bean:write>
            </option>
            <option>S</option>
            <option>M</option>
            <option>L</option>
            <option>XL</option>
    </html:select>
    <br>
    <label>Talla de Zapato:</label>
    <html:select name="autenticado" property="talla_zapato">
        <option>
            <bean:write name="autenticado" property="talla_zapato"></bean:write>
            </option>
                <option>35</option>
                <option>35.5</option>
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
                <option>43</option>
                <option>43.5</option>
                <option>44</option>
                <option>44.5</option>
                <option>45</option>
                <option>45.5</option>
                <option>46</option>
                <option>46.5</option>
                <option>47</option>
    </html:select>        

    <br>
    <html:submit> Modificar </html:submit>
</html:form>