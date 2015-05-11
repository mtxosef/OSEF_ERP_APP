﻿using System;
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
using System.IO;
using OSEF.APP.EL;
using OSEF.APP.BL;
using System;
using System.IO;
using System.IO.Compression;


namespace OSEF.ERP.APP
{
    public partial class FormaReporteEstimacion : System.Web.UI.Page
    {

        /// <summary>
        /// Se produce al principio de la inicialización de la página.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_PreInit(object sender, EventArgs e)
        {
            FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");
            //Checar ticket de autenticación
            UsuarioBusiness.checkValidSession(this);
            if (oFirmas == null)
            {
               sbParametros1.Text="Debes de configurar las firmas";
                
                imgbtnPresupuesto.Enabled = false;
                imgbtnResumen.Enabled = false;
                imgbtnEstimacion.Enabled = false;
                imgbtnGenerador.Enabled = false;
                imgbtnCroquis.Enabled = false;
                imgbtnFacturas.Enabled = false;
                imgbtnFotos.Enabled = false;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            // Checar ticket de autenticación
            UsuarioBusiness.checkValidSession(this);
        }

        protected void imgbtnExportarCroquis_Click(object sender, EventArgs e)
        {
            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

          
                //Firmas documento(Parametros)
               // string strElaboro = txtElaboro.Value.ToString();
               // string strReviso = txtReviso.Value.ToString();
                //string strAutorizo = txtAutorizo.Value.ToString();

                FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;

                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {


                    SqlCommand comando = new SqlCommand("web_spS_ObtenerCroquisPorIDMovimiento", conn);

                    SqlDataAdapter adaptador = new SqlDataAdapter(comando);

                    DataTable dt = new DataTable();
                    adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                    adaptador.Fill(dt);


                    SqlCommand comando2 = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn);
                    SqlDataAdapter adaptador2 = new SqlDataAdapter(comando2);

                    DataTable dt2 = new DataTable();
                    adaptador2.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adaptador2.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                    adaptador2.Fill(dt2);

                    ReportDocument reporteCroquis = new ReportDocument();
                    reporteCroquis.Load(Server.MapPath("reportess/rCroquis.rpt"));
                    reporteCroquis.SetDataSource(dt);
                    reporteCroquis.Subreports[0].SetDataSource(dt2);
                    reporteCroquis.SetParameterValue("elaboro", strElaboro);
                    reporteCroquis.SetParameterValue("reviso", strReviso);
                    reporteCroquis.SetParameterValue("autorizo", strAutorizo);
                    reporteCroquis.SetParameterValue("path", path);

                    string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                    //2. Validar si existe el directorio donde se guardaran
                    if (Directory.Exists(strDireccion))
                    {

                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                        // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                    }
                    else
                    {
                        Directory.CreateDirectory(strDireccion);
                        reporteCroquis.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf"));
                        ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCroquis " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                    }


                }
                catch (Exception ex)
                {
                    throw new Exception("Error " + ex.Message);
                }
                finally
                {
                    if (conn.State != ConnectionState.Closed)
                        conn.Close();
                    conn.Dispose();
                }

        }

        protected void imgbtnExportarFotos_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;


                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {
                    using (var comando = new SqlCommand("web_spS_ObtenerImagenesPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);


                            var reporteFotos = new ReportDocument();
                            reporteFotos.Load(Server.MapPath("reportess/rFotos.rpt"));
                            reporteFotos.SetDataSource(dt);
                            reporteFotos.SetParameterValue("elaboro", strElaboro);
                            reporteFotos.SetParameterValue("reviso", strReviso);
                            reporteFotos.SetParameterValue("autorizo", strAutorizo);
                            reporteFotos.SetParameterValue("pathFotos", path);

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteFotos.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rFotos " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void imgbtnExportarFactura_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;

                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerFacturasPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteFacturas = new ReportDocument();
                            reporteFacturas.Load(Server.MapPath("reportess/rNotaDeBitacora.rpt"));
                            reporteFacturas.SetDataSource(dt);
                            reporteFacturas.SetParameterValue("elaboro", strElaboro);
                            reporteFacturas.SetParameterValue("reviso", strReviso);
                            reporteFacturas.SetParameterValue("autorizo", strAutorizo);
                            reporteFacturas.SetParameterValue("pathFact", path);

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteFacturas.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNotaDeBitacora " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }



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

        protected void imgbtnExportarGenerador_Click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

  FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {



                    using (var comando = new SqlCommand("web_spS_ObtenerGeneradorPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteGenerador = new ReportDocument();
                            reporteGenerador.Load(Server.MapPath("reportess/rNumerosGeneradores.rpt"));
                            reporteGenerador.SetDataSource(dt);
                            reporteGenerador.SetParameterValue("elaboro", strElaboro);
                            reporteGenerador.SetParameterValue("reviso", strReviso);
                            reporteGenerador.SetParameterValue("autorizo", strAutorizo);


                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteGenerador.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rNumerosGeneradores " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void imgbtnEstimacion_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;
            
            
            FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {



                    using (var comando = new SqlCommand("web_spS_ObtenerREstimacion", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones= new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rCaratulaDeEstimacion.rpt"));
                            reporteEstimaciones.SetDataSource(dt);
                            reporteEstimaciones.SetParameterValue("elaboro", strElaboro);
                            reporteEstimaciones.SetParameterValue("reviso", strReviso);
                            reporteEstimaciones.SetParameterValue("autorizo", strAutorizo);


                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rCaratulaDeEstimacion " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void imgbtnResumen_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

              FirmasReportes oFirmas = FirmasReportesBusiness.ObtenerFirmasReportesPorModulo("Reportes");

                Usuario oUsuario = (Usuario)Session["Usuario"];
                string strElaboro = oUsuario.Nombre + " " + oUsuario.APaterno + " " + oUsuario.AMaterno;
                string strReviso = oFirmas.FirmaReviso;
                string strAutorizo = oFirmas.FirmaAutorizo;
                string path = AppDomain.CurrentDomain.BaseDirectory;
                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {

                    using (var comando = new SqlCommand("web_spS_ObtenerResumenDePartidasPorMovimiento", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones = new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rResumenPartidas.rpt"));
                            reporteEstimaciones.SetDataSource(dt);
                            reporteEstimaciones.SetParameterValue("elaboro", strElaboro);
                            reporteEstimaciones.SetParameterValue("autorizo", strAutorizo);


                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rResumenPartidas " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void imgbtnPresupuesto_click(object sender, EventArgs e)
        {

            //Parametros del store procedure
            string strID = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

                //1. Configurar la conexión y el tipo de comando
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["OSEF"].ConnectionString);
                try
                {
                    using (var comando = new SqlCommand("web_spS_ObtenerREstimacion", conn))
                    {
                        using (var adaptador = new SqlDataAdapter(comando))
                        {
                            DataTable dt = new DataTable();
                            adaptador.SelectCommand.CommandType = CommandType.StoredProcedure;
                            adaptador.SelectCommand.Parameters.Add(@"IDMovimiento", SqlDbType.Int).Value = Convert.ToInt32(strID);
                            adaptador.Fill(dt);

                            var reporteEstimaciones = new ReportDocument();
                            reporteEstimaciones.Load(Server.MapPath("reportess/rPresupuesto.rpt"));
                            reporteEstimaciones.SetDataSource(dt);

                            string strDireccion = Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + strID;

                            //2. Validar si existe el directorio donde se guardaran
                            if (Directory.Exists(strDireccion))
                            {

                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                                // reporteFotos.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "rFotos " + strID);

                            }
                            else
                            {
                                Directory.CreateDirectory(strDireccion);
                                reporteEstimaciones.ExportToDisk(ExportFormatType.PortableDocFormat, Server.MapPath("reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf"));
                                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('reportess/Estimaciones/" + strID + "/rPresupuesto " + strID + ".pdf',null,'height=700,width=660');popup.focus();", true);
                            }

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

        protected void crearZip(string url)
        {  
            DirectoryInfo directorySelected = new DirectoryInfo(url);
            List<FileInfo> fi = new  List<FileInfo>(directorySelected.GetFiles());

            //Se crea el archivo principal
            string file = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

            //foreach(FileInfo fileToCompress in
            //using (FileStream originalFileStream = fileToCompress.OpenRead())
            //{
            //    if ((File.GetAttributes(fileToCompress.FullName) & FileAttributes.Hidden) != FileAttributes.Hidden & fileToCompress.Extension != ".gz")
            //    {
            //        using (FileStream compressedFileStream = File.Create(fileToCompress.FullName + ".gz"))
            //        {
            //            using (GZipStream compressionStream = new GZipStream(compressedFileStream, CompressionMode.Compress))
            //            {
            //                originalFileStream.CopyTo(compressionStream);
            //            }
            //        }
            //    }
            //}



            foreach (FileInfo fileToCompress in fi)
            {
                Compress(fileToCompress, url); 
            }

        }

        public void Compress(FileInfo fileToCompress, string url)
        {
            using (FileStream originalFileStream = fileToCompress.OpenRead())
            {
                if ((File.GetAttributes(fileToCompress.FullName) & FileAttributes.Hidden) != FileAttributes.Hidden & fileToCompress.Extension != ".gz")
                {
                    using (FileStream compressedFileStream = File.Create(fileToCompress.FullName + ".gz"))
                    {
                        using (GZipStream compressionStream = new GZipStream(compressedFileStream, CompressionMode.Compress))
                        {
                            originalFileStream.CopyTo(compressionStream); 
                        }
                    }
                }
            }
        }
        //////Checar https://github.com/icsharpcode/SharpZipLib/wiki/Zip-Samples#anchorCreateIIS
        protected void descargarZIP(string url)
        {
            string fileName = Cookies.GetCookie("cookieEditarOrdenEstimacion") + ".zip";
            string fullpath = url + fileName;
            Response.Clear(); 
            Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName); 
            Response.ContentType = "application/x-zip-compressed";
            Response.WriteFile(fullpath); 
            Response.End();
        }
        protected void imgbtnTodo(object sender, EventArgs e)
        {
            imgbtnExportarFotos_Click(sender, e);
            imgbtnPresupuesto_click(sender, e);
            imgbtnExportarCroquis_Click(sender, e);
            imgbtnExportarFactura_Click(sender, e);
            imgbtnExportarGenerador_Click(sender, e);
            imgbtnEstimacion_click(sender, e);
            imgbtnResumen_click(sender, e);
            crearZip(Server.MapPath(" ") + "\\reportess\\Estimaciones\\" + Cookies.GetCookie("cookieEditarOrdenEstimacion").Value);
            //descargarZIP(Server.MapPath(" ") + "\\reportess\\Estimaciones\\");
        }
        //END
    }
}