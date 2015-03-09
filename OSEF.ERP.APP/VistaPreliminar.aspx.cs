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
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

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

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();
           // string rutaJavaScript = "";
            reporte.Load(Server.MapPath("reports/" + namereport+".rpt"));
           // reporte.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "VistaPreliminar");


            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Vista Preliminar");
          //  reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reports/" + namereport + ".pdf"));

        //        rutaJavaScript = "reports/" + namereport + ".pdf";
         //    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("ruta", rutaJavaScript, ParameterMode.Value));
        }

        protected void toPDF(object sender, EventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();
            // string rutaJavaScript = "";
            reporte.Load(Server.MapPath("reports/" + namereport + ".rpt"));
            // reporte.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "VistaPreliminar");


            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Vista Preliminar");
            //  reporte.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reports/" + namereport + ".pdf"));

            //        rutaJavaScript = "reports/" + namereport + ".pdf";
            //    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("ruta", rutaJavaScript, ParameterMode.Value));
        }


        protected void toXLS(object sender, DirectEventArgs e)
        {

            ReportDocument reporte = (ReportDocument)Session["imprimir"];
            string namereport = Session["ReportName"].ToString();
            string rutaJavaScript = "";
            reporte.Load(Server.MapPath("reports/" + namereport + ".rpt"));


            //ExportOptions CrExportOptions;
            //DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
            //ExcelFormatOptions CrFormatTypeOptions = new ExcelFormatOptions();
            //CrDiskFileDestinationOptions.DiskFileName = Server.MapPath("reports/" + namereport + ".xls");
            //CrExportOptions = reporte.ExportOptions;
            //CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
            //CrExportOptions.ExportFormatType = ExportFormatType.Excel;
            //CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
            //CrExportOptions.FormatOptions = CrFormatTypeOptions;
            //reporte.Export();

            reporte.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "Vista Preliminar");

            //rutaJavaScript = "reports/" + namereport + ".xls";
            //e.ExtraParamsResponse.Add(new Ext.Net.Parameter("ruta", rutaJavaScript, ParameterMode.Value));
  
    
           
        }
    }
}