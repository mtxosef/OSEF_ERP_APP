using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;

namespace OSEF.ERP.APP
{
    public partial class ExploradorMesaDeReporte : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!X.IsAjaxRequest)
            {

                rmExploradorMesaDeReporte.RegisterIcon(Icon.Delete);

                sMesaDeReporte.DataSource = MesaDeReporteBusiness.ObtenerMesaDeReportesConcluidos();
                sMesaDeReporte.DataBind();

                sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnConcluidos();
                sSucursales.DataBind();

                sUsuarios.DataSource = UsuarioBusiness.ObtenerUsuarios();
                sUsuarios.DataBind();

            }
        }


        /// <summary>
        /// Evento que vuelve a leer los datos para ser cargados al store
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void OnReadData_sMesaDeReporte(object sender, StoreReadDataEventArgs e)
        {
            sMesaDeReporte.DataSource = MesaDeReporteBusiness.ObtenerMesaDeReportesConcluidos();
            sMesaDeReporte.DataBind();
            sSucursales.DataSource = SucursalBusiness.ObtenerSucursalesEnUsoEnConcluidos();
            sSucursales.DataBind();
        }
        [DirectMethod]
        protected void getCheckedRecords(object sender, DirectEventArgs e)
        {
            string data = e.ExtraParams["Values"];
            JsonObject[] jObjAr = JSON.Deserialize<JsonObject[]>(data);
            int n = 0;
            if (jObjAr.Length > 0)
            {
                foreach (JsonObject o in jObjAr)
                {
                    int id = Convert.ToInt32(o["Id"]);
                    MesaDeReporteBusiness.FacturarMesaDeReportePorID(id);
                    n++;
                }
                X.Msg.Alert("Mensaje", n + " Registros Facturados.", new JFunction { Fn = "showResult(true)" }).Show();
            }
            else
            {
                X.Msg.Alert("Atención", "Selecione al menos 1 registro.", new JFunction { Fn = "showResult(false)" }).Show();
            }
        }


        //Exporta a Excel el grid
        protected void ExportEt(object sender, EventArgs e)
        {

            string parametro = cmbClasificacion.Value.ToString();


            //1. Configurar la conexión y el tipo de comando
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                SqlCommand comando = new SqlCommand("web_spS_ObtenerReportesPorClasificacion", conn);

                SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                DataTable dt = new DataTable();
                adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                adaptador.SelectCommand.Parameters.Add(@"CLASIFICACION", SqlDbType.VarChar).Value = parametro;
                adaptador.Fill(dt);



                ReportDocument reporteCuadrila = new ReportDocument();
                reporteCuadrila.Load(Server.MapPath("reportess/rMantenimientosFacturador.rpt"));
                reporteCuadrila.SetDataSource(dt);


                 reporteCuadrila.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.Excel, Response, true, "Reportes Mantenimiento " + parametro);

            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
            finally
            {
                if (conn.State != ConnectionState.Closed)
                    conn.Close();
                conn.Dispose();
            }
        }


    }
}