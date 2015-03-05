<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaParametrosP1.aspx.cs" Inherits="OSEF.ERP.APP.FormaParametrosP1" %>

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
    <script type='text/javascript' src="js/parametrosP1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    <ext:ResourceManager ID="rmEspecificarFechas" runat="server" />
        <ext:FormPanel 
        ID="fpEspecificarParametros" 
        runat="server"
        Width="720"
        Height="320"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
             <ext:FieldContainer
                ID="fcPreciario"
                runat="server"
                FieldLabel="Preciario"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                    <ext:ComboBox
                        ID="cmbPreciario"
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
                        <ListConfig ID="lcPreciario" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                            <ItemTpl ID="itPreciario" runat="server">
                                <Html>
                                    <div class="search-item">
							            <h3>{ID}</h3>
                                        <span>{Descripcion}</span>
						            </div>
                                </Html>
                            </ItemTpl>
                        </ListConfig>
                            <Store>
                                <ext:Store
                                    ID="sPreciario"
                                    runat="server">
                                    <Model>
                                        <ext:Model
                                            ID="mPreciario"
                                            runat="server">
                                            <Fields>
                                                <ext:ModelField Name="ID" />
                                                <ext:ModelField Name="Descripcion" />
                                                <ext:ModelField Name="Sucursal" />
                                                <ext:ModelField Name="Archivo" />
                                                <ext:ModelField Name="Estatus" />
                                                    <ext:ModelField Name="FechaAlta" />
                                                    <ext:ModelField Name="RSucursal" Type="Object" />
                                                        
                                            </Fields>
                                        </ext:Model>                            
                                    </Model>
                                </ext:Store>
                            </Store>
                            <Listeners>
                                <Select Fn="cmbPreciario_Select" />
                                <Change Fn="cmbPreciario_Change" />
                            </Listeners>  
                                <DirectEvents>
                                <Select OnEvent="cmbPreciarios_Change" >
                                    <ExtraParams>
                                        <ext:Parameter Name="valor" Value="App.cmbPreciario.getValue()" Mode="Raw" />
                                    </ExtraParams>
                                </Select>
                            </DirectEvents>
                                                                   
                    </ext:ComboBox>
                    <ext:TextField
                        ID="txtfDescripcionPreciario"
                        runat="server"
                        Width="360"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
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
                    <ext:TextField
                        ID="txtfIDSucursal"
                        runat="server"
                        Width="200"
                        Margins="0 3 0 0"
                        Disabled="true">                                        
                    </ext:TextField>
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
                ID="fcPreciarioConcepto"
                runat="server"
                FieldLabel="Concepto"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                 <ext:ComboBox
                        ID="cmbConcepto"
                        runat="server"
                        DisplayField="ID"
                        ValueField="ID"
                        Width="564"
                        MatchFieldWidth="false"
                        Margins="0 3 0 0"
                        Cls="spanCustomCombo xEspacioCmbxCustom"
                        PageSize="10"
                        AllowBlank="false"
                        ForceSelection="true"
                        QueryMode="Local"
                        TypeAhead="true">
                        <ListConfig ID="ListConfig1" runat="server" Width="350" Cls="xEspacioCmbxCustom">
                            <ItemTpl ID="ItemTpl1" runat="server">
                                <Html>
                                    <div class="search-item">
							            <h3>{ID}</h3>
                                        <span>{Descripcion}</span>
						            </div>
                                </Html>
                            </ItemTpl>
                        </ListConfig>
                            <Store>
                                <ext:Store
                                    ID="sPreciarioConcepto"
                                    runat="server">
                                    <Model>
                                        <ext:Model
                                            ID="mPreciarioConcepto"
                                            runat="server">
                                            <Fields>
                                             <ext:ModelField Name="ID" Type="String" />
                                            <ext:ModelField Name="Clave" Type="String" />
                                            <ext:ModelField Name="Descripcion" Type="String" />
                                            <ext:ModelField Name="Unidad" Type="String" />
                                            <ext:ModelField Name="Cantidad" Type="Float" />
                                            <ext:ModelField Name="Costo" Type="Float" />
                                            <ext:ModelField Name="Importe" Type="Float" />
                                            <ext:ModelField Name="Categoria" Type="String" />
                                            <ext:ModelField Name="SubCategoria" Type="String" />
                                            <ext:ModelField Name="SubSubCategoria" Type="String" />
                                            <ext:ModelField Name="FechaAlta" Type="Date" />
                                            <ext:ModelField Name="Estatus" Type="String" />
                                            <ext:ModelField Name="Tipo" Type="String" />
                                            </Fields>
                                        </ext:Model>                            
                                    </Model>
                                </ext:Store>
                            </Store>
                    </ext:ComboBox>
                </Items>
            </ext:FieldContainer>

            <ext:FieldContainer
                ID="FieldContainer1"
                runat="server"
                FieldLabel="Concepto"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                 <ext:TextField
                        ID="txtConcepto"
                        runat="server"
                        Width="200"
                        Margins="0 3 0 0"
                        Disabled="true"> 
                          <RightButtons>
                                <ext:ImageButton 
                                    ID="imgbtnSeleccionarPreciario" 
                                    runat="server" 
                                    ImageUrl="assets/img/controles/login.png"
                                    OverImageUrl="assets/img/controles/login-hover.png" 
                                    PressedImageUrl="assets/img/controles/login-pressed.png"
                                    ToolTip="Buscar Concepto" 
                                    Width="20">
                                    <DirectEvents>
                             
                                         <Click OnEvent="imgBtnSeleccionarConcepto_Click" Success="imgBtnSeleccionarConcepto_Click_Success">
                                                <EventMask ShowMask="true" Msg="Cargando conceptos..." />
                                               <ExtraParams>
                                                <ext:Parameter Name="preciario" Value="App.cmbPreciario.getValue()" Mode="Raw" />
                                                </ExtraParams>
                                         </Click>
                                       </DirectEvents>
                                </ext:ImageButton>
                            </RightButtons>                                      
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
        </Items>
         <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbParametros1" 
                runat="server"
                Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
        <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar"
                    runat="server"
                    ImageUrl="assets/img/controles/Guardar.png"
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Ver Reporte" 
                    Height="50" 
                    Width="50"
                    Disabled="true">
                    <DirectEvents>
                        <Click OnEvent="imgbtnExportar_Click" Success="window.open('VistaPreliminar.aspx', '_blank');">
                            <EventMask ShowMask="true" Msg="Cargando Reporte..." />
                             <ExtraParams>
                                <ext:Parameter Name="preciario" Value="App.cmbPreciario.getValue()" Mode="Raw" />
                                <ext:Parameter Name="conceptoID" Value="App.cmbConcepto.getValue()" Mode="Raw" />
                            </ExtraParams>

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
                    ToolTip="Cancelar" 
                    Height="50" 
                    Width="50">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons>
        </ext:FormPanel>
    
    </div>
    </form>
</body>
</html>
