<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaParametrosP3.aspx.cs" Inherits="OSEF.ERP.APP.FormaParametrosP3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head  runat="server">
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
                ID="fcFechas"
                runat="server"
                FieldLabel="Desde"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                    <ext:DateField 
                    ID="DateField1" 
                    runat="server"
                    Margins="0 3 0 0"
                    Vtype="daterange"
                     Width="200"
                     AllowBlank="false"
                    EnableKeyEvents="true">  
                    <CustomConfig>
                        <ext:ConfigItem 
                        Name="endDateField" 
                        Value="DateField2" 
                        Mode="Value" />
                    </CustomConfig>
                    
                      <PickerOptions 
                        Cls="my-date-picker"
                        ID="pOFechaDesde" 
                        runat="server">
                        </PickerOptions>
                </ext:DateField>
                <ext:DateField 
                    ID="DateField2"
                    runat="server" 
                    Vtype="daterange"
                    Width="300"
                    AllowBlank="false"
                    FieldLabel="Hasta"
                    EnableKeyEvents="true">    
                    <CustomConfig>
                        <ext:ConfigItem 
                        Name="startDateField" 
                        Value="DateField1"
                        Mode="Value" />
                    </CustomConfig>
                 
                       <PickerOptions 
                        Cls="my-date-picker"
                        ID="pOfechaHasta" 
                        runat="server">
                        </PickerOptions>
                </ext:DateField>
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
