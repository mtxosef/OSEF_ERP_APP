<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaPreciarioGeneralExplorador.aspx.cs" Inherits="OSEF.ERP.APP.FormaPreciarioGeneralExplorador" %>

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


    <script type='text/javascript' src="js/exploradorConceptoPreciarioGeneral.js"></script>
   
</head>
<body>
    <form id="form1" runat="server">
     <ext:ResourceManager ID="rmFormaPreciarioExplorador" runat="server" />

       <ext:Store
            ID="sPreciarioConceptoForma"
            runat="server">
            <Model>
                <ext:Model
                    ID="mPreciarioConceptoForma"
                    runat="server">
                    <Fields>
                        <ext:ModelField Name="ID" Type="String" />
                    <ext:ModelField Name="Clave" Type="String" />
                    <ext:ModelField Name="Descripcion" Type="String" />
                    <ext:ModelField Name="Unidad" Type="String" />
                    <ext:ModelField Name="Preciario" Type="String" />
                    <ext:ModelField Name="Cantidad" Type="Float" />
                    <ext:ModelField Name="Costo" Type="Float" />
                    <ext:ModelField Name="Importe" Type="Float" />
                    <ext:ModelField Name="Categoria" Type="String" />
                    <ext:ModelField Name="SubCategoria" Type="String" />
                    <ext:ModelField Name="SubSubCategoria" Type="String" />
                    <ext:ModelField Name="FechaAlta" Type="Date" />
                    <ext:ModelField Name="Estatus" Type="String" />
                    </Fields>
                </ext:Model>                            
            </Model>
        <Listeners>
                <Load Fn="sParametrosExporador_Load" />
            </Listeners>
        </ext:Store>


                <ext:FormPanel 
        ID="fpEspecificarParametros" 
        runat="server"
        Width="580"
        DefaultButton="imgbtnGuardar"
        Height="410"
        BodyPadding="10"
        DefaultAnchor="100%">
        <Items>
             <ext:FieldContainer
                ID="fcPreciario"
                runat="server"
                FieldLabel="Movimiento"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextField
                        ID="txtPreciario"
                        runat="server"
                        Width="140"
                          Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
                   <ext:TextField
                        ID="txtClave"
                        runat="server"
                        FieldLabel="Clave Concepto"
                        LabelWidth="138"
                        Width="285"
                          Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>

            <ext:FieldContainer
                ID="fcDatos"
                runat="server"
                FieldLabel="Cantidad"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextField
                        ID="txtCantidad"
                        runat="server"
                        Width="140"
                          Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
                    
                </Items>
            </ext:FieldContainer>

             <ext:FieldContainer
                ID="fcContenedorCantidades"
                runat="server"
                FieldLabel="Precio"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextField
                        ID="txtPrecioInicial"
                        runat="server"
                        Width="140"
                        Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
                    <ext:TextField
                        ID="txtImporte"
                        runat="server"
                        FieldLabel="Importe"
                        LabelWidth="138"
                        Width="285"
                        Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>


                    <ext:TextField
                        ID="txtConceptoID"
                        runat="server"
                        Hidden="true"
                        Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
             <ext:FieldContainer
                ID="fcFirmas"
                runat="server"
                FieldLabel="Firmas"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextField
                        ID="txtElaboro"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Elaboró"
                        Margins="0 3 0 0"
                        AutoFocus="true"
                         AllowBlank="false">
                         <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                    <ext:TextField
                        ID="txtReviso"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Revisó"
                        Margins="0 3 0 0"
                         AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                      <ext:TextField
                        ID="txtAutorizo"
                        runat="server"
                        Width="140"
                        EmptyText="Firma Autorizó"
                        Margins="0 3 0 0"
                        AllowBlank="false">
                       <Listeners>
                                <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                            </Listeners>
                    </ext:TextField>
                </Items>
            </ext:FieldContainer>
             <ext:FieldContainer
                ID="fcConcepto"
                runat="server"
                FieldLabel="Descripción"
                AnchorHorizontal="100%"
                LabelWidth="120"
                Layout="HBoxLayout">
                <Items>
                      <ext:TextArea
                        ID="txtADescripcion"
                        runat="server"
                        Width="426"
                        Height="140"
                        Cls="xDeshabilitados"
                        Margins="0 3 0 0"
                        Disabled="true">
                    </ext:TextArea>
                </Items>
            </ext:FieldContainer>     
        </Items>
            <Listeners>
                <ValidityChange Handler="this.dockedItems.get(0).setStatus({
                                                text : valid ? 'La información esta completa/correcta' : 'Especifica el personal que firmará el documento', 
                                                iconCls: valid ? 'icon-accept' : 'icon-exclamation'
                                            });
                                            #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
            <BottomBar>
                <ext:StatusBar ID="sbParametros1" 
                runat="server"
                Cls="x-colorToolbar" 
                Text="" />
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
                   <%-- <DirectEvents>
                        <Click OnEvent="imgbtnExportar_Click" Success="window.open('Previa.aspx', '_blank');">
                            <EventMask ShowMask="true" Msg="Cargando Reporte..." />
                             <ExtraParams>
                                <ext:Parameter Name="preciario" Value="App.txtPreciario.getValue()" Mode="Raw" />
                                <ext:Parameter Name="conceptoID" Value="App.txtConceptoID.getValue()" Mode="Raw" />
                                <ext:Parameter Name="elaboro" Value="App.txtElaboro.getValue()" Mode="Raw" />
                                <ext:Parameter Name="reviso" Value="App.txtReviso.getValue()" Mode="Raw" />
                                <ext:Parameter Name="autorizo" Value="App.txtAutorizo.getValue()" Mode="Raw" />
                            </ExtraParams>

                        </Click>
                    </DirectEvents>--%>
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



    </form>
</body>
</html>
