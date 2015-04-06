﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSolicitudPrestamo.aspx.cs" Inherits="OSEF.ERP.APP.FormaSolicitudPrestamo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type='text/javascript' src="js/solicitudesPrestamos.js"></script>
    <script type="text/javascript">
        window.onload = cargarEstilo;

        //Funcion que valida que tema va a ser utilizadp
        function cargarEstilo() {
            //Validamos la cookie
            if (Ext.util.Cookies.get('osefTheme') == 'bancomer') {
                //Asiganmos los elementos en el header
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/login.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/customControls.css')
                var fileref3 = document.createElement("link")
                fileref3.setAttribute("rel", "stylesheet")
                fileref3.setAttribute("type", "text/css")
                fileref3.setAttribute("href", 'css/xMask.css')
                var fileref4 = document.createElement("link")
                fileref4.setAttribute("rel", "stylesheet")
                fileref4.setAttribute("type", "text/css")
                fileref4.setAttribute("href", 'css/xDatePicker.css')
                var fileref5 = document.createElement("link")
                fileref5.setAttribute("rel", "stylesheet")
                fileref5.setAttribute("type", "text/css")
                fileref5.setAttribute("href", 'css/xSplitButton.css')
                var fileref6 = document.createElement("link")
                fileref6.setAttribute("rel", "stylesheet")
                fileref6.setAttribute("type", "text/css")
                fileref6.setAttribute("href", 'css/xGridPanel.css')
                var fileref7 = document.createElement("link")
                fileref7.setAttribute("rel", "stylesheet")
                fileref7.setAttribute("type", "text/css")
                fileref7.setAttribute("href", 'css/xWindowPopup.css')
                var fileref8 = document.createElement("link")
                fileref8.setAttribute("rel", "stylesheet")
                fileref8.setAttribute("type", "text/css")
                fileref8.setAttribute("href", 'css/xPanel.css')
                var fileref9 = document.createElement("link")
                fileref9.setAttribute("rel", "stylesheet")
                fileref9.setAttribute("type", "text/css")
                fileref9.setAttribute("href", 'css/xComboBox.css')
                var fileref10 = document.createElement("link")
                fileref10.setAttribute("rel", "stylesheet")
                fileref10.setAttribute("type", "text/css")
                fileref10.setAttribute("href", 'css/xCustomChart.css')
                var fileref11 = document.createElement("link")
                fileref11.setAttribute("rel", "stylesheet")
                fileref11.setAttribute("type", "text/css")
                fileref11.setAttribute("href", 'css/xToolbar.css')
                var fileref12 = document.createElement("link")
                fileref12.setAttribute("rel", "stylesheet")
                fileref12.setAttribute("type", "text/css")
                fileref12.setAttribute("href", 'css/xLabel.css')
                var fileref13 = document.createElement("link")
                fileref13.setAttribute("rel", "stylesheet")
                fileref13.setAttribute("type", "text/css")
                fileref13.setAttribute("href", 'css/xTreePanel.css')
                var fileref14 = document.createElement("link")
                fileref14.setAttribute("rel", "stylesheet")
                fileref14.setAttribute("type", "text/css")
                fileref14.setAttribute("href", 'css/xHiperlink.css')
                var fileref15 = document.createElement("link")
                fileref15.setAttribute("rel", "stylesheet")
                fileref15.setAttribute("type", "text/css")
                fileref15.setAttribute("href", 'css/xTextField.css')
                var fileref16 = document.createElement("link")
                fileref16.setAttribute("rel", "stylesheet")
                fileref16.setAttribute("type", "text/css")
                fileref16.setAttribute("href", 'css/xFieldSet.css')
                var fileref17 = document.createElement("link")
                fileref17.setAttribute("rel", "stylesheet")
                fileref17.setAttribute("type", "text/css")
                fileref17.setAttribute("href", 'css/xButton.css')
                var fileref18 = document.createElement("link")
                fileref18.setAttribute("rel", "stylesheet")
                fileref18.setAttribute("type", "text/css")
                fileref18.setAttribute("href", 'css/metroButtons.css')
                var fileref19 = document.createElement("link")
                fileref19.setAttribute("rel", "stylesheet")
                fileref19.setAttribute("type", "text/css")
                fileref19.setAttribute("href", 'css/metroButtons.css')
                var fileref20 = document.createElement("link")
                fileref20.setAttribute("rel", "stylesheet")
                fileref20.setAttribute("type", "text/css")
                fileref20.setAttribute("href", 'css/xDisplayImages.css')
                var fileref21 = document.createElement("link")
                fileref21.setAttribute("rel", "stylesheet")
                fileref21.setAttribute("type", "text/css")
                fileref21.setAttribute("href", 'css/xIcons.css')
                var fileref22 = document.createElement("link")
                fileref22.setAttribute("rel", "stylesheet")
                fileref22.setAttribute("type", "text/css")
                fileref22.setAttribute("href", 'css/xTabPanel.css')

                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
                document.getElementsByTagName("head")[0].appendChild(fileref3);
                document.getElementsByTagName("head")[0].appendChild(fileref4);
                document.getElementsByTagName("head")[0].appendChild(fileref5);
                document.getElementsByTagName("head")[0].appendChild(fileref6);
                document.getElementsByTagName("head")[0].appendChild(fileref7);
                document.getElementsByTagName("head")[0].appendChild(fileref8);
                document.getElementsByTagName("head")[0].appendChild(fileref9);
                document.getElementsByTagName("head")[0].appendChild(fileref10);
                document.getElementsByTagName("head")[0].appendChild(fileref11);
                document.getElementsByTagName("head")[0].appendChild(fileref12);
                document.getElementsByTagName("head")[0].appendChild(fileref13);
                document.getElementsByTagName("head")[0].appendChild(fileref14);
                document.getElementsByTagName("head")[0].appendChild(fileref15);
                document.getElementsByTagName("head")[0].appendChild(fileref16);
                document.getElementsByTagName("head")[0].appendChild(fileref17);
                document.getElementsByTagName("head")[0].appendChild(fileref18);
                document.getElementsByTagName("head")[0].appendChild(fileref19);
                document.getElementsByTagName("head")[0].appendChild(fileref20);
                document.getElementsByTagName("head")[0].appendChild(fileref21);
                document.getElementsByTagName("head")[0].appendChild(fileref22);
            }

            if (Ext.util.Cookies.get('osefTheme') == 'caja') {
                var fileref = document.createElement("link")
                fileref.setAttribute("rel", "stylesheet")
                fileref.setAttribute("type", "text/css")
                fileref.setAttribute("href", 'css/customControls2.css')
                var fileref2 = document.createElement("link")
                fileref2.setAttribute("rel", "stylesheet")
                fileref2.setAttribute("type", "text/css")
                fileref2.setAttribute("href", 'css/login2.css')
                document.getElementsByTagName("head")[0].appendChild(fileref);
                document.getElementsByTagName("head")[0].appendChild(fileref2);
            }
        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="rmSolicitudPrestamo" runat="server" HideInDesign="true" />

        <ext:Store
            ID="sEstados"
            runat="server">
            <Model>
                <ext:Model ID="mEstados" runat="server" IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Descripcion" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

        <ext:Store
            ID="sSolicitudPrestamo"
            runat="server">
            <Model>
                <ext:Model
                    ID="mSolicitudPrestamo"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                        <ext:ModelField Name="Cliente" Type="String" />
                        <ext:ModelField Name="Nacionalidad" Type="String" />
                        <ext:ModelField Name="RegistroMatrimonial" Type="String" />
                        <ext:ModelField Name="NumeroDependientes" Type="Int" />
                        <ext:ModelField Name="Edades" Type="String" />
                        <ext:ModelField Name="TipoCasa" Type="String" />
                        <ext:ModelField Name="AniosDomicilio" Type="Int" />
                        <ext:ModelField Name="CalleAnterior" Type="String" />
                        <ext:ModelField Name="NoExteriorAnterior" Type="String" />
                        <ext:ModelField Name="NoInteriorAnterior" Type="String" />
                        <ext:ModelField Name="ColoniaAnterior" Type="String" />
                        <ext:ModelField Name="CodigoPostalAnterior" Type="Int" />
                        <ext:ModelField Name="EntreCallesAnterior" Type="String" />
                        <ext:ModelField Name="EstadoAnterior" Type="String" />
                        <ext:ModelField Name="MunicipioAnterior" Type="String" />
                        <ext:ModelField Name="Antiguedad" Type="Int" />
                        <ext:ModelField Name="Ingresos" Type="Int" />
                        <ext:ModelField Name="OtrosIngresos" Type="Int" />
                        <ext:ModelField Name="Concepto" Type="String" />
                        <ext:ModelField Name="JefeNombre" Type="String" />
                        <ext:ModelField Name="JefeAPAterno" Type="String" />
                        <ext:ModelField Name="JefeAMaterno" Type="String" />
                        <ext:ModelField Name="EmpresaAnterior" Type="String" />
                        <ext:ModelField Name="ConyugeNombre" Type="String" />
                        <ext:ModelField Name="ConyugeAPaterno" Type="String" />
                        <ext:ModelField Name="ConyugeAMaterno" Type="String" />
                        <ext:ModelField Name="ConyugeFechaNacimiento" Type="Date" />
                        <ext:ModelField Name="ConyugeRFC" Type="String" />
                        <ext:ModelField Name="ConyugeCalle" Type="String" />
                        <ext:ModelField Name="ConyugeNoExterior" Type="String" />
                        <ext:ModelField Name="ConyugeNoInterior" Type="String" />
                        <ext:ModelField Name="ConyugeColonia" Type="String" />
                        <ext:ModelField Name="ConyugeCodigoPostal" Type="Int" />
                        <ext:ModelField Name="ConyugeEntreCalles" Type="String" />
                        <ext:ModelField Name="ConyugeIngresos" Type="Int" />
                        <ext:ModelField Name="ConyugeAntiguedad" Type="Int" />
                        <ext:ModelField Name="ConyugeTelefono" Type="String" />
                        <ext:ModelField Name="ConyugeTelefonoMovil" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresa" Type="String" />
                        <ext:ModelField Name="ConyugePuesto" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaCalle" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaNoExterior" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaNoInterior" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaColonia" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaCodigoPostal" Type="Int" />
                        <ext:ModelField Name="ConyugeEmpresaEntreCalles" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeNombre" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeAPAterno" Type="String" />
                        <ext:ModelField Name="ConyugeEmpresaJefeAMAterno" Type="String" />
                        <ext:ModelField Name="AvalNombre" Type="String" />
                        <ext:ModelField Name="AvalAPaterno" Type="String" />
                        <ext:ModelField Name="AvalAMaterno" Type="String" />
                        <ext:ModelField Name="AvalSocio" Type="String" />
                        <ext:ModelField Name="AvalEstadoCivil" Type="String" />
                        <ext:ModelField Name="AvalRegistroMatrimonial" Type="String" />
                        <ext:ModelField Name="AvalCalle" Type="String" />
                        <ext:ModelField Name="AvalNoExterior" Type="String" />
                        <ext:ModelField Name="AvalNoInterior" Type="String" />
                        <ext:ModelField Name="AvalColonia" Type="String" />
                        <ext:ModelField Name="AvalCodigoPostal" Type="String" />
                        <ext:ModelField Name="AvalEntreCalles" Type="String" />
                        <ext:ModelField Name="AvalTelefono" Type="String" />
                        <ext:ModelField Name="AvalTelefonoMovil" Type="String" />
                        <ext:ModelField Name="AvalAntiguedad" Type="String" />
                        <ext:ModelField Name="AvalCasaPropia" Type="String" />
                        <ext:ModelField Name="AvalTipoCasa" Type="String" />
                        <ext:ModelField Name="AvalCalleAnterior" Type="String" />
                        <ext:ModelField Name="AvalNoExteriorAnterior" Type="String" />
                        <ext:ModelField Name="AvalNoInteriorAnterior" Type="String" />
                        <ext:ModelField Name="AvalColoniaAnterior" Type="String" />
                        <ext:ModelField Name="AvalCodigoPostalAnterior" Type="String" />
                        <ext:ModelField Name="AvalEntreCallesAnterior" Type="String" />
                        <ext:ModelField Name="AvalEmpresa" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeNombre" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeAPAterno" Type="String" />
                        <ext:ModelField Name="AvalEmpresaJefeAMAterno" Type="String" />
                        <ext:ModelField Name="AvalEmpresaPuesto" Type="String" />
                        <ext:ModelField Name="AvalEmpresaAntiguedad" Type="String" />
                        <ext:ModelField Name="AvalEmpresaIngresos" Type="String" />
                        <ext:ModelField Name="AvalEmpresaOtrosIngresos" Type="String" />
                        <ext:ModelField Name="AvalEmpresaConcepto" Type="String" />
                        <ext:ModelField Name="AvalEmpresaTelefono" Type="String" />
                        <ext:ModelField Name="AvalEmpresaPropietario" Type="String" />
                        <ext:ModelField Name="AvalEmpresaTipo" Type="String" />
                        <ext:ModelField Name="AvalEmpresaAnterior" Type="String" />
                        <ext:ModelField Name="Cantidad" Type="String" />
                        <ext:ModelField Name="Plazo" Type="String" />
                        <ext:ModelField Name="FormaPago" Type="String" />
                        <ext:ModelField Name="Tipo" Type="String" />
                        <ext:ModelField Name="TablaAmortizacion" Type="String" />
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>           
        </ext:Store>

        <div>
            <ext:Panel 
                ID="pSolicitudPrestamo" 
                runat="server" 
                Width="805"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpSolicitudPrestamo" 
                        runat="server" 
                        Height="525"
                        MonitorResize="true"
                        AutoScroll="true">
                        <Items>
                            <ext:TabPanel 
                                ID="tbSolicitudPrestamo" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="785"
                                Plain="true"
                                AutoScroll="true"
                                Cls="custotabpanel xchris">
                                <Items>
                                    <%--Datos generales--%>
                                    <ext:Panel
                                        ID="pDatosSocio" 
                                        runat="server" 
                                        Title="Datos Socio" 
                                        BodyPadding="10"
                                        MonitorResize="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDivisorDatos" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container
                                                        ID="cDatosSocioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbCliente" 
                                                                runat="server" 
                                                                AutoFocus="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="ID"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                MatchFieldWidth="false"
                                                                AllowBlank="false"
                                                                PageSize="10"
                                                                ValueNotFoundText="Elemento no encontrado"
                                                                ForceSelection="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Socio">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sCliente"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model
                                                                                ID="mCliente"
                                                                                runat="server"
                                                                                IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                                                    <ext:ModelField Name="APaterno" Type="String" />
                                                                                    <ext:ModelField Name="AMaterno" Type="String" />
                                                                                    <ext:ModelField Name="NombreCompleto" Type="String">
                                                                                        <Convert Fn="NombreCompleto_Convert" />
                                                                                    </ext:ModelField>
                                                                                    <ext:ModelField Name="RFC" Type="String" />
                                                                                    <ext:ModelField Name="EstadoCivil" Type="String" />
                                                                                    <ext:ModelField Name="Correo" Type="String" />
                                                                                    <ext:ModelField Name="Telefono" Type="String" />
                                                                                    <ext:ModelField Name="TelefonoMovil" Type="String" />
                                                                                    <ext:ModelField Name="Calle" Type="String" />
                                                                                    <ext:ModelField Name="NoExterior" Type="String" />
                                                                                    <ext:ModelField Name="NoInterior" Type="String" />
                                                                                    <ext:ModelField Name="Colonia" Type="String" />
                                                                                    <ext:ModelField Name="CodigoPostal" Type="Int" />
                                                                                    <ext:ModelField Name="EntreCalles" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                    <ext:ModelField Name="Municipio" Type="String" />
                                                                                    <ext:ModelField Name="Empresa" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaCalle" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaNoExterior" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaNoInterior" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaColonia" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaCodigoPostal" Type="Int" NullConvert="true" />
                                                                                    <ext:ModelField Name="EmpresaEntreCalles" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaEstado" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaMunicipio" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaTelefono" Type="String" />
                                                                                    <ext:ModelField Name="EmpresaTelefonoExt" Type="Int" NullConvert="true" />
                                                                                    <ext:ModelField Name="Puesto" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <ListConfig ID="lcCliente" runat="server" Width="330">
                                                                    <ItemTpl ID="itCliente" runat="server">
                                                                        <Html>
                                                                            <div class="search-item">
							                                                    <h3>{ID}</h3>
                                                                                <span>{NombreCompleto}</span>
						                                                    </div>
                                                                        </Html>
                                                                    </ItemTpl>
                                                                </ListConfig>
                                                                <Listeners>
                                                                    <Select Fn="cmbCliente_Select" />
                                                                    <Change Fn="cmbCliente_Change" />
                                                                </Listeners>
                                                            </ext:ComboBox>
                                                            <ext:TextField
                                                                ID="txtfNombreCompleto" 
                                                                runat="server"
                                                                Disabled="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfRFC"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                FieldLabel="RFC">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:ComboBox
                                                                ID="cmbEstadoCivil"
                                                                runat="server"
                                                                Editable="false"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                FieldLabel="Estado civil">
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="" Value="SOLTERO" />
                                                                    <ext:ListItem Index="1" Text="" Value="CASADO" />
                                                                    <ext:ListItem Index="2" Text="" Value="DIVORCIADO" />
                                                                    <ext:ListItem Index="3" Text="" Value="VIUDO" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfTelefono"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                Note="Ejemplo: (449) 999-00-00"
                                                                Disabled="false"
                                                                FieldLabel="Teléfono">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imTelefono"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfTelefonoMovil"
                                                                runat="server"
                                                                FieldLabel="Teléfono móvil"
                                                                Editable="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imTelefonoMovil"
                                                                        runat="server"
                                                                        Mask="(999-999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDatosSocioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCorreo"
                                                                runat="server"
                                                                Editable="true"
                                                                Vtype="email"
                                                                MaxLength="100"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                FieldLabel="Correo">
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfNacionalidad"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="20"
                                                                AllowBlank="false"
                                                                FieldLabel="Nacionalidad">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNacionalidad.setValue(App.txtfNacionalidad.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfDependientes"
                                                                runat="server"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                AllowExponential="false"
                                                                Step="1"
                                                                FieldLabel="Dependientes">
                                                            </ext:NumberField>
                                                            <ext:TextField
                                                                ID="txtfEdades"
                                                                runat="server"
                                                                FieldLabel="Edades"
                                                                MaxLength="10"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC6" 
                                                        runat="server"
                                                        AnchorHorizontal="100%" 
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgRegistroMatrimonial"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Registro matrimonial"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rBienesSeparados" runat="server" BoxLabel="Bienes separados" Checked="true" />
                                                                    <ext:Radio ID="rBienesMancomunados" runat="server" BoxLabel="Bienes mancomunados"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC7"
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgTipoCasa"
                                                                runat="server"
                                                                Width="680"
                                                                LabelWidth="126"  
                                                                FieldLabel="Tipo de casa"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                ColumnsNumber="4"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rPropia" runat="server" BoxLabel="Propia" Checked="true" />
                                                                    <ext:Radio ID="rRentada" runat="server" BoxLabel="Rentada"  />
                                                                    <ext:Radio ID="rFamilia" runat="server" BoxLabel="Familia"  />
                                                                    <ext:Radio ID="rHipoteca" runat="server" BoxLabel="Hipoteca"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDatosSocioC8"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nAnosDomicilioActual"
                                                                runat="server"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1"
                                                                FieldLabel="Antigüedad"
                                                                EmptyText="Domicilio">
                                                            </ext:NumberField>
                                                            <ext:ComboBox
                                                                ID="cmbEstatus"
                                                                runat="server"
                                                                Editable="false"
                                                                FieldLabel="Estatus"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
                                                                <Store>
                                                                    <ext:Store ID="sEstatus" runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEstatus" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <SelectedItems>
                                                                    <ext:ListItem Index="0" Value="ALTA" />
                                                                </SelectedItems>
                                                                <Items>
                                                                    <ext:ListItem Index="0" Text="ALTA" Value="ALTA" />
                                                                    <ext:ListItem Index="1" Text="BLOQUEADO" Value="BLOQUEADO" />
                                                                    <ext:ListItem Index="2" Text="BAJA" Value="BAJA" />
                                                                </Items>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsControl"
                                                runat="server"
                                                Title="Control de Datos"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cAlta"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfUsuarioAlta"
                                                                runat="server"
                                                                Editable="false"
                                                                MaxLength="50"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                FieldLabel="Usuario alta">
                                                            </ext:TextField>
                                                            <ext:DateField
                                                                ID="dfFechaAlta"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Fecha alta"
                                                                Disabled="true"
                                                                Vtype="daterange">
                                                            </ext:DateField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cModificacion"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfUsuarioModificacion"
                                                                runat="server"
                                                                Editable="false"
                                                                MaxLength="50"
                                                                FieldLabel="Usuario modificar"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true">
                                                            </ext:TextField>
                                                            <ext:DateField
                                                                ID="dfFechaModificacion"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                FieldLabel="Fecha modificación"
                                                                Vtype="daterange">
                                                            </ext:DateField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                    <%-- Terminado --%>
                                    <%--<ext:Panel
                                        ID="pDomicilioSocio"
                                        runat="server"
                                        Title="Domicilio Socio"
                                        BodyPadding="10"
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDomicilio"
                                                runat="server"
                                                Title="Domicilio"
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container
                                                        ID="cDomicilioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalle" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEntreCalles.setValue(App.txtfEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInterior"
                                                                FieldLabel="N° Interior"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoInterior.setValue(App.txtfNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostal"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="imCodigoPostal" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
                                                                <DirectEvents>
                                                                    <Change OnEvent="cmbEstado_Change">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
                                                                <ListConfig Width="200" MaxHeight="195">
                                                                </ListConfig>
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sMunicipios"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mMunicipios" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                        <Sorters>
                                                                            <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                                                        </Sorters>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Change OnEvent="cmbMunicipio_Change">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Change>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sColonias"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mColonias" runat="server">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                    <ext:ModelField Name="Municipio" Type="String" />
                                                                                    <ext:ModelField Name="REstado" Type="String" />
                                                                                    <ext:ModelField Name="RMunicipio" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                        <Sorters>
                                                                            <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                                                        </Sorters>
                                                                    </ext:Store>
                                                                </Store>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsDomicilioAnterior" 
                                                runat="server" 
                                                Title="Domicilio Anterior" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalleAnterior" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalleAnterior.setValue(App.txtfCalleAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCallesAnterior"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEntreCallesAnterior.setValue(App.txtfEntreCallesAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExteriorAnterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExteriorAnterior.setValue(App.txtfNoExteriorAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInteriorAnterior"
                                                                FieldLabel="N° Interior"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoInteriorAnterior.setValue(App.txtfNoInteriorAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostalAnterior"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="InputMask1" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEstadoAnterior"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID">
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEstadoAnterior_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEstadoAnterior.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cDomicilioAnteriorC4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipioAnterior"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sMunicipiosAnterior"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mMunicipiosAnterior" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbMunicipioAnterior_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbMunicipioAnterior.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColoniaAnterior"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sColoniasAnterior"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mColoniasAnterior" runat="server">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                    <ext:ModelField Name="Municipio" Type="String" />
                                                                                    <ext:ModelField Name="REstado" Type="String" />
                                                                                    <ext:ModelField Name="RMunicipio" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                        <Sorters>
                                                                            <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                                                        </Sorters>
                                                                    </ext:Store>
                                                                </Store>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pOcupacionActual" 
                                        runat="server" 
                                        Title="Ocupación actual" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsEmpresaDatos"
                                                runat="server"
                                                Title="Empresa datos"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cEmpresaC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresa" 
                                                                runat="server"
                                                                FieldLabel="Empresa"
                                                                Width="735"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="50"
                                                                EnforceMaxLength="true"
                                                                AutoFocus="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresa.setValue(App.txtfEmpresa.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaCalle" 
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaCalle.setValue(App.txtfEmpresaCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaEntreCalles" 
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaEntreCalles.setValue(App.txtfEmpresaEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaNoExterior.setValue(App.txtfEmpresaNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaNoInterior.setValue(App.txtfEmpresaNoInterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaCodigoPostal"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                Disabled="false">
                                                                <Plugins>
                                                                    <ext:InputMask ID="InputMask2" runat="server" Mask="ttttt" AllowInvalid="true">
                                                                        <MaskSymbols>
                                                                            <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                        </MaskSymbols>
                                                                    </ext:InputMask>
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbEmpresaEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                EnforceMaxLength="false">
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEmpresaEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEmpresaEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="ForceSelection" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="QueryMode" Value="Local" Mode="Value" />
                                                            <ext:Parameter Name="TypeAhead" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                Disabled="false">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sEmpresaMunicipios"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEmpresaMunicipios" runat="server" IDProperty="ID">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                    </ext:Store>
                                                                </Store>
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEmpresaMunicipio_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEmpresaMunicipio.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                Disabled="false"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion">
                                                                <Store>
                                                                    <ext:Store
                                                                        ID="sEmpresaColonia"
                                                                        runat="server">
                                                                        <Model>
                                                                            <ext:Model ID="mEmpresaColonia" runat="server">
                                                                                <Fields>
                                                                                    <ext:ModelField Name="ID" Type="String" />
                                                                                    <ext:ModelField Name="Descripcion" Type="String" />
                                                                                    <ext:ModelField Name="Estado" Type="String" />
                                                                                    <ext:ModelField Name="Municipio" Type="String" />
                                                                                    <ext:ModelField Name="REstado" Type="String" />
                                                                                    <ext:ModelField Name="RMunicipio" Type="String" />
                                                                                </Fields>
                                                                            </ext:Model>
                                                                        </Model>
                                                                         <Sorters>
                                                                            <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                                                        </Sorters>
                                                                    </ext:Store>
                                                                </Store>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC6"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaTelefono"
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="imEmpresaTelefono"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:NumberField
                                                                ID="nfEmpresaTelefonoExt"
                                                                runat="server"
                                                                FieldLabel="Extensión"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                MinValue="0"
                                                                MaxValue="99999"
                                                                AllowDecimals="false"
                                                                AllowExponential="false"
                                                                Step="1"
                                                                Note="Ejemplo: 44889">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsEmpresaSocio"
                                                runat="server"
                                                Title="Empresa Socio"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Step" Value="1" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAntiguedad"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                FieldLabel="Antigüedad"
                                                                Width="325"
                                                                LabelWidth="120"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfOtrosIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cEmpresaSocioC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfOtrosIngresos" 
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfOtrosIngresos.setValue(App.txtfOtrosIngresos.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cEmpresaSocioC4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="361" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaAnterior" 
                                                                runat="server" 
                                                                Width="370"
                                                                LabelWidth="120"
                                                                FieldLabel="Empresa anterior" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfEmpresaAnterior.setValue(App.txtfEmpresaAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfPuesto" 
                                                                runat="server"
                                                                EmptyText="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfPuesto.setValue(App.txtfPuesto.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                Width="325"
                                                                FieldLabel="Jefe Inmediato"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeNombre.setValue(App.txtfJefeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAPaterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeAPaterno.setValue(App.txtfJefeAPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAMaterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfJefeAMaterno.setValue(App.txtfJefeAMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pDatosConyugue" 
                                        runat="server" 
                                        Title="Datos Conyugue" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="fsConyugeDatosGenerales" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="cConyugeC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeNombre"
                                                                runat="server"
                                                                AutoFocus="true"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Nombre"
                                                                LabelWidth="120"
                                                                Width="325"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeNombre.setValue(App.txtfConyugeNombre.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeAPaterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeAPaterno.setValue(App.txtfConyugeAPaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeAMaterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeAMaterno.setValue(App.txtfConyugeAMaterno.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeC2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:DateField
                                                                ID="dfConyugeFechaNacimiento"
                                                                runat="server"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Width="325"
                                                                FieldLabel="Fecha Nacimiento"
                                                                Vtype="daterange"
                                                                Note="Ejemplo: dd/mm/aaaa">
                                                                <PickerOptions 
                                                                    ID="poFechaNacimiento"
                                                                    runat="server"
                                                                    Cls="my-date-picker">
                                                                </PickerOptions>
                                                                <Listeners>
                                                                    <Select Fn="CalcularFechaNacimiento" />
                                                                    <Blur Fn="CalcularFechaNacimiento" />
                                                                </Listeners>
                                                            </ext:DateField>
                                                            <ext:TextField
                                                                ID="txtfConyugeEdad"
                                                                runat="server"
                                                                MaxLength="50"
                                                                EnforceMaxLength="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="true"
                                                                EmptyText="Edad">
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeRFC"
                                                                runat="server"
                                                                EmptyText="RFC"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeRFC.setValue(App.txtfConyugeRFC.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC5" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeTelefono"
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="InputMask3"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfConyugeTelefonoMovil"
                                                                runat="server"
                                                                FieldLabel="Teléfono móvil"
                                                                ForceSelection="true"
                                                                Editable="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                EnforceMaxLength="true">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="InputMask4"
                                                                        runat="server"
                                                                        Mask="(999-999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet 
                                                ID="fsConyugeDomicilio" 
                                                runat="server" 
                                                Title="Domicilio" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                <Items>
                                                    <ext:Container 
                                                        ID="cConyugeDomicilioC1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeCalle"
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeCalle.setValue(App.txtfConyugeCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEntreCalles" 
                                                                FieldLabel="Entre Calles" 
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfConyugeEntreCalles.setValue(App.txtfConyugeEntreCalles.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                </ext:Container>
                                                <ext:Container 
                                                    ID="cConyugeDomicilioC2"
                                                    runat="server"
                                                    Layout="ColumnLayout">
                                                    <Defaults>
                                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                        <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                    </Defaults>
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="txtfConyugeNoExterior"
                                                            runat="server"
                                                            FieldLabel="N° Exterior"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            <Listeners>
                                                                <Blur Handler="App.txtfConyugeNoExterior.setValue(App.txtfConyugeNoExterior.getValue().toUpperCase());" />
                                                            </Listeners>
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="txtfConyugeNoInterior"
                                                            runat="server"
                                                            FieldLabel="N° Interior"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            <Listeners>
                                                                <Blur Handler="App.txtfConyugeNoInterior.setValue(App.txtfConyugeNoInterior.getValue().toUpperCase());" />
                                                            </Listeners>
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:Container>
                                                <ext:Container 
                                                    ID="cConyugeDomicilioC3" 
                                                    runat="server"
                                                    Layout="ColumnLayout">
                                                    <Defaults>
                                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                        <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                    </Defaults>
                                                    <Items>
                                                        <ext:ComboBox 
                                                            ID="cmbConyugeEstado"
                                                            runat="server"
                                                            FieldLabel="Estado"
                                                            Editable="true"
                                                            DisplayField="Descripcion"
                                                            ValueField="ID"
                                                            MatchFieldWidth="true"
                                                            ForceSelection="true"
                                                            QueryMode="Local"
                                                            TypeAhead="true"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                            StoreID="sEstados">
                                                            <DirectEvents>
                                                                <Select OnEvent="cmbConyugeEstado_Select">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="valor" Value="App.cmbConyugeEstado.getValue()" Mode="Raw" />
                                                                    </ExtraParams>
                                                                </Select>
                                                            </DirectEvents>
                                                        </ext:ComboBox>
                                                        <ext:ComboBox
                                                            ID="cmbConyugeMunicipio"
                                                            runat="server"
                                                            FieldLabel="Municipio"
                                                            ForceSelection="true"
                                                            Editable="false"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                            AllowBlank="false"
                                                            DisplayField="Descripcion"
                                                            ValueField="ID"
                                                            MatchFieldWidth="true"
                                                            QueryMode="Local"
                                                            TypeAhead="true">
                                                            <Store>
                                                                <ext:Store
                                                                    ID="sConyugeMunicipio"
                                                                    runat="server">
                                                                    <Model>
                                                                        <ext:Model ID="mConyugeMunicipio" runat="server" IDProperty="ID">
                                                                            <Fields>
                                                                                <ext:ModelField Name="ID" Type="String" />
                                                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                                                <ext:ModelField Name="Estado" Type="String" />
                                                                            </Fields>
                                                                        </ext:Model>
                                                                    </Model>
                                                                </ext:Store>
                                                            </Store>
                                                            <DirectEvents>
                                                                <Change OnEvent="cmbConyugeMunicipio_Select">
                                                                    <ExtraParams>
                                                                        <ext:Parameter Name="valor" Value="App.cmbConyugeMunicipio.getValue()" Mode="Raw" />
                                                                    </ExtraParams>
                                                                </Change>
                                                            </DirectEvents>
                                                        </ext:ComboBox>
                                                    </Items>
                                                </ext:Container>
                                                <ext:Container 
                                                    ID="cConyugeDomicilioC4" 
                                                    runat="server"
                                                    Layout="ColumnLayout">
                                                    <Defaults>
                                                        <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                        <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                        <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                    </Defaults>
                                                    <Items>
                                                        <ext:ComboBox
                                                            ID="cmbConyugeColonia"
                                                            runat="server"
                                                            FieldLabel="Colonia"
                                                            DisplayField="Descripcion"
                                                            ValueField="ID"
                                                            AllowBlank="true"
                                                            Editable="true"
                                                            MatchFieldWidth="true"
                                                            ForceSelection="false"
                                                            QueryMode="Local"
                                                            TypeAhead="true"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            <Store>
                                                                <ext:Store
                                                                    ID="sConyugeColonia"
                                                                    runat="server">
                                                                    <Model>
                                                                        <ext:Model ID="mConyugeColonia" runat="server">
                                                                            <Fields>
                                                                                <ext:ModelField Name="ID" Type="String" />
                                                                                <ext:ModelField Name="Descripcion" Type="String" />
                                                                                <ext:ModelField Name="Estado" Type="String" />
                                                                                <ext:ModelField Name="Municipio" Type="String" />
                                                                                <ext:ModelField Name="REstado" Type="String" />
                                                                                <ext:ModelField Name="RMunicipio" Type="String" />
                                                                            </Fields>
                                                                        </ext:Model>
                                                                    </Model>
                                                                     <Sorters>
                                                                        <ext:DataSorter Property="Descripcion" Direction="ASC" />
                                                                    </Sorters>
                                                                </ext:Store>
                                                            </Store>
                                                        </ext:ComboBox>
                                                        <ext:TextField
                                                            ID="txtfConyugeCodigoPostal"
                                                            runat="server"
                                                            StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                            MaxLength="5"
                                                            EnforceMaxLength="true"
                                                            FieldLabel="Código Postal">
                                                            <Plugins>
                                                                <ext:InputMask ID="imConyugeCodigoPostal" runat="server" Mask="ttttt">
                                                                    <MaskSymbols>
                                                                        <ext:MaskSymbol Name="t" Regex="[0-9]" />
                                                                    </MaskSymbols>
                                                                </ext:InputMask>
                                                            </Plugins>
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:Container>
                                            </Items>
                                        </ext:FieldSet>
                                            <ext:FieldSet 
                                                ID="fsConyugeEmpresa" 
                                                runat="server" 
                                                Title="Empresa" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container 
                                                        ID="FieldContainer9" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfConyugeAntiguedad"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                FieldLabel="Antigüedad"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                Width="325"
                                                                LabelWidth="120"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfConyugeIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfConyugeOtrosIngresos"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="Container1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaConceptoOtrosIngresos" 
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer8" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="361" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresa" 
                                                                runat="server" 
                                                                Width="370"
                                                                LabelWidth="120"
                                                                FieldLabel="Empresa" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugePuesto" 
                                                                runat="server"
                                                                EmptyText="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="FieldContainer11" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                Width="325"
                                                                FieldLabel="Jefe Inmediato"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeAPAterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfConyugeEmpresaJefeAMAterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer12" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaCalle"
                                                                runat="server"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer13"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="10" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaNoExterior"
                                                                runat="server"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaNoInterior"
                                                                runat="server"
                                                                FieldLabel="N° Interior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer14" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfConyugeEmpresaCodigoPostal" 
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true">
                                                            </ext:TextField>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeEmpresaColonia"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                ForceSelection="true"
                                                                Editable="false"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="FieldContainer15" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbConyugeEmpresaEstado"
                                                                runat="server"
                                                                FieldLabel="Estado"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                ForceSelection="true"
                                                                Editable="false">
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbConyugeEmpresaMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                ForceSelection="true"
                                                                Editable="false"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pReferencias" 
                                        runat="server" 
                                        Title="Referencias" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:Container 
                                                ID="fcReferencia1"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfInsitucion" 
                                                        runat="server"
                                                        FieldLabel="Nombre Insitución"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoCuenta" 
                                                        runat="server"
                                                        FieldLabel="Tipo Cuenta"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:Container>
                                            <ext:Container 
                                                ID="fcReferencia2" 
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfNoCuenta" 
                                                        runat="server"
                                                        FieldLabel="No. Cuenta"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:Container>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pBienes" 
                                        runat="server" 
                                        Title="Bienes" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:Container 
                                                ID="fcBienes1"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtfUbicacion" 
                                                        runat="server"
                                                        FieldLabel="Ubicación"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmueble" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:Container>
                                            <ext:Container 
                                                ID="fcBienes2"
                                                runat="server"
                                                Layout="ColumnLayout">
                                                <Defaults>
                                                    <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                    <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                    <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                </Defaults>
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripción"
                                                        runat="server"
                                                        FieldLabel="Inscripción"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmueble" 
                                                        runat="server"
                                                        FieldLabel="Valor"
                                                        StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:Container>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pDatosGeneralesAval" 
                                        runat="server" 
                                        Title="Datos Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="FieldSet1" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container
                                                        ID="fcDatosAval1"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtNombreAval"
                                                                runat="server"
                                                                LabelWidth="120"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Nombre"
                                                                Width="200"
                                                                StyleSpec="margin-right: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtApAval"
                                                                runat="server"
                                                                Width="200"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtApMaternoAval"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                Width="200"
                                                                StyleSpec="margin-right: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgSocioCooperativa"
                                                                runat="server"
                                                                LabelWidth="120"
                                                                Width="380"
                                                                StyleSpec="margin-right: 6px;"
                                                                FieldLabel="Es socio">
                                                                <Items>
                                                                    <ext:Radio ID="rSocioSi" runat="server" BoxLabel="Si" Checked="true" />
                                                                    <ext:Radio ID="rSocioNo" runat="server" BoxLabel="No"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval3" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgEstadoCivil"
                                                                runat="server"
                                                                Width="380"
                                                                LabelWidth="120" 
                                                                StyleSpec="margin-right: 6px;"
                                                                FieldLabel="Estado Civil">
                                                                <Items>
                                                                    <ext:Radio ID="rEdoCivilCasado" runat="server" BoxLabel="Casado" Checked="true" />
                                                                    <ext:Radio ID="rEdoCivilSoltero" runat="server" BoxLabel="Soltero"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                            <ext:TextField
                                                                ID="txtOtro"
                                                                runat="server"
                                                                FieldLabel="Otro"
                                                                Width="350"
                                                                StyleSpec="margin-right: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval4" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgRegistroMatAval"
                                                                runat="server"
                                                                Width="480"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px;"
                                                                FieldLabel="Registro Matrimonial">
                                                                <Items>
                                                                    <ext:Radio ID="rSeparadoAval" runat="server" BoxLabel="Bienes Separados" Checked="true" />
                                                                    <ext:Radio ID="rMancomunadoAval" runat="server" BoxLabel="Bienes Mancomunados"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval9" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtTelefonoAval"
                                                                runat="server"
                                                                Width="200"
                                                                LabelWidth="120"
                                                                FieldLabel="Telefono"
                                                                StyleSpec="margin-right: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtCelularAval"
                                                                FieldLabel="Celular"
                                                                runat="server"
                                                                Width="300"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsAvalDomicilio"
                                                runat="server"
                                                Title="Domicilio"
                                                DefaultAnchor="100%">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcDatosAval5" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtCalleAval" 
                                                                runat="server" 
                                                                Width="200"
                                                                LabelWidth="120"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtEntreCallesAval" 
                                                                FieldLabel="Entre Calles" 
                                                                runat="server" 
                                                                Width="300"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval6"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtNExteriorAval"
                                                                runat="server"
                                                                Width="200"
                                                                LabelWidth="120"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtNIntAval"
                                                                FieldLabel="N° Interior"
                                                                runat="server"
                                                                Width="300"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval7"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtCpAval" 
                                                                runat="server" 
                                                                Width="200"
                                                                LabelWidth="120"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true">
                                                            </ext:TextField>
                                                            <ext:ComboBox
                                                                ID="cmbColoniaAval"
                                                                FieldLabel="Colonia"
                                                                runat="server"
                                                                Width="300"
                                                                ForceSelection="true"
                                                                Editable="false">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval8" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbEstadoAval"
                                                                runat="server"
                                                                Width="200"
                                                                FieldLabel="Estado"
                                                                LabelWidth="120"
                                                                StyleSpec="margin-right: 6px;"
                                                                ForceSelection="true"
                                                                Editable="false">
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipioAval"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                Width="300"
                                                                ForceSelection="true"
                                                                Editable="false">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                            <ext:FieldSet
                                                ID="fsOtrosDatos"
                                                runat="server"
                                                Title="Otros Datos">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcDatosAval10" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgTipoCasaAval"
                                                                runat="server"
                                                                Width="500"
                                                                LabelWidth="140"
                                                                FieldLabel="Tipo de casa"
                                                                StyleSpec="margin-right: 6px;">
                                                                <Items>
                                                                    <ext:Radio ID="rPropiaAval" runat="server" BoxLabel="Propia" Checked="true" />
                                                                    <ext:Radio ID="rRentadaAval" runat="server" BoxLabel="Rentada"  />
                                                                    <ext:Radio ID="rFamiliaAval" runat="server" BoxLabel="Familia"  />
                                                                    <ext:Radio ID="rHipotecaAval" runat="server" BoxLabel="Hipoteca"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosAval11" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAntiguedadDocmicilioAval"
                                                                runat="server"
                                                                Width="200"
                                                                LabelWidth="120"
                                                                FieldLabel="Antigüedad en domicilio actual"
                                                                MaxLength="2"
                                                                EnforceMaxLength="true"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pOcupacionAval" 
                                        runat="server" 
                                        Title="Ocupación Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsOcupacionAval"
                                                runat="server"
                                                Title="Empresa">
                                                <Items>
                                                    <ext:Container
                                                        ID="fcOcupacionAval" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresaAval" 
                                                                runat="server"
                                                                FieldLabel="Empresa"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfPuestoAval" 
                                                                runat="server"
                                                                FieldLabel="Puesto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="fcOcupacionAval1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfAvalEmpresaJefeNombre"
                                                                runat="server"
                                                                EmptyText="Nombres"
                                                                FieldLabel="Jefe Inmediato"
                                                                Width="325"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalEmpresaJefeAPAterno"
                                                                runat="server"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfAvalEmpresaJefeAMAterno"
                                                                runat="server"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="200" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="false" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAnitguedadAval"
                                                                runat="server"
                                                                AllowDecimals="false"
                                                                FieldLabel="Antigüedad"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                Width="325"
                                                                LabelWidth="120"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfIngresosAval"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfOtrosIngresosAval"
                                                                runat="server"
                                                                AllowDecimals="true"
                                                                EmptyText="Otros ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="737" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtConceptoIngresosAval" 
                                                                runat="server"
                                                                FieldLabel="Otros ingresos"
                                                                EmptyText="Concepto"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>                                         
                                                    <ext:Container 
                                                        ID="fcOcupacionAval4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgPropietario"
                                                                runat="server"
                                                                Width="737"
                                                                LabelWidth="120" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Propietario"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rSi" runat="server" BoxLabel="Si" Checked="true" />
                                                                    <ext:Radio ID="rNo" runat="server" BoxLabel="No"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcOcupacionAval5"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:RadioGroup
                                                                ID="rgTipo"
                                                                runat="server"
                                                                Width="737"
                                                                LabelWidth="120" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Tipo"
                                                                ColumnsNumber="2"
                                                                ColumnWidth=".91">
                                                                <Items>
                                                                    <ext:Radio ID="rEmpleado" runat="server" BoxLabel="Empleado" Checked="true" />
                                                                    <ext:Radio ID="rGiroComercial" runat="server" BoxLabel="Giro Comercial"  />
                                                                </Items>
                                                            </ext:RadioGroup>
                                                        </Items>
                                                    </ext:Container> 
                                                    <ext:Container 
                                                        ID="fcOcupacionAval6" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                             <ext:TextField 
                                                                ID="txtfAvalEmpresaTelefono" 
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Note="Ejemplo: (449) 999-00-00">
                                                                <Plugins>
                                                                    <ext:InputMask
                                                                        ID="InputMask5"
                                                                        runat="server"
                                                                        Mask="(999) 999-99-99"
                                                                        AllowInvalid="true" />
                                                                </Plugins>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfAvalEmpresaAnterior" 
                                                                runat="server"
                                                                FieldLabel="Empresa Anterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pBienesAval" 
                                        runat="server" 
                                        Title="Bienes del Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsBienes"
                                                runat="server"
                                                Title="Bienes">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcBienesAval1" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfUbicacionAval"
                                                                runat="server"
                                                                FieldLabel="Ubicación"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                            <ext:ComboBox 
                                                                ID="cmbTipoInmuebleAval"
                                                                runat="server"
                                                                FieldLabel="Tipo inmueble"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcBienesAval2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfInscripcionAval" 
                                                                runat="server"
                                                                FieldLabel="Inscripción"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100">
                                                            </ext:TextField>
                                                             <ext:NumberField 
                                                                ID="nfValorInmuebleAval" 
                                                                runat="server"
                                                                FieldLabel="Valor"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="9"
                                                                MinValue="0"
                                                                MaxValue="999999999"
                                                                AllowDecimals="true"
                                                                AllowExponential="true"
                                                                Step="1">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                     <%--Terminado--%>
                                    <%--<ext:Panel 
                                        ID="pDatosOperacion" 
                                        runat="server" 
                                        Title="Datos de Operación" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet
                                                ID="fsDatosOperacion"
                                                runat="server"
                                                Title="Operación">
                                                <Items>
                                                    <ext:Container 
                                                        ID="fcDatosOp" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="AllowExponential" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="AllowDecimals" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Step" Value="1" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="9" Mode="Raw" />
                                                            <ext:Parameter Name="MinValue" Value="0" Mode="Raw" />
                                                            <ext:Parameter Name="MaxValue" Value="999999999" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField 
                                                                ID="nfCantidad"
                                                                runat="server"
                                                                FieldLabel="Cantidad solicitada"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                            <ext:NumberField 
                                                                ID="nfPlazo"
                                                                runat="server"
                                                                FieldLabel="Plazo"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="fcDatosOp2" 
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="AllowBlank" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="Width" Value="365" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="120" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="100" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox 
                                                                ID="cmbFormaPago" 
                                                                runat="server"
                                                                FieldLabel="Forma de pago"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                            <ext:ComboBox 
                                                                ID="cmbDestinoPrestamo" 
                                                                runat="server"
                                                                FieldLabel="Destino préstamo"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>--%>
                                </Items>
                            </ext:TabPanel>
                        </Items>
                        <Listeners>
                            <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                            text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                            iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                                        });
                                                        #{imgbtnGuardar}.setDisabled(!valid);" />
                        </Listeners>
                        <BottomBar>
                            <ext:StatusBar ID="sbSolicitudPrestamo" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
                        </BottomBar>
                        <Buttons>
                            <ext:ImageButton
                                ID="imgbtnGuardar" 
                                runat="server" 
                                ImageUrl="assets/img/controles/Guardar.png" 
                                DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                                OverImageUrl="assets/img/controles/GuardarOver.png" 
                                PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                                ToolTip="Guardar" 
                                Height="50"
                                Width="50"
                                Disabled="true">
                            </ext:ImageButton>
                            <ext:ImageButton
                                ID="imgbtnCancelar"
                                runat="server"
                                ImageUrl="assets/img/controles/Cancelar.png" 
                                DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                                OverImageUrl="assets/img/controles/CancelarOver.png" 
                                PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                                ToolTip="Cancelar" 
                                Height="50" 
                                Width="50">
                                <Listeners>
                                    <Click Handler="window.parent.App.wEmergente.hide();" />
                                </Listeners>
                            </ext:ImageButton>
                        </Buttons>
                    </ext:FormPanel>
                </Items>
            </ext:Panel>
        </div>
    </form>
</body>
</html>