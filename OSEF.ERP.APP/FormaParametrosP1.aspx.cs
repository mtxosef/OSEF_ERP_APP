using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using OSEF.APP.EL;
using Ext.Net;
using CrystalDecisions.CrystalReports.Engine;

namespace OSEF.ERP.APP
{
    public partial class FormaParametrosP1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //2. Cargar sucursales
            sPreciario.DataSource = PreciarioBusiness.ObtenerPreciariosActivos();
            sPreciario.DataBind();
        }

        /// <summary>
        /// Evento que se lanza al escoger un elemento de Preciarios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void cmbPreciarios_Change(object sender, DirectEventArgs e)
        {
            //1. Obtener el Preciario seleccionado y obtener sus datos junto con su sucursal
            string strPreciarios = e.ExtraParams["valor"];
            Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID(strPreciarios);
           

        }


        protected void imgbtnExportar_Click(object sender, DirectEventArgs e)
        {
            try
            {
                var reporte = new ReportDocument();
                reporte.Load(Server.MapPath("reports/Estimaciones.rpt"));

                Session["imprimir"] = reporte;


            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }


        }

    }
}