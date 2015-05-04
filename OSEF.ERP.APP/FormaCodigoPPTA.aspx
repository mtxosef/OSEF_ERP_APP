<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCodigoPPTA.aspx.cs" Inherits="OSEF.ERP.APP.FormaCodigoPTTA" %>

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
    <link rel="stylesheet" href="css/xTabPanel.css" />
    <link rel="stylesheet" href="css/xComboBox.css" />
    <link rel="stylesheet" href="css/xCustomChart.css" />
    <link rel="stylesheet" href="css/xIcons.css" />
    <link rel="stylesheet" href="css/xToolbar.css" />
    <link rel="stylesheet" href="css/xLabel.css" />
    <link rel="stylesheet" href="css/xTreePanel.css" />
    <link rel="stylesheet" href="css/xHiperlink.css" />
    <link rel="stylesheet" href="css/xTextField.css" />
    <link rel="stylesheet" href="css/xFieldSet.css" />
    <link rel="stylesheet" href="css/xPanel.css" />
    <link rel="stylesheet" href="css/xButton.css" />
    <script type="text/javascript" src="js/formaCodigoppta.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCodigoPPTA" runat="server" HideInDesign="true" /> 
    
     <ext:Store ID="sCodigoPPTA" runat="server">
        <Model>
            <ext:Model ID="mCodigoPPTA" runat="server" IDProperty="ID">
                <Fields>
                    <ext:ModelField Name="ID" Type="String" />
                    <ext:ModelField Name="Especialidad" Type="String" />
                    <ext:ModelField Name="Familia" Type="String" />
                    <ext:ModelField Name="SubEspecialidad" Type="String" />
                    <ext:ModelField Name="REspecialidad" Type="Object" />
                    <ext:ModelField Name="RFamilia" Type="Object" />
                    <ext:ModelField Name="RSubespecialidad" Type="Object" />
                    <ext:ModelField Name="CodigoMainSaver" Type="String" />
                    <ext:ModelField Name="Descripcion" Type="String" />   
                    <ext:ModelField Name="Dias" Type="String" />   
                    <ext:ModelField Name="Prioridad" Type="String" />   
                    <ext:ModelField Name="TiempoEstimado" Type="String" />    
                </Fields>
            </ext:Model>
        </Model>
        <Listeners>
            <Load Fn="sCodigoPPTA_Load" />
            <Add Fn="sCodigoPPTA_Add" />
        </Listeners>
    </ext:Store>

        <ext:FormPanel 
            ID="fpCodigoPPTAs"
            runat="server" 
            MonitorResize="true"
            Height="490"
            Width="910" DefaultButton="imgbtnGuardar" Layout="HBoxLayout" >
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items> 
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="ID" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtID" runat="server" Width="250"  ReadOnly="true"
                                EmptyText="" MaxLength="99">  
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="Especialidad" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items> 
                            <ext:ComboBox ID="cmbEspecialidad" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="Nombre"
                            ValueField="ID"
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una especialidad..." TypeAhead="true" ForceSelection="true" MatchFieldWidth="true">  
                                <Store>
                                    <ext:Store ID="sEspecialidad" runat="server">
                                        <Model>
                                            <ext:Model ID="mEspecialidad" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model>  
                                    </ext:Store>
                                </Store> 
                                <DirectEvents>
                                    <Change OnEvent="cmbEspecialidad_Select">
                                        <ExtraParams>
                                            <ext:Parameter Name="vEspecialidad" Value="App.cmbEspecialidad.getValue()" Mode="Raw" />
                                        </ExtraParams>
                                    </Change>
                                </DirectEvents>
                            </ext:ComboBox>
                            <ext:Toolbar ID="Toolbar3" 
                        runat="server" 
                        Flex="1"                         
                        Flat="true">
                        <Items>
                            <ext:Button ID="btnAgregarEspecialidades" runat="server" Icon="Add" >
                                <Listeners>
                                    <Click Fn="imgbtnNuevaEspecialidad_Click"></Click>
                                </Listeners>
                            </ext:Button> 
                        </Items>
                    </ext:Toolbar>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="Familia"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                             <ext:ComboBox ID="cmbFamilia" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="Nombre"
                            ValueField="ID"
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una familia..." TypeAhead="true" ForceSelection="true" MatchFieldWidth="true">  
                                <Store>
                                    <ext:Store ID="sFamilias" runat="server">
                                        <Model>
                                            <ext:Model ID="mFamilias" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model> 
                                        <Listeners>
                                            <Load Fn="sFamilia_Load" />
                                        </Listeners>
                                    </ext:Store>
                                </Store> 
                                <DirectEvents>
                                    <Change OnEvent="cmbFamilia_Select">
                                        <ExtraParams>
                                            <ext:Parameter Name="vFamilia" Value="App.cmbFamilia.getValue()" Mode="Raw" />
                                        </ExtraParams>
                                    </Change>
                                </DirectEvents>
                            </ext:ComboBox>
                            <ext:Toolbar ID="Toolbar2" 
                        runat="server" 
                        Flex="1"                         
                        Flat="true">
                        <Items>
                            <ext:Button ID="btnAgregarFamilias" runat="server" Icon="Add"  >
                                <Listeners>
                                    <Click Fn="imgbtnNuevaFamilia_Click"></Click>
                                </Listeners>
                            </ext:Button>  
                        </Items>
                    </ext:Toolbar>
                       </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer4" runat="server" FieldLabel="SubEspecialidad"
                        AnchorHorizontal="100%" Layout="HBoxLayout" AllowBlank="false">
                        <Items>
                            <ext:ComboBox ID="cmbSubEspecialidad" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="Nombre" 
                            ValueField="ID" 
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una SubEspecialidad..." TypeAhead="true" ForceSelection="true" MatchFieldWidth="true"> 
                                <Store>
                                    <ext:Store ID="sSubEspecialidad" runat="server">
                                        <Model>
                                            <ext:Model ID="mSubEspecialidad" runat="server">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model> 
                                        <Listeners>
                                            <Load Fn="sSubespecialidad_Load" />
                                        </Listeners>
                                    </ext:Store>
                                </Store>
                            </ext:ComboBox>
                            <ext:Toolbar ID="Toolbar1" 
                        runat="server" 
                        Flex="1"                         
                        Flat="true">
                        <Items>
                            <ext:Button ID="btnAgregarSubEspecialidades" runat="server" Icon="Add" Margins="0 0 0 0" >
                                <Listeners>
                                    <Click Fn="imgbtnNuevaSubEspecialidad_Click"></Click>
                                </Listeners>
                            </ext:Button> 
                        </Items>
                    </ext:Toolbar>
                       </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="FieldContainer5" runat="server" FieldLabel="Main Saver"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items> 
                         <ext:TextField ID="txtCodigoMainSaver" runat="server" AllowBlank="false" Width="250" Disabled="false" Margins="0 0 0 0"
                                EmptyText="Escriba un código main saver">  
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                    <Blur Handler="App.txtCodigoMainSaver.setValue(App.txtCodigoMainSaver.getValue().toUpperCase());"/>
                                </Listeners>
                            </ext:TextField>
                       </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer6" runat="server" FieldLabel="Descripción"
                        AnchorHorizontal="100%" Layout="HBoxLayout"  AllowBlank="false">
                        <Items>
                            <ext:TextArea ID="txtDescripcion" runat="server" Height="150" Width="250" Disabled="false" AllowBlank="false"
                                EmptyText="Escriba una descripción" MaxLength="499"> 
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                    <Blur Handler="App.txtDescripcion.setValue(App.txtDescripcion.getValue().toUpperCase());"/>
                                </Listeners>
                            </ext:TextArea>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer7" runat="server" FieldLabel="Días" 
                        AnchorHorizontal="100%" Layout="HBoxLayout"  AllowBlank="false">
                        <Items>
                            <ext:NumberField ID="txtDias" runat="server" Width="250" MinValue="0" MaxValue="365" AllowExponential="false" MaxLength="3" Editable="false"  AllowBlank="false"> 
                            <Listeners>
                                <Change Fn="imgbtnGuardar_change" />
                            </Listeners>
                                </ext:NumberField>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer8" runat="server" FieldLabel="Prioridad" 
                        AnchorHorizontal="100%" Layout="HBoxLayout"  AllowBlank="false">
                        <Items>
                            <ext:NumberField ID="txtPrioridad" runat="server" Width="250" MinValue="1" MaxValue="5" AllowExponential="false" MaxLength="3" AllowBlank="false" Editable="false" > 
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:NumberField>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer9" runat="server" FieldLabel="Tiempo Estimado" 
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:NumberField ID="txtTiempoEstimado" runat="server" Width="250" MinValue="0" MaxValue="365" AllowExponential="false" MaxLength="3"  AllowBlank="false"  Editable="false" >  
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:NumberField>
                        </Items>
                    </ext:FieldContainer> 
                </Items>
                <Buttons>
                    <ext:ImageButton ID="imgbtnGuardar" runat="server" ImageUrl="assets/img/controles/Guardar.png"
                        DisabledImageUrl="assets/img/controles/GuardarDisabled.png" OverImageUrl="assets/img/controles/GuardarOver.png"
                        PressedImageUrl="assets/img/controles/GuardarPressed.png" ToolTip="Guardar" Height="50"
                        Width="50" Disabled="true">  
                        <DirectEvents>
                            <Click OnEvent="imgbtnGuardar_Click" Success="imgbtnGuardar_Click_Success">
                                <EventMask ShowMask="true" Msg="Registrando información..." />
                                <ExtraParams>
                                        <ext:Parameter Name="registro" Value="Ext.encode(this.up('form').getForm().getValues(false, false, false, true))"
                                        Mode="Raw" />
                                </ExtraParams>
                            </Click>
                        </DirectEvents>
                    </ext:ImageButton>
                    <ext:ImageButton ID="imgbtnCancelar" runat="server" ImageUrl="assets/img/controles/Cancelar.png"
                        DisabledImageUrl="assets/img/controles/CancelarDisabled.png" OverImageUrl="assets/img/controles/CancelarOver.png"
                        PressedImageUrl="assets/img/controles/CancelarPressed.png" ToolTip="Cancelar"
                        Height="50" Width="50">
                        <Listeners>
                            <Click Handler="window.parent.App.wEmergente.hide();" />
                        </Listeners>
                    </ext:ImageButton>
                </Buttons>
            </ext:Panel>
        </Items> 
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Existe información incompleta/incorrecta', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbPPTA" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
            </ext:FormPanel>
    </form>
</body>
</html>
