using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;

namespace OSEF.ERP.APP
{
    public partial class VistaPreliminar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            CrystalReportViewer1.ReportSource = reporte;
            //reporte.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "VistaPreliminar");
            //reporte.Close();
            //reporte.Dispose();
        }
    }
}