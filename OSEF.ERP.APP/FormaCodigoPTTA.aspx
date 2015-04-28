<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCodigoPTTA.aspx.cs" Inherits="OSEF.ERP.APP.FormaCodigoPTTA" %>

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
    <ext:FormPanel ID="fpCodigoPPTAs" runat="server" Height="560" DefaultButton="imgbtnGuardar"
        BodyStyle="padding:5px 5px 0;" Layout="HBoxLayout" MonitorResize="true">
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items> 
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="ID" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtID" runat="server" Width="250" Margins="0 3 0 0" Disabled="false" ReadOnly="true"
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
                            DisplayField="name"
                            ValueField="name"
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una especialidad...">  
                                <Store>
                                    <ext:Store ID="sEspecialidad" runat="server">
                                        <Model>
                                            <ext:Model ID="mEspecialidad" runat="server" IDProperty="ID">
                                                <Fields>
                                                    <ext:ModelField Name="ID" Type="String" />
                                                    <ext:ModelField Name="Nombre" Type="String" />
                                                </Fields>
                                            </ext:Model>
                                        </Model> 
                                    </ext:Store>
                                </Store>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:ComboBox>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="Familia"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                             <ext:ComboBox ID="cmbFamilia" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="name"
                            ValueField="name"
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una familia..."> 
                                <Items>
                                    <ext:ListItem Index="0" Text="AIRE ACONDICIONADO" Value="AIRE ACONDICIONADO" />
                                    <ext:ListItem Index="1" Text="INSTALACIONES HIDROSANITARIAS" Value="INSTALACIONES HIDROSANITARIAS" />
                                    <ext:ListItem Index="2" Text="CONSERVACIÓN" Value="CONSERVACIÓN" />
                                    <ext:ListItem Index="3" Text="INSTALACIONES ELÉCTRICAS" Value="INSTALACIONES ELÉCTRICAS" />
                                    <ext:ListItem Index="4" Text="ELÉCTRICO" Value="ELÉCTRICO" />
                                    <ext:ListItem Index="5" Text="PLANTA DE EMERGENCIA" Value="PLANTA DE EMERGENCIA" />
                                    <ext:ListItem Index="6" Text="SUBESTACIÓN ELÉCTRICA" Value="SUBESTACIÓN ELÉCTRICA" />
                                    <ext:ListItem Index="7" Text="LIMPIEZA" Value="LIMPIEZA" />
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:ComboBox>
                       </Items>
                    </ext:FieldContainer>
                    
                    <ext:FieldContainer ID="FieldContainer4" runat="server" FieldLabel="SubEspecialidad"
                        AnchorHorizontal="100%" Layout="HBoxLayout" AllowBlank="false">
                        <Items>
                            <ext:ComboBox ID="cmbSubEspecialidad" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="name"
                            ValueField="name"
                            QueryMode="Local"
                            TriggerAction="All" 
                            EmptyText="Seleccione una SubEspecialidad..."> 
                                <Items>
                                    <ext:ListItem Index="0" Text="CANCELERÍA" Value="CANCELERÍA" /> 
                                </Items>
                                <SelectedItems>
                                    <ext:ListItem Index="0" />
                                </SelectedItems>
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:ComboBox>
                       </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="FieldContainer5" runat="server" FieldLabel="Main Saver"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items> 
                         <ext:TextField ID="txtCodigoMainSaver" runat="server" AllowBlank="false" Width="250" Margins="0 3 0 0" Disabled="false"
                                EmptyText="Escriba un código main saver">  
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:TextField>
                       </Items>
                    </ext:FieldContainer>
                    
                    <ext:FieldContainer ID="FieldContainer6" runat="server" FieldLabel="Descripción"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:TextArea ID="txtDescripcion" runat="server" Height="150" Width="250" Margins="0 3 0 0" Disabled="false" AllowBlank="false"
                                EmptyText="Escriba una descripción" MaxLength="499"> 
                                <Listeners>
                                    <Blur Fn="imgbtnGuardar_change" />
                                </Listeners>
                            </ext:TextArea>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer7" runat="server" FieldLabel="Días" 
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:NumberField ID="txtDias" runat="server" Width="250" MinValue="0" MaxValue="365"/>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer8" runat="server" FieldLabel="Prioridad" 
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:NumberField ID="txtPrioridad" runat="server" Width="250" MinValue="1" MaxValue="5"/>
                        </Items>
                    </ext:FieldContainer> 
                    <ext:FieldContainer ID="FieldContainer9" runat="server" FieldLabel="Tiempo Estimado" 
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                            <ext:NumberField ID="txtTiempoEstimado" runat="server" Width="250" MinValue="0" MaxValue="365"/>
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
