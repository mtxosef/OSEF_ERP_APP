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

namespace OSEF.ERP.APP
{
    public partial class FormaReporteEstimacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void imgbtnExportar_Click(object sender, DirectEventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

            //Firmas documento(Parametros)
            string strElaboro = e.ExtraParams["elaboro"];
            string strReviso = e.ExtraParams["reviso"];
            string strAutorizo = e.ExtraParams["autorizo"];
            string nombreCroquis = "rCroquis";
            string nombreFotos = "rFotos";
            string nombreGeneradores = "rNumerosGeneradores";
            string nombreEstimacion = "rCaratulaDeEstimacion";
            string nombreResumen = "rResumenPartidas";
            string path = AppDomain.CurrentDomain.BaseDirectory;
            Session["eCroquis"] = "0";
            Session["eFotos"] = "0";
            Session["eGenerador"] = "0";
            Session["eEstimacion"] = "0";
            Session["eResumen"] = "0";
            //1. Configurar la conexión y el tipo de comando
            var conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
            try
            {
                //Si el check de Croquis esta activado
                if (chkCroquis.Checked)
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerCroquisPorIDMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            //adaptador.SelectCommand.Parameters.Add(@"IDConcepto", SqlDbType.NVarChar).Value = strConceptoID;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);


                            SqlCommand comando2 = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn);
                            SqlDataAdapter adaptador2 = new SqlDataAdapter(comando2);

                            DataTable dt2 = new DataTable();
                            adaptador2.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador2.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador2.Fill(dt2);



                            var reporteCroquis = new ReportDocument();
                            reporteCroquis.Load(Server.MapPath("reports/rCroquis.rpt"));
                            reporteCroquis.SetDataSource(dt);
                            reporteCroquis.Subreports[0].SetDataSource(dt2);
                            reporteCroquis.SetParameterValue("elaboro", strElaboro);
                            reporteCroquis.SetParameterValue("reviso", strReviso);
                            reporteCroquis.SetParameterValue("autorizo", strAutorizo);
                            reporteCroquis.SetParameterValue("path", path);




                            Session["eCroquis"] = "1";
                            Session["nCroquis"] = nombreCroquis;
                            Session["rCroquis"] = reporteCroquis;

                        } // end using adaptador
                    } // end using comando

                }//Fin Croquis


                //Si el check de Fotos esta activado
                if (chkFotos.Checked)
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerImagenesPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            //adaptador.SelectCommand.Parameters.Add(@"IDConcepto", SqlDbType.NVarChar).Value = strConceptoID;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);


                            var reporteFotos = new ReportDocument();
                            reporteFotos.Load(Server.MapPath("reports/rFotos.rpt"));
                            reporteFotos.SetDataSource(dt);
                            reporteFotos.SetParameterValue("elaboro", strElaboro);
                            reporteFotos.SetParameterValue("reviso", strReviso);
                            reporteFotos.SetParameterValue("autorizo", strAutorizo);
                            reporteFotos.SetParameterValue("pathFotos", path);

                            Session["eFotos"] = "1";
                            Session["nFotos"] = nombreFotos;
                            Session["rFotos"] = reporteFotos;

                        } // end using adaptador
                    } // end using comando

                }//Fin Fotos


              

                //Si el check de Generador esta activado
                if (chkGenerador.Checked)
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            //adaptador.SelectCommand.Parameters.Add(@"IDConcepto", SqlDbType.NVarChar).Value = strConceptoID;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteGenerador = new ReportDocument();
                            reporteGenerador.Load(Server.MapPath("reports/rNumerosGeneradores.rpt"));
                            reporteGenerador.SetDataSource(dt);
                            reporteGenerador.SetParameterValue("elaboro", strElaboro);
                            reporteGenerador.SetParameterValue("reviso", strReviso);
                            reporteGenerador.SetParameterValue("autorizo", strAutorizo);

                            Session["eGenerador"] = "1";
                            Session["nGenerador"] = nombreGeneradores;
                            Session["rGenerador"] = reporteGenerador;

                        } // end using adaptador
                    } // end using comando

                }//Fin Fotos


                //Si el check de Generador esta activado
                if (chkEstimacion.Checked)
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerREstimacion", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            //adaptador.SelectCommand.Parameters.Add(@"IDConcepto", SqlDbType.NVarChar).Value = strConceptoID;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimacion = new ReportDocument();
                            reporteEstimacion.Load(Server.MapPath("reports/rCaratulaDeEstimacion.rpt"));
                            reporteEstimacion.SetDataSource(dt);
                            reporteEstimacion.SetParameterValue("elaboro", strElaboro);
                            reporteEstimacion.SetParameterValue("reviso", strReviso);
                            reporteEstimacion.SetParameterValue("autorizo", strAutorizo);
                      
                            Session["eEstimacion"] = "1";
                            Session["nEstimacion"] = nombreEstimacion;
                            Session["rEstimacion"] = reporteEstimacion;

                        } // end using adaptador
                    } // end using comando

                }//Fin Fotos

                //Si el check de Generador esta activado
                if (chkResumen.Checked)
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerResumenDePartidasPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            //adaptador.SelectCommand.Parameters.Add(@"IDConcepto", SqlDbType.NVarChar).Value = strConceptoID;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteResumen = new ReportDocument();
                            reporteResumen.Load(Server.MapPath("reports/rResumenPartidas.rpt"));
                            reporteResumen.SetDataSource(dt);
                            reporteResumen.SetParameterValue("elaboro", strElaboro);
                            reporteResumen.SetParameterValue("autorizo", strAutorizo);
                            
                            Session["eResumen"] = "1";
                            Session["nResumen"] = nombreResumen;
                            Session["rResumen"] = reporteResumen;

                        } // end using adaptador
                    } // end using comando

                }//Fin Fotos

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


        protected void chkSeleccionarTodo_Click(object sender, DirectEventArgs e)
        {

            if (chkSeleccionarTodo.Checked)
            {
                chkEstimacion.Checked = true;
                chkCroquis.Checked = true;
                chkFotos.Checked = true;
                chkGenerador.Checked = true;
                chkResumen.Checked = true;
            }
            else
            {
                chkEstimacion.Checked = false;
                chkCroquis.Checked = false;
                chkFotos.Checked = false;
                chkGenerador.Checked = false;
                chkResumen.Checked = false;
            }
        }
    }
}