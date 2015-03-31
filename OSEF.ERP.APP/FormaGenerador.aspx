<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaGenerador.aspx.cs" Inherits="OSEF.ERP.APP.FormaGenerador" %>

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
    <script type='text/javascript' src="js/formaGenerador.js"></script>
</head>
<body>
    <form id="form1" runat="server">
   
    <ext:ResourceManager ID="rmFormaGenerador" runat="server" HideInDesign="true" />

        <ext:GridPanel
                ID="gpFormaGenerador"
                runat="server"
                Width="810"
                Height="260"
                BodyPadding="10"
                AutoScroll="true"
                EnableColumnHide="false"
                EnableColumnMove="false">

                <TopBar>
                <ext:Toolbar ID="tbFormaGenerador" runat="server">
                    <Items>
                        <ext:ImageButton
                            ID="imgbtnAceptar"
                            runat="server"
                            ImageUrl="assets/img/controles/Guardar.png" 
                            DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                            OverImageUrl="assets/img/controles/GuardarOver.png" 
                            PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                            ToolTip="Guardar" 
                            Disabled="true"
                            Height="30"
                            Width="30">
                            <Listeners>
                                <Click Fn="imgbtnAceptar_Click"></Click>
                            </Listeners>
                        </ext:ImageButton>
                         <ext:ImageButton 
                            ID="imgbtnCancelar" 
                            runat="server" 
                            ImageUrl="assets/img/controles/Cancelar.png" 
                            DisabledImageUrl="assets/img/controles/CancelarDisabled.png"
                            OverImageUrl="assets/img/controles/CancelarOver.png" 
                            PressedImageUrl="assets/img/controles/CancelarPressed.png" 
                            ToolTip="Cancelar" 
                            Height="30" 
                            Width="30">
                            <Listeners>
                                <Click Handler="window.parent.App.wEmergente.hide();" />
                            </Listeners>
                        </ext:ImageButton>

                        <ext:TextField
                        ID="txtDescripcionCorta" 
                        runat="server" 
                        Width="400"
                        EmptyText="Descripción Corta">
                            <Listeners>
                                <Change Fn="txtDescripcion_Corta_Change"></Change>
                            </Listeners>
                        </ext:TextField>
                    </Items>
                </ext:Toolbar>
            </TopBar>

                 <Store>
                    <ext:Store
                        ID="sFormaGenerador"
                        runat="server">
                        <Model>
                            <ext:Model 
                                ID="mFormaGenerador"
                                runat="server">
                                <Fields>
                                    <ext:ModelField Name="ID" Type="Int" />
                                    <ext:ModelField Name="ConceptoID" Type="Int" />
                                    <ext:ModelField Name="No" Type="String" />
                                    <ext:ModelField Name="Localizacion" Type="String" />
                                    <ext:ModelField Name="Largo" Type="Float" />
                                    <ext:ModelField Name="Ancho" Type="Float" />
                                    <ext:ModelField Name="Alto" Type="Float" />
                                    <ext:ModelField Name="Cantidad" Type="Float" />
                                    <ext:ModelField Name="Total" Type="Float" />
                                </Fields>
                            </ext:Model>
                        </Model>
                        <Listeners>
                            <Load Fn="sFormaGenerador_Load"></Load>
                        </Listeners>
                    </ext:Store>
                </Store>
                <ColumnModel 
                    ID="cmFormaGenerador" 
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
                            ID="cNo"
                            runat="server"
                            Text="No."
                            Width="60"
                            DataIndex="No">
                            <Editor>
                                <ext:TextField ID="txtfNo" runat="server">
                                      <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners>            
                                </ext:TextField>
                            </Editor>
                        </ext:Column>
                        <ext:Column
                            ID="cLocalizacion"
                            runat="server"
                            Text="Lozalización"
                            Width="220"
                            DataIndex="Localizacion">
                            <Editor>
                                <ext:TextField ID="txtfLozalizacion" runat="server">
                                      <Listeners>
                                        <Blur Handler="this.setValue(this.getValue().toUpperCase());" />
                                    </Listeners>             
                                </ext:TextField>
                            </Editor>
                        </ext:Column>
                        <ext:NumberColumn
                            ID="cLargo"
                            runat="server"
                            Align="Center"
                            Text="Largo"
                            DataIndex="Largo"
                            Width="90">
                            <Renderer Fn="nfLargo_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfLargo"
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
                                        <Change Fn="calcularTotalLargo_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncAncho"
                            runat="server"
                            Align="Center"
                            Text="Ancho"
                            DataIndex="Ancho"
                            Width="90">
                            <Renderer Fn="nfAncho_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfAncho"
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
                                        <Change Fn="calcularTotalAncho_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncAlto"
                            runat="server"
                            Align="Center"
                            Text="Alto"
                            DataIndex="Alto"
                            Width="90">
                            <Renderer Fn="nfAlto_Renderer" />
                            <Editor>
                                <ext:NumberField 
                                    ID="nfAlto"
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
                                        <Change Fn="calcularTotalAlto_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>
                         <ext:NumberColumn
                            ID="ncCantidad"
                            runat="server"
                            Align="Center"
                            Text="Cantidad"
                            DataIndex="Cantidad"
                            Width="105">
                            <Renderer Fn="nfCantidad_Renderer" />
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
                                        <Change Fn="calcularTotalCantidad_Change"></Change>
                                    </Listeners>
                                </ext:NumberField>
                            </Editor>
                        </ext:NumberColumn>

                        <ext:NumberColumn
                            ID="ncTotal"
                            runat="server"
                            Align="Center"
                            Text="Total"
                            DataIndex="Total"
                            Width="120">
                            <Renderer Fn="ncTotal_Renderer" />
                        </ext:NumberColumn>


                    </Columns>
                </ColumnModel>   
                <%--  <Listeners>
                    <ItemClick Fn="gpPreciarioConceptos_ItemClick" />
                </Listeners>--%>
                <SelectionModel>
                    <ext:CellSelectionModel
                        ID="csmGenerador" 
                        runat="server">
                       
                    </ext:CellSelectionModel>
                </SelectionModel>
                <Plugins>
                    <ext:CellEditing 
                        ID="ceGenerador" 
                        runat="server"
                        ClicksToEdit="1">
                        <Listeners>
                          <Edit Fn="ceGenerador_Edit" />
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
                <BottomBar>
                <ext:Toolbar ID="tGenerador" runat="server">
                    <Items>
                        <ext:DisplayField
                            ID="dfTotal"
                            runat="server"
                            FieldLabel="Total"
                            Cls="total-field"
                            Margins="0 0px 0 560px"
                            Width="240"
                            Text="">
                        </ext:DisplayField>
                    </Items>
                </ext:Toolbar>
            </BottomBar>

                        <Listeners>
                        <Select Fn="obetenerRenglon_Select"></Select>
                        </Listeners>
            </ext:GridPanel>

    </form>
</body>
</html>
