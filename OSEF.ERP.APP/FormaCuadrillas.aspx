<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormaCuadrillas.aspx.cs"
    Inherits="OSEF.ERP.APP.FormaCuadrillas" %>

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
    <script type="text/javascript" src="js/formacuadrillas.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <ext:ResourceManager ID="rmCuadrilla" runat="server" HideInDesign="true" />
    <ext:FormPanel ID="fpCodigosPostales" runat="server" Height="170" DefaultButton="imgbtnGuardar"
        BodyStyle="padding:5px 5px 0;" Layout="HBoxLayout" MonitorResize="true">
        <Items>
            <ext:Panel ID="Panel1" runat="server">
                <Items>
                    <ext:FieldContainer ID="FieldContainer3" runat="server" FieldLabel="ID" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                        </Items>
                    </ext:FieldContainer>
                    <ext:FieldContainer ID="FieldContainer2" runat="server" FieldLabel="Nombre" AnchorHorizontal="100%"
                        Layout="HBoxLayout">
                        <Items>
                        </Items>
                    </ext:FieldContainer>
                </Items>
            </ext:Panel>
        </Items>
    </ext:FormPanel>
    </form>
</body>
</html>
