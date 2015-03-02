using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class VistaPreliminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        
            crvEstimaciones.ToolPanelView = ToolPanelViewType.None;
            crvEstimaciones.ReportSource = (ReportDocument)Session["imprimir"];
            //reporte.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "VistaPreliminar");
            //reporte.Close();
            //reporte.Dispose();
        }

        protected void toPDF(object sender, DirectEventArgs e)
        {
         
            string path = AppDomain.CurrentDomain.BaseDirectory;

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();

            reporte.Load(Server.MapPath("reports/" + namereport));
            //reporte.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "VistaPreliminar");


            reporte.SetParameterValue("path", path);
            reporte.ExportToDisk(ExportFormatType.PortableDocFormat, path + "//" + namereport + ".pdf");
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('" + namereport + ".pdf');popup.focus();", true);
        }
    }
}