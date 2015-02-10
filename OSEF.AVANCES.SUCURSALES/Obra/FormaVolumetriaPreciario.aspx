<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaVolumetriaPreciario.aspx.cs" Inherits="OSEF.AVANCES.SUCURSALES.Obra.FormaVolumetriaPreciario" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="../css/login.css" />
    <link rel="Stylesheet" href="../css/customControls.css" />
    <link rel="stylesheet" href="../css/xMask.css" />
    <link rel="stylesheet" href="../css/xDatePicker.css" />
    <link rel="stylesheet" href="../css/xSplitButton.css" />
    <link rel="stylesheet" href="../css/xGridPanel.css" />
    <link rel="stylesheet" href="../css/xWindowPopup.css" />
    <link rel="stylesheet" href="../css/xTabPanel.css"/>
    <link rel="stylesheet" href="../css/xComboBox.css"/>
    <link rel="stylesheet" href="../css/xCustomChart.css"/>
    <link rel="stylesheet" href="../css/xIcons.css"/>
    <link rel="stylesheet" href="../css/xToolbar.css"/>
    <link rel="stylesheet" href="../css/xLabel.css"/>
    <link rel="stylesheet" href="../css/xTreePanel.css"/>
    <link rel="stylesheet" href="../css/xHiperlink.css"/>
    <link rel="stylesheet" href="../css/xTextField.css"/>
    <link rel="stylesheet" href="../css/xFieldSet.css"/>
    <link rel="stylesheet" href="../css/xPanel.css"/>
    <link rel="stylesheet" href="../css/xButton.css"/>
    <script type='text/javascript' src="../js/volumetrias.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaVolumetriaPreciario" runat="server" HideInDesign="true" />
    
       <ext:FormPanel 
            ID="fpVolumetriasPreciario"
            runat="server" 
            MonitorResize="true"
            Height="515"
            Width="910"
            BodyStyle="background-color:#fff;">
            <TopBar>
                <ext:Toolbar 
                    ID="tbVolumetriasPreciario" 
                    runat="server" 
                    Height="40">
                    <Items>
                        <ext:ImageButton 
                            ID="imgbtnNuevo"
                            runat="server"
                            ImageUrl="../assets/img/controles/nuevo-normal.png"
                            DisabledImageUrl="../assets/img/controles/nuevo-disable.png"
                            OverImageUrl="../assets/img/controles/nuevo-over.png"
                            PressedImageUrl="../assets/img/controles/nuevo-pressed.png"
                            ToolTip="Nuevo"
                            Height="30"
                            Width="30">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAbrir"
                            runat="server"
                            ImageUrl="../assets/img/controles/AbrirNormal.png"
                            DisabledImageUrl="../assets/img/controles/AbrirDisabled.png"
                            OverImageUrl="../assets/img/controles/AbrirOver.png"
                            PressedImageUrl="../assets/img/controles/AbrirPressed.png"
                            ToolTip="Abrir"
                            Height="30"
                            Width="30">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnGuardar"
                            runat="server"
                            ImageUrl="../assets/img/controles/SaveNormal.png"
                            DisabledImageUrl="../assets/img/controles/SaveDisabled.png"
                            OverImageUrl="../assets/img/controles/SaveOver.png"
                            PressedImageUrl="../assets/img/controles/SavePressed.png"
                            ToolTip="Guardar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnInfo"
                            runat="server"
                            ImageUrl="../assets/img/controles/InfoNormal.png"
                            DisabledImageUrl="../assets/img/controles/InfoDisabled.png"
                            OverImageUrl="../assets/img/controles/InfoOver.png"
                            PressedImageUrl="../assets/img/controles/InfoPressed.png"
                            ToolTip="Información"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnAfectar"
                            runat="server"
                            ImageUrl="../assets/img/controles/AfectarNormal.png"
                            DisabledImageUrl="../assets/img/controles/AfectarDisabled.png"
                            OverImageUrl="../assets/img/controles/AfectarOver.png"
                            PressedImageUrl="../assets/img/controles/AfectarPressed.png"
                            ToolTip="Afectar" 
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAutorizar"
                            runat="server"
                            ImageUrl="../assets/img/controles/AutorizarNormal.png"
                            DisabledImageUrl="../assets/img/controles/AutorizarDisabled.png"
                            OverImageUrl="../assets/img/controles/AutorizarOver.png"
                            PressedImageUrl="../assets/img/controles/AutorizarPressed.png"
                            ToolTip="Autorizar"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton
                            ID="imgbtnImprimir"
                            runat="server"
                            ImageUrl="../assets/img/controles/ImprimirNormal.png"
                            DisabledImageUrl="../assets/img/controles/ImprimirDisabled.png"
                            OverImageUrl="../assets/img/controles/ImprimirOver.png"
                            PressedImageUrl="../assets/img/controles/ImprimirPressed.png"
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
                            ImageUrl="../assets/img/controles/delete-normal.png"
                            DisabledImageUrl="../assets/img/controles/delete-disable.png"
                            OverImageUrl="../assets/img/controles/delete-over.png"
                            PressedImageUrl="../assets/img/controles/delete-pressed.png"
                            ToolTip="Borrar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnCancelar"
                            runat="server"
                            ImageUrl="../assets/img/controles/Cancelar.png"
                            DisabledImageUrl="../assets/img/controles/CancelarDisabled.png"
                            OverImageUrl="../assets/img/controles/CancelarOver.png"
                            PressedImageUrl="../assets/img/controles/CancelarPressed.png"
                            ToolTip="Cancelar Movimiento"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ToolbarSpacer
                            ID="tbsSegundoEspacio"
                            runat="server"
                            Width="190">
                        </ext:ToolbarSpacer>
                        <ext:ImageButton 
                            ID="imgbtnPrimero"
                            runat="server"
                            ImageUrl="../assets/img/controles/PrimeroNormal.png"
                            DisabledImageUrl="../assets/img/controles/PrimeroDisabled.png"
                            OverImageUrl="../assets/img/controles/PrimeroOver.png"
                            PressedImageUrl="../assets/img/controles/PrimeroPressed.png"
                            ToolTip="Primero"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnAnterior"
                            runat="server"
                            ImageUrl="../assets/img/controles/AnteriorNormal.png"
                            DisabledImageUrl="../assets/img/controles/AnteriorDisabled.png"
                            OverImageUrl="../assets/img/controles/AnteriorOver.png"
                            PressedImageUrl="../assets/img/controles/AnteriorPressed.png"
                            ToolTip="Anterior"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnSiguiente"
                            runat="server"
                            ImageUrl="../assets/img/controles/SiguienteNormal.png"
                            DisabledImageUrl="../assets/img/controles/SiguienteDisabled.png"
                            OverImageUrl="../assets/img/controles/SiguienteOver.png"
                            PressedImageUrl="../assets/img/controles/SiguientePressed.png"
                            ToolTip="Siguiente"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                        <ext:ImageButton 
                            ID="imgbtnUltimo"
                            runat="server"
                            ImageUrl="../assets/img/controles/UltimoNormal.png"
                            DisabledImageUrl="../assets/img/controles/UltimoDisabled.png"
                            OverImageUrl="../assets/img/controles/UltimoOver.png"
                            PressedImageUrl="../assets/img/controles/UltimoPressed.png"
                            ToolTip="Ultimo"
                            Height="30"
                            Width="30"
                            Disabled="true">
                        </ext:ImageButton>
                    </Items>
                </ext:Toolbar>
            </TopBar>
            <Items>
                <ext:Panel 
                    ID="pDatosGenerales" 
                    runat="server" 
                    BodyPadding="5"
                    Width="900"
                    Height="153" 
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
                                        AutoFocus="true"
                                        AllowBlank="false">
                                        <Items>
                                            <ext:ListItem Index="0" Text="Inicio" Value="Inicio" />
                                            <ext:ListItem Index="0" Text="Captura" Value="Captura" />
                                            <ext:ListItem Index="0" Text="Fin" Value="Fin" />
                                        </Items>
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
                                        DisplayField="ID"
                                        ValueField="ID"
                                        Width="200"
                                        MatchFieldWidth="false"
                                        Margins="0 3 0 0"
                                        Cls="spanCustomCombo xEspacioCmbxCustom"
                                        PageSize="10"
                                        AllowBlank="false"
                                        ForceSelection="true"
                                        QueryMode="Local"
                                        TypeAhead="true">
                                        <ListConfig ID="lcEstado" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                                            <ItemTpl ID="itSucursal" runat="server">
                                                <Html>
                                                    <div class="search-item">
							                            <h3>{ID}</h3>
                                                        <span>{Nombre}</span>
						                            </div>
                                                </Html>
                                            </ItemTpl>
                                        </ListConfig>
                                                                 
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
                                FieldLabel="Observaciones"
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
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
     
                <%--  DETALLE--%>
                <ext:Panel
                    ID="pDetalleVolumetria"
                    runat="server"
                    BodyPadding="5"
                    Width="900"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsDetalleVolumetria" 
                            runat="server" 
                            Height="275" 
                            Title="Volumetría Detalle"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="pgVolumetriaDetalle"
                                    runat="server"
                                    Width="870"
                                    Height="210"
                                    EnableColumnHide="false"
                                    EnableColumnMove="false">
                                  
                                    <ColumnModel 
                                        ID="cmVolumetriaDetalle" 
                                        runat="server">
                                        <Columns>
                                            <ext:CommandColumn
                                                ID="ccAcciones"
                                                runat="server"
                                                Width="25">
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="Delete"
                                                        CommandName="Borrar">
                                                        <ToolTip Text="Borrar" />
                                                    </ext:GridCommand>
                                                </Commands>
                                            </ext:CommandColumn>
                                            <ext:Column
                                                ID="cIDPreciario"
                                                runat="server"
                                                Text="ID"
                                                Width="100"
                                                DataIndex="IdPreciario">
                                                <Editor>
                                                    <ext:ComboBox
                                                        ID="cmbPreciario"
                                                        runat="server"
                                                        DisplayField="Preciario"
                                                        ValueField="Preciario">
                                                    </ext:ComboBox>
                                                </Editor>
                                            </ext:Column>
                                            <ext:Column
                                                ID="cDescripcion"
                                                runat="server"
                                                Text="Descripción"
                                                Width="350"
                                                DataIndex="Descripcion">
                                                <Editor>
                                                    <ext:TextField
                                                        ID="txtfDescripcion"
                                                        runat="server"
                                                        DisplayField="Descripcion"
                                                        ValueField="ID">
                                                    </ext:TextField>
                                                </Editor>
                                            </ext:Column>
                                            <ext:NumberColumn
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                DataIndex="Cantidad"
                                                Width="150">
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfCantidad"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="2"
                                                        DecimalSeparator="."
                                                        MaxLength="7"
                                                        EnforceMaxLength="true"
                                                        MaxValue="1000"
                                                        MinValue="0"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:NumberColumn>
                                            <ext:NumberColumn 
                                                ID="cUtilizada"
                                                runat="server"
                                                Align="Center"
                                                Text="Utlizada"
                                                DataIndex="Utlizada"
                                                Width="150">
                                                <Editor>
                                                    <ext:NumberField 
                                                        ID="nfUtilizada"
                                                        runat="server"
                                                        AllowDecimals="true"
                                                        AllowExponential="false"
                                                        DecimalPrecision="2"
                                                        DecimalSeparator="."
                                                        MaxLength="7"
                                                        EnforceMaxLength="true"
                                                        MaxValue="1000"
                                                        MinValue="0"
                                                        Step="1">
                                                    </ext:NumberField>
                                                </Editor>
                                            </ext:NumberColumn>
                                            <ext:CommandColumn
                                                ID="ccFotos"
                                                Text="Fotos"
                                                runat="server"
                                                Width="85">
                                                <Commands>
                                                    <ext:GridCommand
                                                        Icon="ApplicationAdd"
                                                        CommandName="cnFotos">
                                                        <ToolTip Text="Cargar Fotos" />
                                                    </ext:GridCommand>
                                                </Commands>
                                            </ext:CommandColumn>
                                        </Columns>
                                    </ColumnModel>
                                    <SelectionModel>
                                        <ext:CellSelectionModel
                                            ID="csmVolumetriaDetalle" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <Plugins>
                                        <ext:CellEditing 
                                            ID="ceVolumetriaDetalle" 
                                            runat="server"
                                            ClicksToEdit="1">
                                        </ext:CellEditing>
                                    </Plugins>
                                    <View>
                                        <ext:GridView
                                            ID="gvVolumetriaDetalle"
                                            runat="server"
                                            StripeRows="true">
                                        </ext:GridView>
                                    </View>
                                </ext:GridPanel>
                                <%--Fin Detalle--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
            <BottomBar>
                <ext:StatusBar 
                ID="sbFormaVolumetriaDetalle" 
                runat="server" 
                Cls="x-colorToolbar" 
                Text="BORRADOR" />
            </BottomBar>
        </ext:FormPanel>

        <ext:Window 
            ID="wFormaGaleria" 
            runat="server" 
            Icon="Application" 
            Hidden="true" 
            Modal="true"
            Padding="5" 
            Resizable="False" 
            Region="Center" 
            XOnEsc="Ext.emptyFn">
            <Loader 
                ID="Loader1" 
                runat="server" 
                Mode="Frame" 
                AutoLoad="false">
                <LoadMask 
                    ShowMask="true" 
                    Msg="Cargando..." />
            </Loader>
        </ext:Window>

         <ext:Window 
        ID="wCargarImagenes" 
        runat="server" 
        Icon="Application"
        Hidden="true"
        Modal="true" 
        Padding="5" 
        Resizable="False" 
        Region="Center" 
        XOnEsc="Ext.emptyFn">
            <Loader 
            ID="Loader2" 
            runat="server" 
            Mode="Frame" 
            AutoLoad="false">
                <LoadMask 
                ShowMask="true" 
                Msg="Cargando..." />
            </Loader>
        </ext:Window>
    </form>
</body>
</html>
