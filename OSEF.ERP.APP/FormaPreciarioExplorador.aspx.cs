using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace OSEF.ERP.APP
{
    public partial class FormaPreciarioExplorador : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void imgbtnExportar_Click(object sender, DirectEventArgs e)
        {
            string strPreciario = e.ExtraParams["preciario"];
            string strConceptoID = e.ExtraParams["conceptoID"];
            string nombre = "CPreciario";

            //1. Configurar la conexión y el tipo de comando
            var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
         //   string connectionString = ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString;
            try
            {
                using (var comando = new SqlCommand("web_spS_ObtenerCambiosPreciario", conn))
                {
                    using (var adaptador = new SqlDataAdapter(comando))
                    {
                        DataTable dt = new DataTable();
                        adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                        adaptador.SelectCommand.Parameters.Add(@"idconcepto", SqlDbType.NVarChar).Value = strConceptoID;
                        adaptador.SelectCommand.Parameters.Add(@"idpreciario", SqlDbType.NVarChar).Value = strPreciario;
                        adaptador.Fill(dt);
                        string path = AppDomain.CurrentDomain.BaseDirectory;

                        var reporte = new ReportDocument();
                        reporte.Load(Server.MapPath("reports/CPreciario.rpt"));
                        reporte.SetDataSource(dt);

                        //SqlConnectionStringBuilder SConn = new SqlConnectionStringBuilder(connectionString);
                        //reporte.DataSourceConnections[0].SetConnection(SConn.DataSource, SConn.InitialCatalog, SConn.UserID, SConn.Password);
                       

                        reporte.SetParameterValue("path", path);

                      
                        Session["ReportName"] = nombre;
                        Session["imprimir"] = reporte;

                    } // end using adaptador
                } // end using comando
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