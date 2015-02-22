<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaImagenesPreciarios.aspx.cs" Inherits="OSEF.ERP.APP.FormaImagenesPreciarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel="stylesheet" href="css/login.css" />
    <link rel="Stylesheet" href="css/customControls.css" />
    <script type="text/javascript" src="js/avance.js"></script>
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


    <ext:XScript runat="server">
        <script>
            var prepareData = function (data) {
                data.Nombre = Ext.util.Format.ellipsis(data.Nombre, 50);
                return data;
            };
        </script>
    </ext:XScript>
    <style type="text/css">
        .images-view .x-panel-body {
            background: white;
            font: 11px Arial, Helvetica, sans-serif;
        }
        
        .images-view .thumb {
            background: #dddddd;
            padding: 3px;
            padding-bottom: 0;
        }

        .x-quirks .images-view .thumb {
            padding-bottom: 3px;
        }

        .images-view .thumb img {
            height: 120px;
            width: 140px;
        }

        .images-view .thumb-wrap {
            float: left;
            margin: 4px;
            margin-right: 0;
            padding: 5px;
        }

        .images-view .thumb-wrap span {  
            display: block;
            overflow: hidden;
            text-align: center;
            width: 146px; // for ie to ensure that the text is centered
        }

        .images-view .x-item-over{
            border: 1px solid #dddddd;
            background: #efefef url(../../Shared/images/row-over.gif) repeat-x left top;
            padding: 4px;
        }

        .images-view .x-item-selected{
            background: #eff5fb url(../../Shared/images/selected.gif) no-repeat right bottom;
            border: 1px solid #99bbe8;
            padding: 4px;
        }

        .images-view .x-item-selected .thumb{
            background: transparent;
        }

        .images-view .loading-indicator {
            font-size: 11px;
            background-image : url('../../Shared/images/loading.gif');
            background-repeat: no-repeat;
            background-position: left;
            padding-left: 20px;
            margin: 10px;
        }

        .x-view-selector {
            position: absolute;
            left: 0;
            top: 0;
            width: 0;
            border: 1px dotted;
            opacity: .5;
            -moz-opacity: .5;
            filter: alpha(opacity=50);
            zoom: 1;
            background-color: #c3daf9;
            border-color: #3399bb;
        }

        .ext-strict .ext-ie .x-tree .x-panel-bwrap {
            position: relative;
            overflow: hidden;
        }
    </style>

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

    </form>
</body>
</html>
