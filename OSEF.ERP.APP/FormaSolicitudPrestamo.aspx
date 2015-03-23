<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSolicitudPrestamo.aspx.cs" Inherits="OSEF.ERP.APP.FormaSolicitudPrestamo" %>

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
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="APaterno" Type="String" />
                        <ext:ModelField Name="AMaterno" Type="String" />
                        <ext:ModelField Name="NombreCompleto" Type="String" />
                        <ext:ModelField Name="TipoInversion" Type="String" />
                        <ext:ModelField Name="UnidadCalculo" Type="Int" />
                        <ext:ModelField Name="TasaInteres" Type="Float" />
                        <ext:ModelField Name="FechaVencimiento" Type="Date" />
                        <ext:ModelField Name="ValorInversion" Type="Float" />
                        <ext:ModelField Name="InstruccionesCapital" Type="String" />
                        <ext:ModelField Name="InstruccionesInteres" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="UsuarioAlta" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                        <ext:ModelField Name="UsuarioModificacion" Type="String" />
                        <ext:ModelField Name="FechaModificacion" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>           
        </ext:Store>

        <div>
            <ext:Panel 
                ID="pSolicitudPrestamo" 
                runat="server" 
                Width="910"
                BodyStyle="background-color:transparent;">
                <Items>
                    <ext:FormPanel 
                        ID="fpSolicitudPrestamo" 
                        runat="server" 
                        Height="525"
                        MonitorResize="true">
                        <Items>
                             <ext:TabPanel 
                                ID="tbSolicitudPrestamo" 
                                runat="server" 
                                ActiveTabIndex="0" 
                                Width="900"
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
                                                        ID="cC1" 
                                                        runat="server"
                                                        AnchorHorizontal="100%" 
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbCliente" 
                                                                runat="server" 
                                                                Width="340" 
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
                                                                FieldLabel="Socio"
                                                                LabelWidth="130">
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
                                                                Width="340"
                                                                Disabled="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cC2" 
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfRFC"
                                                                runat="server"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                LabelWidth="130"
                                                                FieldLabel="RFC">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfRFC.setValue(App.txtfRFC.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:ComboBox
                                                                ID="cmbEstadoCivil"
                                                                runat="server"
                                                                AllowBlank="true"
                                                                Editable="false"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                LabelWidth="130"
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
                                                        ID="cC3"
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfTelefono"
                                                                runat="server"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true"
                                                                Note="Ejemplo: (449) 999-00-00"
                                                                Disabled="false"
                                                                LabelWidth="130"
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
                                                                Width="340"
                                                                FieldLabel="Teléfono móvil"
                                                                Editable="true"
                                                                AllowBlank="true"
                                                                Note="Ejemplo: (044-449) 999-00-00"
                                                                MaxLength="19"
                                                                EnforceMaxLength="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                LabelWidth="130">
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
                                                        ID="cC4"
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCorreo"
                                                                runat="server"
                                                                Width="340"
                                                                Editable="true"
                                                                Vtype="email"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Disabled="false"
                                                                LabelWidth="130"
                                                                FieldLabel="Correo">
                                                            </ext:TextField>
                                                            <ext:TextField
                                                                ID="txtfNacionalidad"
                                                                runat="server"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                LabelWidth="130"
                                                                MaxLength="20"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
                                                                FieldLabel="Nacionalidad">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNacionalidad.setValue(App.txtfNacionalidad.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cC5"
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfDependientes"
                                                                runat="server"
                                                                Width="340"
                                                                MaxLength="2"
                                                                EnforceMaxLength="true"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1"
                                                                FieldLabel="Dependientes"
                                                                LabelWidth="130">
                                                            </ext:NumberField>
                                                            <ext:TextField
                                                                ID="txtfEdades"
                                                                runat="server"
                                                                Width="340"
                                                                FieldLabel="Edades"
                                                                LabelWidth="130"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container 
                                                        ID="cC6" 
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
                                                        ID="cC7"
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
                                                        ID="cC8"
                                                        runat="server"
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nAnosDomicilioActual"
                                                                runat="server"
                                                                Width="340"
                                                                MaxLength="2"
                                                                EnforceMaxLength="true"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1"
                                                                FieldLabel="Antigüedad domicilio"
                                                                LabelWidth="130">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                    <%-- Terminado --%>
                                    <ext:Panel
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
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalle" 
                                                                runat="server" 
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalle.setValue(App.txtfCalle.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCalles"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                LabelWidth="130"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                AllowBlank="true">
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
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExterior"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExterior.setValue(App.txtfNoExterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInterior"
                                                                FieldLabel="N° Interior"
                                                                LabelWidth="130"
                                                                runat="server"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true"
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
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostal"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
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
                                                                Width="340"
                                                                FieldLabel="Estado"
                                                                LabelWidth="130"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                AllowBlank="false"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false"
                                                                StoreID="sEstados">
                                                                <DirectEvents>
                                                                    <Select OnEvent="cmbEstado_Select">
                                                                        <ExtraParams>
                                                                            <ext:Parameter Name="valor" Value="App.cmbEstado.getValue()" Mode="Raw" />
                                                                        </ExtraParams>
                                                                    </Select>
                                                                </DirectEvents>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cDomicilioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipio"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                AllowBlank="false"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                ValueField="ID"
                                                                DisplayField="Descripcion"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
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
                                                                    </ext:Store>
                                                                </Store>
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                LabelWidth="130"
                                                                Width="340"
                                                                AllowBlank="false"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true"
                                                                Disabled="false">
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
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfCalleAnterior" 
                                                                runat="server" 
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Calle"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfCalleAnterior.setValue(App.txtfCalleAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfEntreCallesAnterior"
                                                                runat="server"
                                                                FieldLabel="Entre Calles"
                                                                LabelWidth="130"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true"
                                                                Disabled="false"
                                                                AllowBlank="true">
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
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfNoExteriorAnterior"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="N° Exterior"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
                                                                Disabled="false">
                                                                <Listeners>
                                                                    <Blur Handler="App.txtfNoExteriorAnterior.setValue(App.txtfNoExteriorAnterior.getValue().toUpperCase());" />
                                                                </Listeners>
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtfNoInteriorAnterior"
                                                                FieldLabel="N° Interior"
                                                                LabelWidth="130"
                                                                runat="server"
                                                                Width="340"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="10"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="true"
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
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfCodigoPostalAnterior"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                EnforceMaxLength="true"
                                                                AllowBlank="false"
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
                                                                Width="340"
                                                                FieldLabel="Estado"
                                                                LabelWidth="130"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                AllowBlank="false"
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
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbMunicipioAnterior"
                                                                runat="server"
                                                                Width="340"
                                                                LabelWidth="130"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                AllowBlank="false"
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
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbColoniaAnterior"
                                                                runat="server"
                                                                FieldLabel="Colonia"
                                                                LabelWidth="130"
                                                                Width="340"
                                                                DisplayField="Descripcion"
                                                                ValueField="ID"
                                                                AllowBlank="false"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                ForceSelection="true"
                                                                QueryMode="Local"
                                                                TypeAhead="true">
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
<%--                                                                        <Listeners>
                                                                            <Load Fn="sColonias_Load" />
                                                                        </Listeners>--%>
                                                                    </ext:Store>
                                                                </Store>
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
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
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfEmpresa" 
                                                                runat="server"
                                                                FieldLabel="Empresa"
                                                                Width="686"
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
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
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
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
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
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaCodigoPostal"
                                                                runat="server"
                                                                FieldLabel="Código Postal"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="5"
                                                                AllowBlank="false"
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
                                                                AllowBlank="false"
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
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
                                                            <ext:Parameter Name="ForceSelection" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="QueryMode" Value="Local" Mode="Value" />
                                                            <ext:Parameter Name="TypeAhead" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaMunicipio"
                                                                runat="server"
                                                                FieldLabel="Municipio"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                AllowBlank="false"
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
                                                            </ext:ComboBox>
                                                            <ext:ComboBox
                                                                ID="cmbEmpresaColonia"
                                                                runat="server"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                FieldLabel="Colonia"
                                                                AllowBlank="false"
                                                                Editable="true"
                                                                MatchFieldWidth="true"
                                                                Disabled="false">
                                                            </ext:ComboBox>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaC6"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="Width" Value="340" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="130" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfEmpresaTelefono"
                                                                runat="server"
                                                                FieldLabel="Teléfono"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                Editable="true"
                                                                MaxLength="15"
                                                                AllowBlank="true"
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
                                                            <ext:Parameter Name="Width" Value="225" Mode="Raw" />
                                                            <ext:Parameter Name="LabelWidth" Value="90" Mode="Raw" />
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:NumberField
                                                                ID="nfAntiguedad"
                                                                runat="server"
                                                                FieldLabel="Antigüedad"
                                                                Width="224"
                                                                MaxLength="2"
                                                                MinValue="0"
                                                                MaxValue="99"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="false"
                                                                Step="1">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfIngresos"
                                                                runat="server"
                                                                FieldLabel="Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="true"
                                                                Step="1">
                                                            </ext:NumberField>
                                                            <ext:NumberField
                                                                ID="nfOtrosIngresos"
                                                                runat="server"
                                                                FieldLabel="Otros Ingresos"
                                                                MaxLength="6"
                                                                MinValue="0"
                                                                MaxValue="999999"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowDecimals="true"
                                                                Step="1">
                                                            </ext:NumberField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC2"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfOtrosIngresos" 
                                                                runat="server" 
                                                                Width="686"
                                                                LabelWidth="170"
                                                                FieldLabel="Concepto otros ingresos"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC3"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Defaults>
                                                            <ext:Parameter Name="EnforceMaxLength" Value="true" Mode="Raw" />
                                                            <ext:Parameter Name="MaxLength" Value="50" Mode="Raw" />
                                                        </Defaults>
                                                        <Items>
                                                            <ext:TextField
                                                                ID="txtfJefeNombre"
                                                                runat="server"
                                                                FieldLabel="Jefe Inmediato"
                                                                LabelWidth="90"
                                                                Width="298"
                                                                EmptyText="Nombres"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAPaterno"
                                                                runat="server"
                                                                Width="188"
                                                                EmptyText="Apellido paterno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                             <ext:TextField
                                                                ID="txtfJefeAMaterno"
                                                                runat="server"
                                                                Width="188"
                                                                EmptyText="Apellido materno"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                AllowBlank="false">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                    <ext:Container
                                                        ID="cEmpresaSocioC4"
                                                        runat="server"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                            <ext:TextField 
                                                                ID="txtfPuesto" 
                                                                runat="server"
                                                                FieldLabel="Puesto"
                                                                LabelWidth="90"
                                                                Width="300" 
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                            <ext:TextField 
                                                                ID="txtEmpresaAnterior" 
                                                                runat="server" 
                                                                Width="380"
                                                                FieldLabel="Empresa anterior"
                                                                LabelWidth="100"
                                                                StyleSpec="margin-right: 6px; margin-bottom: 6px;"
                                                                MaxLength="100"
                                                                EnforceMaxLength="true">
                                                            </ext:TextField>
                                                        </Items>
                                                    </ext:Container>
                                                </Items>
                                            </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosConyugue" 
                                        runat="server" 
                                        Title="Datos Conyugue" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldSet 
                                                ID="fsDatosGeneralesConyuge" 
                                                runat="server" 
                                                Title="Datos Generales" 
                                                DefaultAnchor="100%">
                                                <Items>
                                                     <ext:FieldContainer
                                                        ID="FieldContainer1" 
                                                        runat="server" 
                                                        LabelWidth="120" 
                                                        AnchorHorizontal="100%" 
                                                        Layout="ColumnLayout"
                                                        FieldLabel="Nombre">
                                                        <Items>
                                                        <ext:TextField
                                                        ID="TextField1"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                        ID="TextField6"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        <ext:TextField
                                                        ID="TextField7"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                        </ext:TextField>
                                                        </Items>
                                                    </ext:FieldContainer>
                                                       <ext:FieldContainer 
                                                        ID="FieldContainer2" 
                                                        runat="server" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Fecha Nacimiento" 
                                                        AnchorHorizontal="100%"
                                                        Layout="ColumnLayout">
                                                        <Items>
                                                        <ext:DateField
                                                        ID="NumberField1"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="200">
                                                        <PickerOptions 
                                                            ID="poFechaNacimiento"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                        </ext:DateField>
                                                        <ext:NumberField
                                                        ID="NumberField2"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Edad"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                        </ext:NumberField>
                                                        <ext:TextField
                                                        ID="NumberField3"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="RFC">
                                                        </ext:TextField>
                                                        </Items>
                                                    </ext:FieldContainer>
                                                </Items>
                                            </ext:FieldSet>


                                                <ext:FieldSet 
                                                ID="FieldSet1" 
                                                runat="server" 
                                                Title="Domicilio" 
                                                DefaultAnchor="100%"
                                                AutoScroll="false">
                                                 <Items>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer3" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Calle" 
                                                    AnchorHorizontal="100%"
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField8" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField9" 
                                                            FieldLabel="Entre Calles" 
                                                            runat="server" 
                                                            Width="300"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer4" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="N° Exterior"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField10"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField11"
                                                            FieldLabel="N° Interior"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer5" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Código Postal"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField12" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="5"
                                                            EnforceMaxLength="true"
                                                            AllowBlank="true">
                                                        </ext:TextField>
                                                        <ext:ComboBox
                                                            ID="ComboBox1"
                                                            FieldLabel="Colonia"
                                                            runat="server"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer6" 
                                                    runat="server"
                                                    LabelWidth="120" 
                                                    FieldLabel="Estado" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:ComboBox 
                                                            ID="ComboBox2"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                        <ext:ComboBox
                                                            ID="ComboBox3"
                                                            runat="server"
                                                            FieldLabel="Municipio"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                    </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer7" 
                                                    runat="server" 
                                                    LabelWidth="120"
                                                    FieldLabel="Telefono"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField13"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField14"
                                                            FieldLabel="Celular"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>

                                                </Items>
                                                </ext:FieldSet>

                                                  <ext:FieldSet 
                                                ID="FieldSet2" 
                                                runat="server" 
                                                Title="Empresa" 
                                                DefaultAnchor="100%">
                                                 <Items>
                                                <ext:FieldContainer 
                                                ID="FieldContainer8" 
                                                runat="server" 
                                                FieldLabel="Empresa"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField15" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="TextField16" 
                                                        runat="server"
                                                        FieldLabel="Puesto" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainer9" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Antigüedad" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="NumberField4"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="NumberField5"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="NumberField6"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Otros Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="FieldContainer10" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Concepto" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField17" 
                                                        runat="server" 
                                                        Width="406" 
                                                        EmptyText="Concepto Otros Ingresos"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                   
                                                </Items>
                                            </ext:FieldContainer>                                         
                                            <ext:FieldContainer
                                                ID="FieldContainer11" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Jefe Inmediato">
                                                <Items>
                                                    <ext:TextField
                                                        ID="TextField18"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField19"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField20"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>

                                            <ext:FieldContainer 
                                                    ID="FieldContainer12" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Calle" 
                                                    AnchorHorizontal="100%"
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField21" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField22" 
                                                            FieldLabel="Entre Calles" 
                                                            runat="server" 
                                                            Width="300"
                                                            MaxLength="100"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer13" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="N° Exterior"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField23"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                        <ext:TextField 
                                                            ID="TextField24"
                                                            FieldLabel="N° Interior"
                                                            runat="server"
                                                            Width="300"
                                                            MaxLength="10"
                                                            EnforceMaxLength="true">
                                                        </ext:TextField>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer14" 
                                                    runat="server" 
                                                    LabelWidth="120" 
                                                    FieldLabel="Código Postal"
                                                    AnchorHorizontal="100%" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:TextField 
                                                            ID="TextField25" 
                                                            runat="server" 
                                                            Width="200" 
                                                            StyleSpec="margin-right: 6px;"
                                                            MaxLength="5"
                                                            EnforceMaxLength="true"
                                                            AllowBlank="true">
                                                        </ext:TextField>
                                                        <ext:ComboBox
                                                            ID="ComboBox4"
                                                            FieldLabel="Colonia"
                                                            runat="server"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                </ext:FieldContainer>
                                                    <ext:FieldContainer 
                                                    ID="FieldContainer15" 
                                                    runat="server"
                                                    LabelWidth="120" 
                                                    FieldLabel="Estado" 
                                                    Layout="ColumnLayout">
                                                    <Items>
                                                        <ext:ComboBox 
                                                            ID="ComboBox5"
                                                            runat="server"
                                                            Width="200"
                                                            StyleSpec="margin-right: 6px;"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                        <ext:ComboBox
                                                            ID="ComboBox6"
                                                            runat="server"
                                                            FieldLabel="Municipio"
                                                            Width="300"
                                                            ForceSelection="true"
                                                            Editable="false">
                                                        </ext:ComboBox>
                                                    </Items>
                                                    </ext:FieldContainer>
                                                </Items>
                                                </ext:FieldSet>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pReferencias" 
                                        runat="server" 
                                        Title="Referencias" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                        <ext:FieldContainer 
                                                ID="fcReferencia1" 
                                                runat="server" 
                                                FieldLabel="Nombre Insitución"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInsitucion" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoCuenta" 
                                                        runat="server"
                                                        FieldLabel="Tipo Cuenta" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        <ext:FieldContainer 
                                                ID="fcReferencia2" 
                                                runat="server" 
                                                FieldLabel="No. Cuenta"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtNoCuenta" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienes" 
                                        runat="server" 
                                        Title="Bienes" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcBienes1" 
                                                runat="server" 
                                                FieldLabel="Ubicación"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtUbicacion" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmueble" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                         <ext:FieldContainer 
                                                ID="fcBienes2" 
                                                runat="server" 
                                                FieldLabel="Inscripción"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripción" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmueble" 
                                                        runat="server"
                                                        FieldLabel="Valor" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosgeneralesAval" 
                                        runat="server" 
                                        Title="Datos Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                            <ext:FieldContainer
                                                ID="fcDatosAval1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Nombre">
                                                <Items>
                                                    <ext:TextField
                                                        ID="txtNombreAval"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApAval"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="txtApMaternoAval"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgSocioCooperativa"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Es socio">
                                                        <Items>
                                                            <ext:Radio ID="rSocioSi" runat="server" BoxLabel="Si" Checked="true" />
                                                            <ext:Radio ID="rSocioNo" runat="server" BoxLabel="No"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval3" 
                                                runat="server"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval4" 
                                                runat="server"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%" 
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval5" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Calle" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtCalleAval" 
                                                        runat="server" 
                                                        Width="200" 
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval6" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="N° Exterior"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtNExteriorAval"
                                                        runat="server"
                                                        Width="200"
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval7" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Código Postal"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtCpAval" 
                                                        runat="server" 
                                                        Width="200" 
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval8" 
                                                runat="server"
                                                LabelWidth="120"
                                                FieldLabel="Estado" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbEstadoAval"
                                                        runat="server"
                                                        Width="200"
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval9" 
                                                runat="server" 
                                                LabelWidth="120"
                                                FieldLabel="Telefono"
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtTelefonoAval"
                                                        runat="server"
                                                        Width="200"
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
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval10" 
                                                runat="server"
                                                LabelWidth="120"  
                                                FieldLabel="Tipo de casa" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipoCasaAval"
                                                        runat="server"
                                                        Width="500"
                                                        LabelWidth="140"
                                                        StyleSpec="margin-right: 6px;">
                                                        <Items>
                                                            <ext:Radio ID="rPropiaAval" runat="server" BoxLabel="Propia" Checked="true" />
                                                            <ext:Radio ID="rRentadaAval" runat="server" BoxLabel="Rentada"  />
                                                            <ext:Radio ID="rFamiliaAval" runat="server" BoxLabel="Familia"  />
                                                            <ext:Radio ID="rHipotecaAval" runat="server" BoxLabel="Hipoteca"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosAval11" 
                                                runat="server" 
                                                FieldLabel="Antigüedad en domicilio actual"
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfAntiguedadDocmicilioAval"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pOcupacionAval" 
                                        runat="server" 
                                        Title="Ocupación Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval" 
                                                runat="server" 
                                                FieldLabel="Empresa"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtEmpresaAval" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:TextField 
                                                        ID="txtPruesto" 
                                                        runat="server"
                                                        FieldLabel="Puesto" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer
                                                ID="fcOcupacionAval1" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                AnchorHorizontal="100%" 
                                                Layout="ColumnLayout"
                                                FieldLabel="Jefe Inmediato">
                                                <Items>
                                                    <ext:TextField
                                                        ID="TextField2"
                                                        runat="server"
                                                        EmptyText="Nombres"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField3"
                                                        runat="server"
                                                        Width="200"
                                                        EmptyText="Apellido Paterno"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                                     <ext:TextField
                                                        ID="TextField4"
                                                        runat="server"
                                                        EmptyText="Apellido Materno"
                                                        Width="200"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowBlank="false">
                                                    </ext:TextField>
                                            </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval2" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Antigüedad" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField
                                                        ID="nfAnitguedadAval"
                                                        runat="server"
                                                        Width="200"
                                                        MaxLength="2"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="99"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="false"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfIngresosAval"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField
                                                        ID="nfOtrosIngresosAval"
                                                        runat="server"
                                                        Width="200"
                                                        FieldLabel="Otros Ingresos"
                                                        MaxLength="6"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999"
                                                        StyleSpec="margin-right: 6px;"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval3" 
                                                runat="server" 
                                                LabelWidth="120" 
                                                FieldLabel="Concepto" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtConceptoIngresosAval" 
                                                        runat="server" 
                                                        Width="406" 
                                                        EmptyText="Concepto Otros Ingresos"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:TextField 
                                                        ID="txtTelefonoOcupacionAval" 
                                                        runat="server"
                                                        FieldLabel="Teléfono" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EmptyText="Tel. Empresa"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>                                         
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval4" 
                                                runat="server" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgPropietario"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Propietario">
                                                        <Items>
                                                            <ext:Radio ID="rSi" runat="server" BoxLabel="Si" Checked="true" />
                                                            <ext:Radio ID="rNo" runat="server" BoxLabel="No"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer>
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval5" 
                                                runat="server" 
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:RadioGroup
                                                        ID="rgTipo"
                                                        runat="server"
                                                        Width="380"
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        FieldLabel="Tipo">
                                                        <Items>
                                                            <ext:Radio ID="rEmpleado" runat="server" BoxLabel="Empleado" Checked="true" />
                                                            <ext:Radio ID="rGiroComercial" runat="server" BoxLabel="Giro Comercial"  />
                                                        </Items>
                                                    </ext:RadioGroup>
                                                </Items>
                                            </ext:FieldContainer> 
                                           <ext:FieldContainer 
                                                ID="fcOcupacionAval6" 
                                                runat="server" 
                                                FieldLabel="Empresa Anterior"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="TextField5" 
                                                        runat="server" 
                                                        Width="406" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                </Items>
                                            </ext:FieldContainer>

                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pBienesAval" 
                                        runat="server" 
                                        Title="Bienes del Aval" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcBienesAval1" 
                                                runat="server" 
                                                FieldLabel="Ubicación"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtUbicacionAval" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                    <ext:ComboBox 
                                                        ID="cmbTipoInmuebleAval" 
                                                        runat="server"
                                                        FieldLabel="Tipo Inmueble" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcBienesAval2" 
                                                runat="server" 
                                                FieldLabel="Inscripción"
                                                LabelWidth="120"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:TextField 
                                                        ID="txtInscripcionAval" 
                                                        runat="server" 
                                                        Width="300" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:TextField>
                                                     <ext:NumberField 
                                                        ID="nfValorInmuebleAval" 
                                                        runat="server"
                                                        FieldLabel="Valor" 
                                                        Width="306" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="9"
                                                        EnforceMaxLength="true"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                     <%--Terminado--%>
                                    <ext:Panel 
                                        ID="pDatosOperacion" 
                                        runat="server" 
                                        Title="Datos de Operación" 
                                        BodyPadding="10" 
                                        AutoScroll="true">
                                        <Items>
                                         <ext:FieldContainer 
                                                ID="fcDatosOp" 
                                                runat="server" 
                                                FieldLabel="Cantidad Solicitada"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:NumberField 
                                                        ID="nfcantidadSol" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        EnforceMaxLength="true"
                                                        MaxLength="9"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                    <ext:NumberField 
                                                        ID="nfPlazo" 
                                                        runat="server"
                                                        FieldLabel="Plazo" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        StyleSpec="margin-right: 6px;"
                                                        EnforceMaxLength="true"
                                                        MaxLength="9"
                                                        MinValue="0"
                                                        MaxValue="999999999"
                                                        AllowDecimals="true"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Items>
                                            </ext:FieldContainer>
                                            <ext:FieldContainer 
                                                ID="fcDatosOp2" 
                                                runat="server" 
                                                FieldLabel="Forma de Pago"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:ComboBox 
                                                        ID="cmbFormaPago" 
                                                        runat="server" 
                                                        Width="200" 
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                     <ext:ComboBox 
                                                        ID="cmbDestinoPrestamo" 
                                                        runat="server" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Destino Préstamo"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>

                                            <ext:FieldContainer 
                                                ID="fcUserFecha" 
                                                runat="server" 
                                                FieldLabel="Fecha Movimiento"
                                                LabelWidth="140"  
                                                AnchorHorizontal="100%"
                                                Layout="ColumnLayout">
                                                <Items>
                                                    <ext:DateField
                                                        ID="dfFechaMovimiento"
                                                        runat="server"
                                                        StyleSpec="margin-right: 6px;"
                                                        Width="200">
                                                        <PickerOptions 
                                                            ID="PickerOptions1"
                                                            runat="server"
                                                            Cls="my-date-picker">
                                                        </PickerOptions>
                                                     </ext:DateField>
                                                     <ext:ComboBox 
                                                        ID="cmbUser" 
                                                        runat="server" 
                                                        Width="326" 
                                                        LabelWidth="120" 
                                                        FieldLabel="Usuario"
                                                        StyleSpec="margin-right: 6px;"
                                                        MaxLength="100"
                                                        EnforceMaxLength="true">
                                                    </ext:ComboBox>
                                                </Items>
                                            </ext:FieldContainer>
                                        </Items>
                                    </ext:Panel>
                                </Items>
                            </ext:TabPanel>
                        </Items>
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