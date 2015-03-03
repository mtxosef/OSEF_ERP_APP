<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaBuscaPreciarioConcepto.aspx.cs" Inherits="OSEF.ERP.APP.FormaBuscaPreciarioConcepto" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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


   
</head>
<body>
  <form id="form1" runat="server">
        <ext:ResourceManager ID="rmFormaBuscarPreciarioConcepto" runat="server" HideInDesign="true" />

        

         <ext:FormPanel 
            ID="fpBuscaPreciarioConcepto"
            runat="server"
            MonitorResize="true"
            Height="450"
            Width="665"
            BodyStyle="background-color:#fff;">
       
            <Items>
                <ext:Panel 
                    ID="pFiltros" 
                    runat="server" 
                    BodyPadding="10"
                    Width="700"
                    Height="127" 
                    AutoScroll="false">
                    <Items>
                        <ext:FieldContainer
                                ID="fcFiltros"
                                runat="server"
                                FieldLabel="Categoría"
                                AnchorHorizontal="100%"
                                LabelWidth="120"
                                Layout="ColumnLayout">
                                <Items>
                                    <ext:ComboBox
                                            ID="cmbCategoria"
                                            runat="server"
                                            Width="200"
                                            MatchFieldWidth="false"
                                            StyleSpec="margin-right: 6px;"
                                            Cls="spanCustomCombo xEspacioCmbxCustom"
                                            AllowBlank="false">
                                        </ext:ComboBox>
                                    <ext:TextField
                                        ID="txtCategoria"
                                        runat="server"
                                        Width="300"
                                        Disabled="true">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                          <ext:FieldContainer
                                ID="fcFiltro2"
                                runat="server"
                                FieldLabel="SubCategoría"
                                AnchorHorizontal="100%"
                                LabelWidth="120"
                                Layout="ColumnLayout">
                                <Items>
                                    <ext:ComboBox
                                            ID="cmbSubCategoria"
                                            runat="server"
                                            Width="200"
                                            MatchFieldWidth="false"
                                            StyleSpec="margin-right: 6px;"
                                            Cls="spanCustomCombo xEspacioCmbxCustom"
                                            AllowBlank="false">
                                        </ext:ComboBox>
                                    <ext:TextField
                                        ID="txtSubcategoria"
                                        runat="server"
                                        Width="300"
                                        Disabled="true">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                            <ext:FieldContainer
                                ID="fcFiltro3"
                                runat="server"
                                FieldLabel="SubSubCategoría"
                                AnchorHorizontal="100%"
                                LabelWidth="120"
                                Layout="ColumnLayout">
                                <Items>
                                     <ext:ComboBox
                                            ID="cmbSubSubCategoria"
                                            runat="server"
                                            Width="200"
                                            MatchFieldWidth="false"
                                            StyleSpec="margin-right: 6px;"
                                            Cls="spanCustomCombo xEspacioCmbxCustom"
                                            AllowBlank="false">
                                        </ext:ComboBox>
                                    <ext:TextField
                                        ID="txtSubSubCategoria"
                                        runat="server"
                                        Width="300"
                                        Disabled="true">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                             <ext:FieldContainer
                                ID="fcFiltroID"
                                runat="server"
                                FieldLabel="ID Concepto"
                                AnchorHorizontal="100%"
                                LabelWidth="120"
                                Layout="ColumnLayout">
                                <Items>
                                    <ext:TextField
                                        ID="txtConcepto"
                                        runat="server"
                                        Width="200"
                                        AllowBlank="false"
                                        Disabled="false">
                                    </ext:TextField>
                                </Items>
                            </ext:FieldContainer>
                    </Items>
                </ext:Panel>
     
                <%--  DETALLE PRECIARIO--%>
                <ext:Panel
                    ID="pConceptos"
                    runat="server"
                    BodyPadding="5"
                    Width="660"
                    AutoScroll="True">
                    <Items>
                        <ext:FieldSet
                            ID="fsConceptos" 
                            runat="server" 
                            Height="245" 
                            Title="Conceptos"
                            DefaultAnchor="100%">
                            <Items>
                                <ext:GridPanel
                                    ID="gpConceptos"
                                    runat="server"
                                    Width="700"
                                    Height="220">
                                    <Store>
                                        <ext:Store
                                            ID="sCarga"
                                            runat="server">
                                            <Model>
                                                <ext:Model ID="mCarga" runat="server">
                                                    <Fields>
                                                        <ext:ModelField Name="ID" Type="String" />
                                                        <ext:ModelField Name="Descripcion" Type="String" />
                                                        <ext:ModelField Name="Unidad" Type="String" />
                                                        <ext:ModelField Name="Cantidad" Type="Float" />
                                                        <ext:ModelField Name="Utilizada" Type="Float" />
                                                    
                                                    </Fields>
                                                </ext:Model>
                                            </Model>
                                        </ext:Store>
                                        
                                    </Store>

                                    <ColumnModel 
                                        ID="cmPreciario" 
                                        runat="server">
                                        <Columns>
                                            <ext:Column
                                                ID="cIDPreciario"
                                                runat="server"
                                                Text="ID"
                                                Width="80"
                                                DataIndex="Clave">
                                            </ext:Column>
                                            <ext:Column
                                                ID="cConcepto"
                                                runat="server"
                                                Text="Concepto"
                                                Width="260"
                                                DataIndex="Descripcion">
                                            </ext:Column>
                                             <ext:Column
                                                ID="cCantidad"
                                                runat="server"
                                                Align="Center"
                                                Text="Cantidad"
                                                DataIndex="Cantidad"
                                                Width="100">
                                            </ext:Column>
                                            <ext:Column
                                                ID="cUtilizada"
                                                runat="server"
                                                Align="Center"
                                                Text="Utilizada"
                                                DataIndex="Utilizada"
                                                Width="100">
                                            </ext:Column>
                                             <ext:Column
                                                ID="cUnidad"
                                                runat="server"
                                                Text="Unidad"
                                                Width="60"
                                                DataIndex="Unidad">
                                            </ext:Column>
                                        </Columns>
                                    </ColumnModel>
                                    <SelectionModel>
                                        <ext:CellSelectionModel
                                            ID="csmPreciario" 
                                            runat="server">
                                        </ext:CellSelectionModel>
                                    </SelectionModel>
                                    <View>
                                        <ext:GridView
                                            ID="gvPreciario"
                                            runat="server"
                                            StripeRows="true">
                                        </ext:GridView>
                                    </View>
                                  
                                
                                </ext:GridPanel>
                                <%--Fin Detalle PRECIARIO--%>
                            </Items>
                        </ext:FieldSet>
                    </Items>
                </ext:Panel>
            </Items>
             <Listeners>
                <ValidityChange Handler=" #{imgbtnGuardar}.setDisabled(!valid);" />
            </Listeners>
             <Buttons>
                <ext:ImageButton
                    ID="imgbtnGuardar" 
                    runat="server" 
                    ImageUrl="assets/img/controles/Guardar.png" 
                    DisabledImageUrl="assets/img/controles/GuardarDisabled.png"
                    OverImageUrl="assets/img/controles/GuardarOver.png" 
                    PressedImageUrl="assets/img/controles/GuardarPressed.png" 
                    ToolTip="Seleccionar" 
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
                    Width="50"
                    MarginSpec="0 20 0 0">
                    <Listeners>
                        <Click Handler="window.parent.App.wEmergente.hide();" />
                    </Listeners>
                </ext:ImageButton>
            </Buttons> 
        </ext:FormPanel>
 
    </form>
</body>
</html>
