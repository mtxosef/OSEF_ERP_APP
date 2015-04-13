using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;
using System.IO;

namespace OSEF.ERP.APP
{
    public partial class FormaOrdenesEstimaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
                //2. Checar ticket de autenticación
                UsuarioBusiness.checkValidSession(this);
                //sSucursal.DataSource = SucursalBusiness.ObtenerSucursales();
                //sSucursal.DataBind();
            }
        }

        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sOrdenMantenimiento_Load()
        {
            //Obtener la cookie al cargar
            string strcookieEditarOrdenEstimacion = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;

            //Validar si es diferente de Nuevo
            if (!strcookieEditarOrdenEstimacion.Equals("Nuevo"))
            {
                //Cargar el encabezado del movimiento
                OrdenEstimacion oOrdenEstimacion = OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(Convert.ToInt32(strcookieEditarOrdenEstimacion));

                if (oOrdenEstimacion.Mov.Equals("Estimacion"))
                {
                    //Cargar el detalle del movimiento enlazando la estimacion
                    sConceptos.DataSource = OrdenEstimacionDBusiness.ObtenerOrdenEstimacionDPorOrigen(oOrdenEstimacion.OrigenId);
                    sConceptos.DataBind();
                }
                else {
                    //Cargar el detalle del movimiento normal
                    sConceptos.DataSource = OrdenEstimacionDBusiness.ObtenerOrdenEstimacionDPorOrdenEstimacion(oOrdenEstimacion.Id);
                    sConceptos.DataBind();

                }

                
                sOrdenEstimacion.Add(new
                {
                    ID = oOrdenEstimacion.Id,
                    Mov = oOrdenEstimacion.Mov,
                    MovID = oOrdenEstimacion.MovID,
                    Sucursal = oOrdenEstimacion.Sucursal,
                    FechaEmision = oOrdenEstimacion.FechaEmision,
                    Observaciones = oOrdenEstimacion.Observaciones,
                    Estatus = oOrdenEstimacion.Estatus,
                    Usuario = oOrdenEstimacion.Usuario,
                    RSucursal = oOrdenEstimacion.RSucursal,
                    Origen = oOrdenEstimacion.Origen,
                    OrigenID = oOrdenEstimacion.OrigenId,
                    Reporte =oOrdenEstimacion.Reporte,
                    Division=oOrdenEstimacion.Division,
                    FechaOrigen=oOrdenEstimacion.FechaOrigen,
                    FechaMaximaAtencion = oOrdenEstimacion.FechaMaximaAtencion,
                    DiasAtencion=oOrdenEstimacion.DiasAtencion,
                    Reporto=oOrdenEstimacion.Reporto,
                    TrabajoRequerido=oOrdenEstimacion.TrabajoRequerido,
                    Atiende=oOrdenEstimacion.Atiende,


                    TrabajoRealizado=oOrdenEstimacion.TrabajoRealizado,
                    CodigoFalla=oOrdenEstimacion.CodigoFalla,
                    TieneFotos=oOrdenEstimacion.TieneFotos,
                    TieneReporte=oOrdenEstimacion.TieneReporte,
                    FechaLlegada=oOrdenEstimacion.FechaLlegada,
                    HoraLlegada=oOrdenEstimacion.HoraLlegada,
                    FechaFinActividad=oOrdenEstimacion.FechaFinActividad,
                    HoraFinActividad=oOrdenEstimacion.HoraFinActividad,
                    Zona=oOrdenEstimacion.Zona,
                    Cuadrilla=oOrdenEstimacion.Cuadrilla

                });
            }
        }

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strOrdenEstimacionForma = e.ExtraParams["OrdenEstimacionForma"];
            string strOrdenEstimacion = e.ExtraParams["OrdenEstimacion"];
            string strOrdenEstimacionD = e.ExtraParams["OrdenEstimacionD"];
            string strcookieEditarOrdenEstimacion = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;
            string strSucursal = e.ExtraParams["Sucursal"];
            string strDiasAtencion = e.ExtraParams["diasAtencion"];


            if (strDiasAtencion.Equals("1")) {
                strDiasAtencion = "0";
            }

            decimal diasAtencion = Convert.ToDecimal(strDiasAtencion);

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strOrdenEstimacionForma);
            OrdenEstimacion oFormaOrdenEstimacion = ObtenerObjetoDesdeForma(dRegistro);
            OrdenEstimacion oOrdenEstimacion = JSON.Deserialize<List<OrdenEstimacion>>(strOrdenEstimacion).FirstOrDefault();
            List<OrdenEstimacionD> lOrdenEstimacionD = JSON.Deserialize<List<OrdenEstimacionD>>(strOrdenEstimacionD);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD, strSucursal, diasAtencion);

            //4. Validar que efecto realizará para Guardar o Afectar
            switch (strAccion)
            {
                case "insertar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                    break;
                case "modificar":
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                    break;
            }
        }


        /// <summary>
        /// Evento de clic del botón Afectar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnAfectar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strMovimiento = e.ExtraParams["Movimiento"];
            string strOrdenEstimacionForma = e.ExtraParams["OrdenEstimacionForma"];
            string strOrdenEstimacion = e.ExtraParams["OrdenEstimacion"];
            string strOrdenEstimacionD = e.ExtraParams["OrdenEstimacionD"];
            string strcookieEditarOrdenEstimacion = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;
            string strSucursal = e.ExtraParams["Sucursal"];
            string strDiasAtencion = e.ExtraParams["diasAtencion"];

            decimal diasAtencion = Convert.ToDecimal(strDiasAtencion);
            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strOrdenEstimacionForma);
            OrdenEstimacion oFormaOrdenEstimacion = ObtenerObjetoDesdeForma(dRegistro);
            OrdenEstimacion oOrdenEstimacion = JSON.Deserialize<List<OrdenEstimacion>>(strOrdenEstimacion).FirstOrDefault();
            List<OrdenEstimacionD> lOrdenEstimacionD = JSON.Deserialize<List<OrdenEstimacionD>>(strOrdenEstimacionD);

            //Nos traemos el movimiento actual
            string strEstimacion= Cookies.GetCookie("cookieEsEstimacion").Value;
            //Nos traemos el ID del movimiento actual
            string iID = Cookies.GetCookie("cookieIDMov").Value;
            //Validamos que sea un movimiento de reporte para que avance a estimacion
            if (strEstimacion.Equals("Reporte"))
            {
                //Se ejecuta el procedure que avanza e inserta en la tabla el nuevo movimiento
                int iIDNuevo = OrdenEstimacionBusiness.AvanzarReportePorID(Convert.ToInt32(iID), "Estimacion");
                //Obtenemos los nuevos valores del nuevo movimiento
                OrdenEstimacion nuevosValores= OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(Convert.ToInt32(iIDNuevo));

                //Cargar el detalle del movimiento

                sConceptos.DataSource = OrdenEstimacionDBusiness.ObtenerOrdenEstimacionDPorOrigen(nuevosValores.OrigenId);
                sConceptos.DataBind();

                //Se manda el parametro que hara la validacion del lado del cliente
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("mov", "Estimacion", ParameterMode.Value));

                   //Actualizar store 
                    sOrdenEstimacion.GetAt(0).Set("ID", iIDNuevo);
                    sOrdenEstimacion.GetAt(0).Set("Mov", nuevosValores.Mov);
                    sOrdenEstimacion.GetAt(0).Set("MovID", nuevosValores.MovID);
                    sOrdenEstimacion.GetAt(0).Set("Origen", nuevosValores.Origen);
                    sOrdenEstimacion.GetAt(0).Set("OrigenID", nuevosValores.OrigenId);
                    sOrdenEstimacion.GetAt(0).Set("Sucursal", nuevosValores.Sucursal);
                    sOrdenEstimacion.GetAt(0).Set("FechaEmision", nuevosValores.FechaEmision);
                    sOrdenEstimacion.GetAt(0).Set("Observaciones", nuevosValores.Observaciones);
                    sOrdenEstimacion.GetAt(0).Set("Estatus", nuevosValores.Estatus);
                    sOrdenEstimacion.GetAt(0).Set("RSucursal", nuevosValores.RSucursal);


                //Campos extras de reporte

                    sOrdenEstimacion.GetAt(0).Set("Reporte", nuevosValores.Reporte);
                    sOrdenEstimacion.GetAt(0).Set("Division", nuevosValores.Division);
                    sOrdenEstimacion.GetAt(0).Set("FechaOrigen", nuevosValores.FechaOrigen);
                    sOrdenEstimacion.GetAt(0).Set("FechaMaximaAtencion", nuevosValores.FechaMaximaAtencion);
                    sOrdenEstimacion.GetAt(0).Set("DiasAtencion", nuevosValores.DiasAtencion);
                    sOrdenEstimacion.GetAt(0).Set("Reporto", nuevosValores.Reporto);
                    sOrdenEstimacion.GetAt(0).Set("TrabajoRequerido", nuevosValores.TrabajoRequerido);
                    sOrdenEstimacion.GetAt(0).Set("Atiende", nuevosValores.Atiende);

                //Campos extras 2
 
                sOrdenEstimacion.GetAt(0).Set("TrabajoRealizado", nuevosValores.TrabajoRealizado);
                  sOrdenEstimacion.GetAt(0).Set("CodigoFalla", nuevosValores.CodigoFalla);
                    sOrdenEstimacion.GetAt(0).Set("TieneFotos", nuevosValores.TieneFotos);
                    sOrdenEstimacion.GetAt(0).Set("TieneReporte", nuevosValores.TieneReporte);
                    sOrdenEstimacion.GetAt(0).Set("FechaLlegada", nuevosValores.FechaLlegada);
                    sOrdenEstimacion.GetAt(0).Set("HoraLlegada", nuevosValores.HoraLlegada);
                    sOrdenEstimacion.GetAt(0).Set("FechaFinActividad", nuevosValores.FechaFinActividad);
                    sOrdenEstimacion.GetAt(0).Set("HoraFinActividad", nuevosValores.HoraFinActividad);
                    sOrdenEstimacion.GetAt(0).Set("Zona", nuevosValores.Zona);
                sOrdenEstimacion.GetAt(0).Set("Cuadrilla", nuevosValores.Cuadrilla);

               

            }
            //Si no es estimacion sale de la validacion y afecta normal
            else
            {

                //3. Guardar o Actuaizar el Movimiento
                string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD,strSucursal,diasAtencion);

                //4. Validar que efecto realizará para Guardar o Afectar
                switch (strAccion)
                {
                    case "insertar":
                        e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "insertar", ParameterMode.Value));
                        break;
                    case "modificar":
                        e.ExtraParamsResponse.Add(new Ext.Net.Parameter("accion", "modificar", ParameterMode.Value));
                        break;
                }

             
                //4. Lanzar la afectación del Movimiento

                if (strMovimiento.Trim().Equals("Orden de Cambio"))
                {
                    OrdenEstimacionBusiness.AfectarOrdenPorID(oFormaOrdenEstimacion);
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("mov", "Orden", ParameterMode.Value));
                }

                if (strMovimiento.Trim().Equals("Mesa de reporte"))
                {
                    OrdenEstimacionBusiness.AfectarEstimacionPorID(oFormaOrdenEstimacion);
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("mov", "Reporte", ParameterMode.Value));
                }

                oOrdenEstimacion = OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(oFormaOrdenEstimacion.Id);
                //7. Actualizar store de Revision
                sOrdenEstimacion.GetAt(0).Set("MovID", oOrdenEstimacion.MovID);
                sOrdenEstimacion.GetAt(0).Set("Estatus", oOrdenEstimacion.Estatus);

            }

            

        }

        /// <summary>
        /// Método que transforma los datos Control-Valor a objeto Volumetria
        /// </summary>
        /// <param name="dRegistro"></param>
        /// <returns></returns>
        private OrdenEstimacion ObtenerObjetoDesdeForma(Dictionary<string, string> dRegistro)
        {
            //1. Declarar objeto Volumetria donde se guardarán los valores
            OrdenEstimacion oOrdenEstimacionForma = new OrdenEstimacion();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos de la OrdenEstimacion
                    case "cmbMov":
                        oOrdenEstimacionForma.Mov = sd.Value;
                        break;
                    case "txtIDSucursal":
                        oOrdenEstimacionForma.Sucursal = sd.Value;
                        break;
                    case "dfFechaEmision":
                        oOrdenEstimacionForma.FechaEmision = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfObservaciones":
                        oOrdenEstimacionForma.Observaciones = sd.Value;
                        break;
                    case "txtNoReporte":
                        oOrdenEstimacionForma.Reporte = sd.Value;
                        break;
                    case "cmbDivision":
                        oOrdenEstimacionForma.Division = sd.Value;
                        break;

                    case "dfFechaOrigen":
                        if (sd.Value == null)
                            oOrdenEstimacionForma.FechaOrigen = null;
                        else
                            oOrdenEstimacionForma.FechaOrigen = Convert.ToDateTime(sd.Value);
                        break;


                    case "dfFechaMaxima":
                        if (sd.Value == null)
                            oOrdenEstimacionForma.FechaMaximaAtencion = null;
                        else
                            oOrdenEstimacionForma.FechaMaximaAtencion = Convert.ToDateTime(sd.Value);
                        break;

                    case "nfDiasAtencion":
                        oOrdenEstimacionForma.DiasAtencion = Convert.ToDecimal(sd.Value);
                        break;
                    case "txtReporta":
                        oOrdenEstimacionForma.Reporto = sd.Value;
                        break;
                    case "txtTrabajoRequerido":
                        oOrdenEstimacionForma.TrabajoRequerido = sd.Value;
                        break;
                    case "txtAtiende":
                        oOrdenEstimacionForma.Atiende = sd.Value;
                        break;
                        //----------
                    case "txtTrabajoRealizado":
                        oOrdenEstimacionForma.TrabajoRealizado = sd.Value;
                        break;
                    case "txtCodigoFalla":
                        oOrdenEstimacionForma.CodigoFalla= sd.Value;
                        break;
                    case "cmbTieneFotos":
                        oOrdenEstimacionForma.TieneFotos = sd.Value;
                        break;
                    case "cmbTieneReporte":
                        oOrdenEstimacionForma.TieneReporte = sd.Value;
                        break;

                    case "dfFechallegada":
                        if (sd.Value == null)
                            oOrdenEstimacionForma.FechaLlegada = null;
                        else
                            oOrdenEstimacionForma.FechaLlegada = Convert.ToDateTime(sd.Value);
                        break;
                    case "tfHoraLlegada":
                         if (sd.Value == null)
                            oOrdenEstimacionForma.HoraLlegada = null;
                        else
                             oOrdenEstimacionForma.HoraLlegada = Convert.ToDateTime(sd.Value);
                        break;

                    case "dfFFechaFinActividad":
                        if (sd.Value == null)
                            oOrdenEstimacionForma.FechaFinActividad = null;
                        else
                            oOrdenEstimacionForma.FechaFinActividad = Convert.ToDateTime(sd.Value);
                        break;
                    case "tfHoraFinActividad":
                         if (sd.Value == null)
                            oOrdenEstimacionForma.HoraFinActividad = null;
                        else
                             oOrdenEstimacionForma.HoraFinActividad = Convert.ToDateTime(sd.Value);
                        break;

                    case "txtZona":
                        oOrdenEstimacionForma.Zona = sd.Value;
                        break;
                    case "txtCuadrilla":
                        oOrdenEstimacionForma.Cuadrilla = sd.Value;
                        break;
                   

                }
            }
            oOrdenEstimacionForma.Estatus = "BORRADOR";
            //3. Regresar la OrdenEstimacion
            return oOrdenEstimacionForma;
        }

        /// <summary>
        /// Evento que Guarda o actualiza un Movimiento
        /// </summary>
        /// <param name="oOrdenEstimacionForma"></param>
        /// <param name="oOrdenEstimacion"></param>
        /// <param name="lOrdenEstimacionD"></param>
        private string GuardarMovimiento(ref OrdenEstimacion oOrdenEstimacionForma, OrdenEstimacion oOrdenEstimacion, List<OrdenEstimacionD> lOrdenEstimacionD, string strSucursal, decimal diasAtencion)
        {
            //1. Lo que sucede cuando es nuevo y no se habia guardado
            if (oOrdenEstimacion == null)
            {
                //2. Traemeos el objeto de sesion para llenr el objeto con los datos de usuario
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oOrdenEstimacionForma.Usuario = oUsuario.ID;

                //3. Actualizamos el Estatus e Insertar en la base de datos
                oOrdenEstimacionForma.Estatus = "BORRADOR";
                oOrdenEstimacionForma.Sucursal = strSucursal;
                oOrdenEstimacionForma.DiasAtencion = diasAtencion;
                oOrdenEstimacionForma.Id = OrdenEstimacionBusiness.insertarOrdenEstimacion(oOrdenEstimacionForma);
               
                //4. Agregar el objeto al Store de Revisión
                sOrdenEstimacion.Add(new
                {
                    ID = oOrdenEstimacionForma.Id,
                    Mov = oOrdenEstimacionForma.Mov,
                    MovID = oOrdenEstimacionForma.MovID,
                    Sucursal = oOrdenEstimacionForma.Sucursal,
                    FechaEmision = oOrdenEstimacionForma.FechaEmision,
                    Observaciones = oOrdenEstimacionForma.Observaciones,
                    RSucursal = oOrdenEstimacionForma.RSucursal,
                    Estatus = oOrdenEstimacionForma.Estatus,
                    Usuario = oOrdenEstimacionForma.Usuario,
                    Origen=oOrdenEstimacionForma.Origen,
                    OrigenId = oOrdenEstimacionForma.OrigenId,
                    Reporte = oOrdenEstimacionForma.Reporte,

                    Division = oOrdenEstimacionForma.Division,
                    FechaOrigen = oOrdenEstimacionForma.FechaOrigen,
                    FechaMaximaAtencion = oOrdenEstimacionForma.FechaMaximaAtencion,
                    DiasAtencion = oOrdenEstimacionForma.DiasAtencion,
                    Reporto = oOrdenEstimacionForma.Reporto,
                    TrabajoRequerido = oOrdenEstimacionForma.TrabajoRequerido,
                    Atiende = oOrdenEstimacionForma.Atiende,

                    TrabajoRealizado = oOrdenEstimacionForma.TrabajoRealizado,
                    CodigoFalla = oOrdenEstimacionForma.CodigoFalla,
                    TieneFotos = oOrdenEstimacionForma.TieneFotos,
                    TieneReporte = oOrdenEstimacionForma.TieneReporte,
                    FechaLlegada = oOrdenEstimacionForma.FechaLlegada,
                    HoraLlegada = oOrdenEstimacionForma.HoraLlegada,
                    FechaFinActividad = oOrdenEstimacionForma.FechaFinActividad,
                    HoraFinActividad = oOrdenEstimacionForma.HoraFinActividad,
                    Zona = oOrdenEstimacionForma.Zona,
                    Cuadrilla = oOrdenEstimacionForma.Cuadrilla
                });

                //5. Guardar Detalle y regresar valor
                 GuardarDetalleOrdenEstimacion(lOrdenEstimacionD, oOrdenEstimacionForma);
                return "insertar";
            }
            else
            {
                //6. Complementar datos y actualizar encabezado
                oOrdenEstimacionForma.Id = oOrdenEstimacion.Id;
                oOrdenEstimacionForma.DiasAtencion = diasAtencion;
                


                OrdenEstimacionBusiness.ActualizarOrdenEstimacion(oOrdenEstimacionForma);

                //7. Actualizar store de OrdenesEstimaciones
                sOrdenEstimacion.GetAt(0).Set("Mov", oOrdenEstimacionForma.Mov);
                sOrdenEstimacion.GetAt(0).Set("Sucursal", strSucursal);
                sOrdenEstimacion.GetAt(0).Set("FechaEmision", oOrdenEstimacionForma.FechaEmision);
                sOrdenEstimacion.GetAt(0).Set("Estaus", oOrdenEstimacionForma.Estatus);
                sOrdenEstimacion.GetAt(0).Set("Observaciones", oOrdenEstimacionForma.Observaciones);

                //Campos extras de reporte
                sOrdenEstimacion.GetAt(0).Set("Reporte", oOrdenEstimacionForma.Reporte);
                sOrdenEstimacion.GetAt(0).Set("Division", oOrdenEstimacionForma.Division);
                sOrdenEstimacion.GetAt(0).Set("FechaOrigen", oOrdenEstimacionForma.FechaOrigen);
                sOrdenEstimacion.GetAt(0).Set("FechaMaximaAtencion", oOrdenEstimacionForma.FechaMaximaAtencion);
                sOrdenEstimacion.GetAt(0).Set("DiasAtencion", oOrdenEstimacionForma.DiasAtencion);
                sOrdenEstimacion.GetAt(0).Set("Reporto", oOrdenEstimacionForma.Reporto);
                sOrdenEstimacion.GetAt(0).Set("TrabajoRequerido", oOrdenEstimacionForma.TrabajoRequerido);
                sOrdenEstimacion.GetAt(0).Set("Atiende", oOrdenEstimacionForma.Atiende);

                //Campos extras 2
                sOrdenEstimacion.GetAt(0).Set("TrabajoRealizado", oOrdenEstimacionForma.TrabajoRealizado);
                sOrdenEstimacion.GetAt(0).Set("CodigoFalla", oOrdenEstimacionForma.CodigoFalla);
                sOrdenEstimacion.GetAt(0).Set("TieneFotos", oOrdenEstimacionForma.TieneFotos);
                sOrdenEstimacion.GetAt(0).Set("TieneReporte", oOrdenEstimacionForma.TieneReporte);
                sOrdenEstimacion.GetAt(0).Set("FechaLlegada", oOrdenEstimacionForma.FechaLlegada);
                sOrdenEstimacion.GetAt(0).Set("HoraLlegada", oOrdenEstimacionForma.HoraLlegada);
                sOrdenEstimacion.GetAt(0).Set("FechaFinActividad", oOrdenEstimacionForma.FechaFinActividad);
                sOrdenEstimacion.GetAt(0).Set("HoraFinActividad", oOrdenEstimacionForma.HoraFinActividad);
                sOrdenEstimacion.GetAt(0).Set("Zona", oOrdenEstimacionForma.Zona);
                sOrdenEstimacion.GetAt(0).Set("Cuadrilla", oOrdenEstimacionForma.Cuadrilla);

  

                //8. Borrar todo el detalle e insertarlo de nuevo
                OrdenEstimacionDBusiness.BorrarPorID(oOrdenEstimacionForma.Id);
                GuardarDetalleOrdenEstimacion(lOrdenEstimacionD, oOrdenEstimacionForma);

                //9. Regresar valor
                return "modificar";
            }
        }


        /// <summary>
        /// Evento que Guarda el detalle de OrdenEstimacionD
        /// </summary>
        /// <param name="lRevisionD"></param>
        /// <param name="oRevisionForma"></param>
        private void GuardarDetalleOrdenEstimacion(List<OrdenEstimacionD> lOrdenEstimacionD, OrdenEstimacion oOrdenEstimacionForma)
        {
            //1. Insertar los datos del detalle
            foreach (OrdenEstimacionD sd in lOrdenEstimacionD)
            {
                //2. Validar que el objeto no venga en blanco
                if (sd.ConceptoID.Equals(string.Empty) || sd.Cantidad.Equals(string.Empty) || sd.Precio == 0)
                    continue;
                else
                {
                    sd.Id = oOrdenEstimacionForma.Id;
                    OrdenEstimacionDBusiness.Insertar(sd);
                }
            }
        }


        /// <summary>
        /// Método para elimnar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnBorrar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere eliminar
            string strcookieEditarOrdenEstimacion = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;
            int strID = Convert.ToInt32(strcookieEditarOrdenEstimacion);
            //Borra de la base de datos el encabezado, detalle y fotos
            //borrarImagenesPorMovimiento(strID);
            borrarImagenesPorMovimiento(strID);
            OrdenEstimacionDBusiness.BorrarPorID(strID);
            OrdenEstimacionBusiness.Borrar(strID);
            
        }


        /// <summary>
        /// Método para obtener las fotos del renglon y borrarlas cuando se cambie el concepto o se elimine
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void obtenerImagenesPorConcepto()
        {
            //1. Obtener el ID del movimiento y el concepto
            int iID = Convert.ToInt32(Cookies.GetCookie("cookieIDBorrarFotosOrdenEstimacion").Value);
            string strConcepto = Cookies.GetCookie("cookieConceptoFotosOrdenEstimacion").Value;
            string strDireccionImagenes = Server.MapPath(" ") + "\\imagenesOrdenEstimacion\\" + iID + "\\" + strConcepto;
            string strDireccionCroquis = Server.MapPath(" ") + "\\croquisOrdenEstimacion\\" + iID + "\\" + strConcepto;
            string strDireccionFacturas = Server.MapPath(" ") + "\\facturasOrdenEstimacion\\" + iID + "\\" + strConcepto;
            //2. Validar si existe el directorio donde se borrarán las imagenes
            if (Directory.Exists(strDireccionImagenes))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionImagenes, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
            //3. Validar si existe el directorio donde se borrarán los croquis
            if (Directory.Exists(strDireccionCroquis))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionCroquis, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
            //4. Validar si existe el directorio donde se borrarán las Facturas
            if (Directory.Exists(strDireccionFacturas))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionFacturas, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }

            //5. Borrar en la base de datos
            ImagenOrdenEstimacionBusiness.BorrarImagenesOrdenEstimacionDPorConcepto(iID, strConcepto);
            FacturaOrdenEstimacionBusiness.BorrarFacturaOrdenEstimacionDPorConcepto(iID, strConcepto);
            CroquisOrdenEstimacionBusiness.BorrarCroquisOrdenEstimacionDPorConcepto(iID, strConcepto);
            GeneradorOrdenEstimacionDBusiness.BorrarGeneradorOrdenEstimacionDPorConcepto(iID,strConcepto);
        }

        /// <summary>
        /// Método para borrar las imagenes si se borra el movimiento completo
        /// </summary>
        /// <param name="strID"></param>
        [DirectMethod]
        public void borrarImagenesPorMovimiento(int strID)
        {
            //1. Obtener el ID del movimiento
            
            string strDireccionImagenes = Server.MapPath(" ") + "\\imagenesOrdenEstimacion\\" + strID;
            string strDireccionCroquis = Server.MapPath(" ") + "\\croquisOrdenEstimacion\\" + strID;
            string strDireccionFacturas = Server.MapPath(" ") + "\\facturasOrdenEstimacion\\" + strID;

              //2. Validar si existe el directorio donde se borrarán las imagenes
            if (Directory.Exists(strDireccionImagenes))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionImagenes, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
            //3. Validar si existe el directorio donde se borrarán los croquis
            if (Directory.Exists(strDireccionCroquis))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionCroquis, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }
            //4. Validar si existe el directorio donde se borrarán las Facturas
            if (Directory.Exists(strDireccionFacturas))
            {
                try
                {
                    System.IO.Directory.Delete(strDireccionFacturas, true);
                }

                catch (System.IO.IOException e)
                {
                    Console.WriteLine(e.Message);
                }
            }

            //5. Borrar en la base de datos
            ImagenOrdenEstimacionBusiness.BorrarImagenesOrdenesEstimacionPorID(strID);
            FacturaOrdenEstimacionBusiness.BorrarFacturasOrdenesEstimacionPorID(strID);
            CroquisOrdenEstimacionBusiness.BorrarCroquisOrdenesEstimacionPorID(strID);
            GeneradorOrdenEstimacionDBusiness.BorrarGeneradorOrdenesEstimacionPorID(strID);
        }




        /// <summary>
        /// Método para cancelar un registro
        /// </summary>
        /// <param name="strID"></param>
        protected void imgbtnCancelar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener registro que se quiere cancelar
            string strcookieEditarOrdenEstimacion = Cookies.GetCookie("cookieEditarOrdenEstimacion").Value;
            int strID = Convert.ToInt32(strcookieEditarOrdenEstimacion);
            //Cambia el estatus del movimiento
            OrdenEstimacionBusiness.CancelarOrdenEstimacionPorID(strID);
        }


  
    }
}