<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaImagenesPreciarios.aspx.cs" Inherits="OSEF.ERP.APP.FormaImagenesPreciarios" %>

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
    <link rel="stylesheet" href="css/xDisplayImages.css"/>

    <ext:XScript runat="server">
        <script>
            var prepareData = function (data) {
                data.Nombre = Ext.util.Format.ellipsis(data.Nombre, 50);
                return data;
            };
        </script>
    </ext:XScript>
</head>
<body>
    <form id="form1" runat="server">
        <ext:ResourceManager ID="rmImgenesPreciarios" runat="server" HideInDesign="true" />

        <ext:Store ID="sImagenesVolumetriasD" runat="server" >
            <Model>
                <ext:Model ID="mImagenesVolumetriasD" runat="server">
                    <Fields>
                        <ext:ModelField Name="Volumetria" Type="Int" />
                        <ext:ModelField Name="PreciarioConcepto" Type="String" />
                        <ext:ModelField Name="Nombre" Type="String" />
                        <ext:ModelField Name="Direccion" Type="String" />      
                        <ext:ModelField Name="Usuario" Type="String" />
                        <ext:ModelField Name="FechaAlta" Type="Date" />
                    </Fields>
                </ext:Model>
            </Model>
        </ext:Store>

         <ext:Panel 
            ID="fpImagenesVolumetriaD"
            runat="server" 
            BodyStyle="background-color:#fff;"
          
            Height="479"
            Width="660"
            AutoScroll="true">
            <Items>
                <ext:DataView
                    ID="dvImagenesPreciarios"
                    runat="server"
                    ItemSelector="div.thumb-wrap"
                    EmptyText="No hay imagenes para mostrar"
                    StoreID="sImagenesVolumetriasD"
                    MultiSelect="true"
                    OverItemCls="x-item-over"
                    TrackOver="true"
                    Cls="images-view">
                    <Tpl ID="Tpl1" runat="server">
                        <Html>
                            <tpl for=".">
                                <div class="thumb-wrap" id="{Nombre}">
                                    <div class="thumb"><img src="{Direccion}" title="{Nombre}"></img></div>
                                    <span class="x-editable">{Nombre}</span>
                                </div>
                            </tpl>
                            <div class="x-clear"></div>
                        </Html>
                    </Tpl>
                    <PrepareData Fn="prepareData" />
                </ext:DataView>
            </Items>
         </ext:Panel>
    </form>
</body>
</html>