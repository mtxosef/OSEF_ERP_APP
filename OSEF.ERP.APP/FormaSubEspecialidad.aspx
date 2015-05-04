<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaSubEspecialidad.aspx.cs" Inherits="OSEF.ERP.APP.FormaSubEspecialidad" %>

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
    <script type="text/javascript" src="js/formaSubEspecialidades.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmSubEspecialidad" runat="server" HideInDesign="true" />
    <ext:FormPanel ID="fpSubEspecialidad" runat="server" Height="150" DefaultButton="imgbtnGuardar" Layout="HBoxLayout" MonitorResize="true">
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items> 
                    <ext:FieldContainer ID="FieldContainer1" runat="server" FieldLabel="ID" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtID" runat="server" Width="250" Disabled="false" ReadOnly="true"
                                EmptyText="" MaxLength="99">  
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>  
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="NOMBRE" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                            <ext:TextField ID="txtNombre" runat="server" Width="250" Disabled="false" ReadOnly="false" AllowBlank="false"
                                EmptyText="NOMBRE DE LA SUBESPECIALIDAD" MaxLength="99">
                                <Listeners>
                                    <Change Fn="imgbtnGuardar_change" />
                                    <Blur Handler="App.txtNombre.setValue(App.txtNombre.getValue().toUpperCase())"/>
                                </Listeners>
                            </ext:TextField>
                        </Items>
                    </ext:FieldContainer>   <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="FAMILIA"
                        AnchorHorizontal="100%" Layout="HBoxLayout">
                        <Items>
                             <ext:ComboBox ID="cmbFamilia" runat="server"
                            Width="250"
                            Editable="false"
                            DisplayField="Nombre"
                            ValueField="ID"
                            QueryMode="Local"
                            TriggerAction="All" AllowBlank="false"
                            EmptyText="Seleccione una familia...">  
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
                                    </ext:Store>
                                </Store>  
                            </ext:ComboBox> 
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
                            <Click Handler="window.parent.App.wNew.hide();" />
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
                <ext:StatusBar ID="sbSubEspecialidad" runat="server" Cls="x-colorToolbar" Text="Sin validar información" />
            </BottomBar>
    </ext:FormPanel>
    </form>
</body>
</html>
