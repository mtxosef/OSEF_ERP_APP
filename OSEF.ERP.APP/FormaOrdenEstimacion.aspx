<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaOrdenEstimacion.aspx.cs" Inherits="OSEF.ERP.APP.FormaOrdenesEstimaciones" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
       <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <link rel="stylesheet" href="css/xMask.css" />
    <link rel="stylesheet" href="css/xDatePicker.css" />
    <link rel="stylesheet" href="css/xSplitButton.css" />
    <link rel="stylesheet" href="css/xGridPanel.css" />
    <link rel="stylesheet" href="css/xWindowPopup.css" />
    <link rel="stylesheet" href="css/xTabPanel.css"/>
    <link rel="stylesheet" href="css/xComboBox.css"/>
    <link rel="stylesheet" href="css/xCustomChart.css"/>
    <link rel="stylesheet" href="css/xIcons.css"/>
    <link rel="stylesheet" href="css/xToolbar.css"/>
    <link rel="stylesheet" href="css/xLabel.css"/>
    <link rel="stylesheet" href="css/xTreePanel.css"/>
    <link rel="stylesheet" href="css/xHiperlink.css"/>
    <link rel="stylesheet" href="css/xTextField.css"/>
    <link rel="stylesheet" href="css/xFieldSet.css"/>
    <link rel="stylesheet" href="css/xPanel.css"/>
    <link rel="stylesheet" href="css/xButton.css"/>
    <script type='text/javascript' src="js/formaOrdenEstimacion.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmFormaOrdenEstimacion" runat="server" HideInDesign="true" />
    
        <ext:Store
            ID="sOrdenEstimacion"
            runat="server">
            <Model>
                <ext:Model
                    ID="mOrdenEstimacion"
                    runat="server"
                    IDProperty="ID">
                    <Fields>
                        <ext:ModelField Name="ID" Type="Int" />
                        <ext:ModelField Name="Mov" Type="String" />
                        <ext:ModelField Name="MovID" Type="String" />
                        <ext:ModelField Name="Sucursal" Type="String" />
                        <ext:ModelField Name="FechaEmision" Type="Date" />
                        <ext:ModelField Name="Observaciones" Type="String" />
                        <ext:ModelField Name="Estatus" Type="String" />
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="RSucursal" Type="Object" />
                        <ext:ModelField Name="Origen" Type="String" />
                        <ext:ModelField Name="OrigenId" Type="String" />

                        <ext:ModelField Name="Reporte" Type="String" />
                        <ext:ModelField Name="Division" Type="String" />
                        <ext:ModelField Name="FechaOrigen" Type="Date" />
                        <ext:ModelField Name="FechaMaximaAtencion" Type="Date" />
                        <ext:ModelField Name="DiasAtencion" Type="Float" />
                        <ext:ModelField Name="Reporto" Type="String" />
                        <ext:ModelField Name="TrabajoRequerido" Type="String" />
                        <ext:ModelField Name="Atiende" Type="String" />
                    </Fields>
                </ext:Model>
            </Model>
            <Listeners>
                <Load Fn="sOrdenesMantenimiento_Load" />
                <Add Fn="sOrdenesMantenimiento_Add" />
            </Listeners>
        </ext:Store>

        <ext:FormPanel
            ID="fpOrdenEstimacion"
            runat="server" 
            MonitorResize="true"
            Height="555"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar 
                    ID="tbOrdenEstimacion" 
                    runat="server" 
                    Height="40">
                    <Items>
                        <ext:ImageButton 
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="assets/img/controles/nuevo-disable.png"
                            OverImageUrl="assets/img/controles/nuevo-over.png"
                            PressedImageUrl="assets/img/controles/nuevo-pressed.png"
                            ToolTip="Nuevo"
                            Height="30"
                            Width="30">
                             <Listeners>
                                <Click Fn="imgbtnFormaNuevo_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAbrir"
                            runat="server"
                            ImageUrl="assets/img/controles/AbrirNormal.png"
                            DisabledImageUrl="assets/img/controles/AbrirDisabled.png"
                            OverImageUrl="assets/img/controles/AbrirOver.png"
                            PressedImageUrl="assets/img/controles/AbrirPressed.png"
                            ToolTip="Abrir"
                            Height="30"
                            Width="30">
                            <Listeners>
                                <Click Fn="imgbtnAbrir_Click" />
                            </Listeners>
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnGuardar"
                            runat="server"
                            ImageUrl="assets/img/controles/SaveNormal.png"
                            DisabledImageUrl="assets/img/controles/SaveDisabled.png"
                            OverImageUrl="assets/img/controles/SaveOver.png"
                            PressedImageUrl="assets/img/controles/SavePressed.png"
                            ToolTip="Guardar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Guardardo información..." />
                                    <ExtraParams>
                                        <ext:Parameter Name="OrdenEstimacionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacion" Value="Ext.encode(#{sOrdenEstimacion}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacionD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="Sucursal" Value="App.cmbSucursal.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="diasAtencion" Value="App.nfDiasAtencion.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnInfo"
                            runat="server"
                            ImageUrl="assets/img/controles/InfoNormal.png"
                            DisabledImageUrl="assets/img/controles/InfoDisabled.png"
                            OverImageUrl="assets/img/controles/InfoOver.png"
                            PressedImageUrl="assets/img/controles/InfoPressed.png"
                            ToolTip="Información"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAfectar"
                            runat="server"
                            ImageUrl="assets/img/controles/AfectarNormal.png"
                            DisabledImageUrl="assets/img/controles/AfectarDisabled.png"
                            OverImageUrl="assets/img/controles/AfectarOver.png"
                            PressedImageUrl="assets/img/controles/AfectarPressed.png"
                            ToolTip="Afectar" 
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnAfectar_Click"  Before="imgbtnAfectar_Click_Before" Success="imgbtnAfectar_Click_Success">
                                    <EventMask ShowMask="true" Msg="Afectando movimiento..." />
                                     <ExtraParams>
                                        <ext:Parameter Name="OrdenEstimacionForma" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacion" Value="Ext.encode(#{sOrdenEstimacion}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="OrdenEstimacionD" Value="Ext.encode(#{sConceptos}.getRecordsValues())" Mode="Raw" />
                                        <ext:Parameter Name="Movimiento" Value="App.cmbMov.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="Sucursal" Value="App.cmbSucursal.getValue()" Mode="Raw" />
                                        <ext:Parameter Name="diasAtencion" Value="App.nfDiasAtencion.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Click>
                            </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAutorizar"
                            runat="server"
                            ImageUrl="assets/img/controles/AutorizarNormal.png"
                            DisabledImageUrl="assets/img/controles/AutorizarDisabled.png"
                            OverImageUrl="assets/img/controles/AutorizarOver.png"
                            PressedImageUrl="assets/img/controles/AutorizarPressed.png"
                            ToolTip="Autorizar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnImprimir"
                            runat="server"
                            ImageUrl="assets/img/controles/ImprimirNormal.png"
                            DisabledImageUrl="assets/img/controles/ImprimirDisabled.png"
                            OverImageUrl="assets/img/controles/ImprimirOver.png"
                            PressedImageUrl="assets/img/controles/ImprimirPressed.png"
                            ToolTip="Imprimir"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ToolbarSpacer
                            ID="tbsPrimerEspacio"
                            runat="server"
                            Width="190">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton
                            ID="imgbtnBorrar"
                            runat="server"
                            ImageUrl="assets/img/controles/delete-normal.png"
                            DisabledImageUrl="assets/img/controles/delete-disable.png"
                            OverImageUrl="assets/img/controles/delete-over.png"
                            PressedImageUrl="assets/img/controles/delete-pressed.png"
                            ToolTip="Borrar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                            <DirectEvents>
                                <Click OnEvent="imgbtnBorrar_Click" Success="imgbtnBorrar_Click_Success">
                                    <Confirmation
                                        ConfirmRequest="true"
                                        Title="Eliminar"
                                        Message="¿Deseas eliminar el registro?">
                                    </Confirmation>
                                    <EventMask
                                        ShowMask="true"
                                        Target="CustomTarget"
                                        Msg="Eliminando registro">
                                    </EventMask>
                                </Click>
                             </DirectEvents>
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnCancelar"
                            runat="server"
                            ImageUrl="assets/img/controles/Cancelar.png"
                            DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                            OverImageUrl="assets/img/controles/CancelarOver.png"
                            PressedImageUrl="assets/img/controles/CancelarPressed.png"
                            ToolTip="Cancelar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                             <DirectEvents>
                                <Click OnEvent="imgbtnCancelar_Click" Success="imgbtnCancelar_Click_Success">
                                    <Confirmation
                                        ConfirmRequest="true"
                                        Title="Eliminar"
                                        Message="¿Deseas cancelar el movimiento?">
                                    </Confirmation>
                                    <EventMask
                                        ShowMask="true"
                                        Target="CustomTarget"
                                        Msg="Cancelando registro">
                                    </EventMask>
                                </Click>
                             </DirectEvents>
                        </ext:ImageButton>
                        <ext:ToolbarSpacer
                            ID="tbsSegundoEspacio"
                            runat="server"
                            Width="190">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton 
                            ID="imgbtnPrimero"
                            runat="server"
                            ImageUrl="assets/img/controles/PrimeroNormal.png"
                            DisabledImageUrl="assets/img/controles/PrimeroDisabled.png"
                            OverImageUrl="assets/img/controles/PrimeroOver.png"
                            PressedImageUrl="assets/img/controles/PrimeroPressed.png"
                            ToolTip="Primero"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAnterior"
                            runat="server"
                            ImageUrl="assets/img/controles/AnteriorNormal.png"
                            DisabledImageUrl="assets/img/controles/AnteriorDisabled.png"
                            OverImageUrl="assets/img/controles/AnteriorOver.png"
                            PressedImageUrl="assets/img/controles/AnteriorPressed.png"
                            ToolTip="Anterior"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnSiguiente"
                            runat="server"
                            ImageUrl="assets/img/controles/SiguienteNormal.png"
                            DisabledImageUrl="assets/img/controles/SiguienteDisabled.png"
                            OverImageUrl="assets/img/controles/SiguienteOver.png"
                            PressedImageUrl="assets/img/controles/SiguientePressed.png"
                            ToolTip="Siguiente"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnUltimo"
                            runat="server"
                            ImageUrl="assets/img/controles/UltimoNormal.png"
                            DisabledImageUrl="assets/img/controles/UltimoDisabled.png"
                            OverImageUrl="assets/img/controles/UltimoOver.png"
                            PressedImageUrl="assets/img/controles/UltimoPressed.png"
                            ToolTip="Ultimo"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Items>
             <ext:TabPanel
                    ID="tpContenedor"
                    runat="server" 
                    ActiveTabIndex="0" 
                    Plain="true" 
                    Cls="custotabpanel xchris">
                    <Items>
                         <ext:Panel 
                    ID="pDatosGenerales" 
                    runat="server" 
                    Title="Datos Generales"
                    BodyPadding="5"
                    Width="900"
                    Height="206" 
                    AutoScroll="false">
                    <Items>
                        <ext:FieldSet 
                            ID="fsDivisorDatos" 
                            runat="server" 
                            Title="Datos Generales" 
                            DefaultAnchor="100%"
                            AutoScroll="false">
                            <Items>
                                <ext:FieldContainer 
                                    ID="fcMvomiento"
                                    runat="server"
                                    FieldLabel="Movimiento"
                                    LabelWidth="120"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:ComboBox 
                                            ID="cmbMov"
                                            runat="server"
                                            Width="200"
                                            Margins="0 3 0 0"
                                            Editable="false"
                                            AllowBlank="false"
                                            DisplayField="Nombre"
                                            ValueField="ID">
                                            <Store>
                                                <ext:Store ID="sMov" runat="server">
                                                    <Model>
                                                        <ext:Model ID="mMov" runat="server" IDProperty="ID">
                                                            <Fields>
                                                                <ext:ModelField Name="ID" Type="String" />
                                                                <ext:ModelField Name="Nombre" Type="String" />
                                                            </Fields>
                                                        </ext:Model>
                                                    </Model>
                                                    <Listeners>
                                                        <Add Fn="sMov_Add" />
                                                    </Listeners>
                                                </ext:Store>
                                            </Store>
                                            <Items>
                                                <ext:ListItem Index="0" Text="Mesa de reporte" Value="Mesa de reporte" />
                                                <ext:ListItem Index="1" Text="Orden de Cambio" Value="Orden de Cambio" />
                                            </Items>
                                            <Listeners>
                                                <Select Fn="cmbMov_Select" />
                                                <Change Fn="sMov_Change"></Change>
                                            </Listeners>
                                        </ext:ComboBox>
                                        <ext:TextField
                                            ID="txtfMovID"
                                            runat="server"
                                            Width="110"
                                            Margins="0 3 0 0"
                                            Disabled="true" />
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    ID="fcSucursal"
                                    runat="server"
                                    FieldLabel="Sucursal"
                                    AnchorHorizontal="100%"
                                    LabelWidth="120"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:ComboBox
                                            ID="cmbSucursal"
                                            runat="server"
                                            DisplayField="CR"
                                            ValueField="ID"
                                            Width="200"
                                            Margins="0 3 0 0"
                                            Cls="spanCustomCombo xEspacioCmbxCustom"
                                            AllowBlank="false"
                                            PageSize="10"
                                            ForceSelection="true"
                                            MatchFieldWidth="false"
                                            QueryMode="Local"
                                            TypeAhead="true">
                                            <ListConfig ID="lcSucursal" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                                                <ItemTpl ID="itSucursal" runat="server">
                                                    <Html>
                                                        <div class="search-item">
							                                <h3>{CR}</h3>
                                                            <span>{Nombre}</span>
						                                </div>
                                                    </Html>
                                                </ItemTpl>
                                            </ListConfig>
                                            <Store>
                                                <ext:Store
                                                    ID="sSucursal"
                                                    runat="server">
                                                    <Model>
                                                        <ext:Model
                                                            ID="mSucursal"
                                                            runat="server">
                                                            <Fields>
                                                            <ext:ModelField Name="ID" Type="String" />
                                                                <ext:ModelField Name="CR" Type="String" />
                                                                <ext:ModelField Name="Nombre" Type="String" />
                                                            </Fields>
                                                        </ext:Model>                            
                                                    </Model>
                                                </ext:Store>
                                            </Store>
                                            <Listeners>
                                                <Select Fn="cmbSucursal_Select" />
                                                <Change Fn="cmbSucursal_Change" />
                                            </Listeners>  
                                        </ext:ComboBox>
                                        <ext:TextField
                                            ID="txtfSucursalNombre"
                                            runat="server"
                                            Width="360"
                                            Margins="0 3 0 0"
                                            Disabled="true">
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer 
                                    ID="fcFechaEmision"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Fecha de Emisión"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:DateField
                                            ID="dfFechaEmision"
                                            runat="server"
                                            Width="200"
                                            Margins="0 3 0 0" 
                                            Disabled="false">
                                            <PickerOptions 
                                                ID="pOFechaEmision"
                                                runat="server"
                                                Cls="my-date-picker">
                                            </PickerOptions>
                                        </ext:DateField>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer
                                    ID="fcObservaciones"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Asunto"
                                    AnchorHorizontal="100%" 
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtfObservaciones" 
                                            runat="server" 
                                            Width="563" 
                                            Margins="0 3 0 0"
                                            MaxLength="200"
                                            EnforceMaxLength="true">
                                             <Listeners>
                                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>
                        <ext:FieldContainer
                            ID="fcDescricpion"
                            runat="server"
                            AnchorHorizontal="100%" 
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextField 
                                    ID="txtfClave" 
                                    runat="server" 
                                    Width="80" 
                                    Disabled="true"
                                    Text=""
                                    Cls="xcustomtextAreaSinBorde">
                                </ext:TextField>
                                <ext:TextArea
                                    ID="taDescripcion"
                                    runat="server"
                                    Disabled="true"
                                    LabelWidth="70"
                                    StyleSpec="margin-left: 0px;  margin-top:-5px;"
                                    Text=""
                                    Cls="xcustomtextAreaSinBorde"
                                    Height="66"
                                    Width="808" >
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                    </Items>
                </ext:Panel>
                <%--Segundo panel para los datos del reporte--%>
                <ext:Panel 
                    ID="pDatosReporte" 
                    runat="server" 
                    Title="Datos Reporte"
                    BodyPadding="5"
                    Hidden="true"
                    Width="900"
                    Height="206" 
                    AutoScroll="false">
                    
                    <Items>
                        <ext:FieldSet 
                            ID="fsDatosReporte" 
                            runat="server" 
                            Title="Datos Reporte" 
                            DefaultAnchor="100%"
                            AutoScroll="false">
                            <Items>
                                <ext:FieldContainer 
                                    ID="fc1"
                                    runat="server"
                                    FieldLabel="No. Reporte"
                                    LabelWidth="120"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtNoReporte" 
                                            runat="server" 
                                            Width="80" 
                                            Margins="0 3 0 0"
                                            Text="">
                                            <Listeners>
                                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextField>
                                        <ext:ComboBox 
                                            ID="cmbDivision"
                                            runat="server"
                                            FieldLabel="División"
                                            Width="400"
                                            Margins="0 3 0 0"
                                            Editable="false"
                                            AllowBlank="false">
                                            <Items>
                                                <ext:ListItem Index="0" Text="NORTE" Value="NORTE" />
                                                <ext:ListItem Index="1" Text="NORESTE" Value="NORESTE" />
                                                <ext:ListItem Index="2" Text="OCCIDENTE" Value="OCCIDENTE" />
                                                <ext:ListItem Index="3" Text="CENTRO" Value="CENTRO" />
                                                <ext:ListItem Index="4" Text="VALLE DE MÉXICO" Value="VALLE DE MÉXICO" />
                                                <ext:ListItem Index="5" Text="SURESTE" Value="SURESTE" />
                                            </Items>
                                            <%--<Listeners>
                                                <Select Fn="cmbMov_Select" />
                                                <Change Fn="sMov_Change"></Change>
                                            </Listeners>--%>
                                        </ext:ComboBox>
                                    </Items>
                                </ext:FieldContainer>
                                <ext:FieldContainer 
                                    ID="fcFechaOrigen"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Fecha de Origen"
                                    AnchorHorizontal="100%"
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:DateField
                                            ID="dfFechaOrigen"
                                            runat="server"
                                            Width="200"
                                            Margins="0 3 0 0" 
                                            Vtype="daterange"
                                            Disabled="false">
                                            <PickerOptions 
                                                ID="poFechaOrigen"
                                                runat="server"
                                                Cls="my-date-picker">
                                            </PickerOptions>
                                             <CustomConfig>
                                                <ext:ConfigItem 
                                                Name="endDateField" 
                                                Value="dfFechaMaxima" 
                                                Mode="Value" />
                                             </CustomConfig>
                                            <Listeners>
                                                 <Change Handler="sumarDias(this.getValue(),App.dfFechaMaxima.getValue());" />
                                            </Listeners>
                                        </ext:DateField>
                                        <ext:DateField
                                            ID="dfFechaMaxima"
                                            runat="server"
                                            EmptyText="Fecha Máxima Atención"
                                            Width="200"
                                            Vtype="daterange"
                                            Margins="0 3 0 0" 
                                            Disabled="false">
                                            <Listeners>
                                                 <Change Handler="sumarDias(App.dfFechaOrigen.getValue(), this.getValue());" />
                                            </Listeners>
                                            <PickerOptions 
                                                ID="poFechaMaxima"
                                                runat="server"
                                                Cls="my-date-picker">
                                            </PickerOptions>
                                            <CustomConfig>
                                            <ext:ConfigItem 
                                            Name="startDateField" 
                                            Value="dfFechaOrigen"
                                            Mode="Value" />
                                        </CustomConfig>
                                        </ext:DateField>
                                        <ext:NumberField 
                                            ID="nfDiasAtencion"
                                            runat="server"
                                            AllowDecimals="true"
                                            Width="157"
                                            Text="1"
                                            AllowExponential="false"
                                            DecimalPrecision="2"
                                            DecimalSeparator="."
                                            MaxLength="10"
                                            Disabled="true"
                                            EmptyText="Dias Atención"
                                            EnforceMaxLength="true"
                                            MaxValue="999999999"
                                            MinValue="0"
                                            Step="1">
                                        </ext:NumberField>
                                    </Items>
                                </ext:FieldContainer>

                                <ext:FieldContainer
                                    ID="fcReporte"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Reportó"
                                    AnchorHorizontal="100%" 
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtReporta" 
                                            runat="server" 
                                            EmptyText="Nombre de quien reportó el problema"
                                            Width="563" 
                                            Margins="0 3 0 0"
                                            MaxLength="200"
                                            EnforceMaxLength="true">
                                            <Listeners>
                                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>

                                <ext:FieldContainer
                                    ID="fcTrabajoRequerido"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Trabajo Requerido"
                                    AnchorHorizontal="100%" 
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtTrabajoRequerido" 
                                            runat="server" 
                                            Width="563" 
                                            EmptyText="Descripción corta del trabajo requerido"
                                            Margins="0 3 0 0"
                                            MaxLength="200"
                                            EnforceMaxLength="true">
                                            <Listeners>
                                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>


                             <ext:FieldContainer
                                    ID="fcAtiende"
                                    runat="server"
                                    LabelWidth="120"
                                    FieldLabel="Atiende"
                                    AnchorHorizontal="100%" 
                                    Layout="HBoxLayout">
                                    <Items>
                                        <ext:TextField 
                                            ID="txtAtiende" 
                                            runat="server" 
                                            Width="563" 
                                            Margins="0 3 0 0"
                                            EmptyText="Nombre de quien atiende el reporte"
                                            MaxLength="200"
                                            EnforceMaxLength="true">
                                            <Listeners>
                                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                            </Listeners>
                                        </ext:TextField>
                                    </Items>
                                </ext:FieldContainer>
                                
                            </Items>
                        </ext:FieldSet>
                        <ext:FieldContainer
                            ID="FieldContainer5"
                            runat="server"
                            AnchorHorizontal="100%" 
                            Layout="ColumnLayout">
                            <Items>
                                <ext:TextField 
                                    ID="TextField4" 
                                    runat="server" 
                                    Width="80" 
                                    Disabled="true"
                                    Text=""
                                    Cls="xcustomtextAreaSinBorde">
                                </ext:TextField>
                                <ext:TextArea
                                    ID="TextArea1"
                                    runat="server"
                                    Disabled="true"
                                    LabelWidth="70"
                                    StyleSpec="margin-left: 0px;  margin-top:-5px;"
                                    Text=""
                                    Cls="xcustomtextAreaSinBorde"
                                    Height="66"
                                    Width="808" >
                                </ext:TextArea>
                            </Items>
                        </ext:FieldContainer>
                    </Items>
                </ext:Panel>
                    </Items>
                </ext:TabPanel>
                        <%--  DETALLE--%>
                         <ext:Panel
                    ID="pDetalle"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsDetalle" 
                            runat="server" 
                            Height="225" 
                            Title="Detalle"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpOrdenEstimacion"
                                    runat="server"
                                    Width="870"
                                    Height="200"
                                    EnableColumnHide="false"
                                    EnableColumnMove="false">
                                    <Store>
                                        <ext:Store
                                            ID="sConceptos"
                                            runat="server">
                                            <Model>
                                                <ext:Model 
                                                    ID="mConceptos"
                                                    runat="server" 
                                                    IDProperty="Renglon">
                                                    <Fields>
                                                        <ext:ModelField Name="ID" Type="Int" />
                                                        <ext:ModelField Name="Renglon" Type="Int" />
                                                        <ext:ModelField Name="ConceptoID" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Unidad" Type="String" />
                                                        <ext:ModelField Name="Precio" Type="Float" />
                                                        <ext:ModelField Name="Importe" Type="Float" />
                                                        <ext:ModelField Name="IntExt" Type="String" />
                                                        <ext:ModelField Name="RPreciarioConceptos" Type="Object" />
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                            <Listeners>
                                                <Update Fn="sConceptos_DataUpdate" ></Update>
                                                <Load Fn="sConceptos_Load"></Load>
                                            </Listeners>
                                        </ext:Store>
                                    </Store>
                                    <ColumnModel 
                                        ID="cmOrdenEstimacion" 
                                        runat="server">
                                        <Columns>
                                            <ext:CommandColumn
                                                ID="ccAcciones"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccAcciones_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="Delete"
                                                        CommandName="Borrar">
                                                        <ToolTip Text="Borrar" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccAcciones_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                            <ext:Column
                                                ID="cIDPreciario"
                                                runat="server"
                                                Text="Concepto"
                                                Width="125"
                                                DataIndex="ConceptoID">
                                            </ext:Column>
                                            <ext:CommandColumn
                                                ID="ccConcepto"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccConcepto_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="Add"
                                                        CommandName="Agregar">
                                                        <ToolTip Text="Agregar concepto" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccConcepto_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>
                                             <ext:Column
                                                ID="cIntExt"
                                                runat="server"
                                                Text="Int/Ext"
                                                Width="75"
                                                DataIndex="IntExt">
                                                
                                                 <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbIntExt"
                                                        runat="server"
                                                        Editable="true"
                                                        MatchFieldWidth="true"
                                                        ForceSelection="true"
                                                        QueryMode="Local"
                                                        TypeAhead="true">
                                                        <Items>
                                                            <ext:ListItem Index="0" Text="INTERIOR" Value="INTERIOR" />
                                                            <ext:ListItem Index="1" Text="EXTERIOR" Value="EXTERIOR" />
                                                        </Items>
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:NumberColumn
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                DataIndex="Cantidad"
                                                Width="90">
                                                <Renderer Fn="cCantidad_Renderer" />
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfCantidad"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="2"
                                                        DecimalSeparator="."
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        MaxValue="999999999"
                                                        MinValue="0"
                                                        Step="1">
                                                         <Listeners>
                                                                <Change Fn="calcularImporteCantidad_Change"></Change>
                                                          </Listeners>
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:NumberColumn>
                                            <ext:CommandColumn
                                                ID="ccGenerador"
                                                runat="server" 
                                                Width="25">
                                                <PrepareToolbar Fn="ccDimensiones_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="ApplicationOsxAdd"
                                                        CommandName="Agregar">
                                                        <ToolTip Text="Generador" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccGenerador_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>

                                             <ext:Column
                                                ID="cUnidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Unidad"
                                                DataIndex="Unidad"
                                                Width="90">
                                            </ext:Column>

                                            <ext:NumberColumn 
                                                ID="cPrecio"
                                                runat="server"
                                                Align="Center"
                                                Text="Precio"
                                                DataIndex="Precio"
                                                Width="90">
                                                  <Renderer Fn="cPrecio_Renderer" />
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfPrecio"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="2"
                                                        DecimalSeparator="."
                                                        MaxLength="10"
                                                        EnforceMaxLength="true"
                                                        MaxValue="999999999"
                                                        MinValue="0"
                                                        Step="1">
                                                            <Listeners>
                                                                <Change Fn="calcularImportePrecio_Change"></Change>
                                                            </Listeners>
                                                    </ext:NumberField>
                                                   
                                                </Editor>
                                            </ext:NumberColumn>
                                            <ext:NumberColumn
                                                ID="ncImporte"
                                                runat="server"
                                                Align="Center"
                                                Text="Importe"
                                                DataIndex="Importe"
                                                Width="120">
                                               <Renderer Fn="cImporte_Renderer" />
                                            </ext:NumberColumn>
                                            <ext:CommandColumn
                                                ID="ccFotos"
                                                Text="Fotos"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccFotos_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="ImageAdd"
                                                        CommandName="cnCargarFotos" >
                                                        <ToolTip Text="Cargar Fotos" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerFotos">
                                                        <ToolTip Text="Ver Fotos" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccFotos_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>

                                            <ext:CommandColumn
                                                ID="ccCroquis"
                                                Text="Croquis"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccCroquis_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="MapAdd"
                                                        CommandName="cnCargarCroquis" >
                                                        <ToolTip Text="Cargar Croquis" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerCroquis">
                                                        <ToolTip Text="Ver Croquis" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccCroquis_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>


                                            <ext:CommandColumn
                                                ID="ccFacturas"
                                                Text="Facturas"
                                                runat="server"
                                                Width="65">
                                                <PrepareToolbar Fn="ccFacturas_PrepareToolbar" />
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="PageWhiteAcrobat"
                                                        CommandName="cnCargarFactura" >
                                                        <ToolTip Text="Cargar Factura" />
                                                    </ext:GridCommand>
                                                    <ext:GridCommand
                                                        Icon="FolderPicture"
                                                        CommandName="cnVerFactura">
                                                        <ToolTip Text="Ver Factura" />
                                                    </ext:GridCommand>
                                                </Commands>
                                                <Listeners>
                                                    <Command Fn="ccFactura_Command" />
                                                </Listeners>
                                            </ext:CommandColumn>

                                        </Columns>
                                    </ColumnModel>
                                    <Listeners>
                                        <ItemClick Fn="gpOrdenEstimacion_ItemClick" />

                                    </Listeners>
                                    <SelectionModel>
                                        <ext:CellSelectionModel
                                            ID="csmOrdenEstimacion" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <Plugins>
                                        <ext:CellEditing 
                                            ID="ceOrdenEstimacion" 
                                            runat="server"
                                            ClicksToEdit="1">
                                         <Listeners>
                                                <Edit Fn="cePreciarioConcepto_Edit" />
                                              <BeforeEdit Fn="validaConcluidos" ></BeforeEdit>
                                            </Listeners>
                                        </ext:CellEditing>
                                    </Plugins>
                                    <View>
                                        <ext:GridView
                                            ID="gvOrdenEstimacion"
                                            runat="server"
                                            StripeRows="true">
                                        </ext:GridView>
                                    </View>
                                    <Listeners>
                                        <Select Fn="obetenerRenglon_Select"></Select>
                                    </Listeners>

                                </ext:GridPanel>
                                <%--Fin Detalle--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
                    
             
            
            </Items>
            <BottomBar>
             
                <ext:Toolbar ID="tGenerador" runat="server">
                    <Items>
                       <ext:StatusBar 
                ID="sbOrdenEstimacion" 
                runat="server" 
                Cls="x-colorToolbar" 
                Text="SIN AFECTAR" />
                        <ext:DisplayField
                            ID="dfTotal"
                            runat="server"
                            FieldLabel="Total"
                            Cls="total-field"
                            Margins="0 0px 0 470px"
                            Width="290"
                            Text="">
                        </ext:DisplayField>
                    </Items>
                </ext:Toolbar>
     

            </BottomBar>
        </ext:FormPanel>

        

        <ext:Window 
            ID="wEmergente"
            runat="server"
            Icon="Application"
            Hidden="true"
            Modal="true"
            Padding="5"
            Resizable="False"
            Region="Center"
            XOnEsc="Ext.emptyFn">
            <Loader ID="lEmergente" runat="server" Mode="Frame" AutoLoad="false">
                <LoadMask ShowMask="true" Msg="Cargando..." />
            </Loader>
        </ext:Window>


    </form>
</body>
</html>
