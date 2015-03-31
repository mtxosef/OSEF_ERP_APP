using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;

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
                sSucursal.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursal.DataBind();
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
                    OrigenID = oOrdenEstimacion.OrigenId
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
            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strOrdenEstimacionForma);
            OrdenEstimacion oFormaOrdenEstimacion = ObtenerObjetoDesdeForma(dRegistro);
            OrdenEstimacion oOrdenEstimacion = JSON.Deserialize<List<OrdenEstimacion>>(strOrdenEstimacion).FirstOrDefault();
            List<OrdenEstimacionD> lOrdenEstimacionD = JSON.Deserialize<List<OrdenEstimacionD>>(strOrdenEstimacionD);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD,strSucursal);

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

            }
            //Si no es estimacion sale de la validacion y afecta normal
            else
            {

                //3. Guardar o Actuaizar el Movimiento
                string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD,strSucursal);

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

                if (strMovimiento.Equals("Orden de Cambio"))
                {
                    OrdenEstimacionBusiness.AfectarOrdenPorID(oFormaOrdenEstimacion);
                    e.ExtraParamsResponse.Add(new Ext.Net.Parameter("mov", "Orden", ParameterMode.Value));
                }

                if (strMovimiento.Equals("Mesa de reporte"))
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
                    case "cmbSucursal":
                        oOrdenEstimacionForma.Sucursal = sd.Value;
                        break;
                    case "dfFechaEmision":
                        oOrdenEstimacionForma.FechaEmision = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfObservaciones":
                        oOrdenEstimacionForma.Observaciones = sd.Value;
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
        private string GuardarMovimiento(ref OrdenEstimacion oOrdenEstimacionForma, OrdenEstimacion oOrdenEstimacion, List<OrdenEstimacionD> lOrdenEstimacionD, string strSucursal)
        {
            //1. Lo que sucede cuando es nuevo y no se habia guardado
            if (oOrdenEstimacion == null)
            {
                //2. Traemeos el objeto de sesion para llenr el objeto con los datos de usuario
                Usuario oUsuario = (Usuario)Session["Usuario"];
                oOrdenEstimacionForma.Usuario = oUsuario.ID;

                //3. Actualizamos el Estatus e Insertar en la base de datos
                oOrdenEstimacionForma.Estatus = "BORRADOR";
                oOrdenEstimacionForma.Id = OrdenEstimacionBusiness.insertarOrdenEstimacion(oOrdenEstimacionForma);
                oOrdenEstimacionForma.Sucursal = strSucursal;
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
                    OrigenId = oOrdenEstimacionForma.OrigenId
                });

                //5. Guardar Detalle y regresar valor
                 GuardarDetalleOrdenEstimacion(lOrdenEstimacionD, oOrdenEstimacionForma);
                return "insertar";
            }
            else
            {
                //6. Complementar datos y actualizar encabezado
                oOrdenEstimacionForma.Id = oOrdenEstimacion.Id;
                oOrdenEstimacionForma.Sucursal = strSucursal;
                oOrdenEstimacionForma.Estatus = oOrdenEstimacion.Estatus;
                OrdenEstimacionBusiness.ActualizarOrdenEstimacion(oOrdenEstimacionForma);

                //7. Actualizar store de OrdenesEstimaciones
                sOrdenEstimacion.GetAt(0).Set("Mov", oOrdenEstimacionForma.Mov);
                sOrdenEstimacion.GetAt(0).Set("Sucursal", strSucursal);
                sOrdenEstimacion.GetAt(0).Set("FechaEmision", oOrdenEstimacionForma.FechaEmision);
                sOrdenEstimacion.GetAt(0).Set("Estaus", oOrdenEstimacionForma.Estatus);
                sOrdenEstimacion.GetAt(0).Set("Observaciones", oOrdenEstimacionForma.Observaciones);

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

            OrdenEstimacionDBusiness.BorrarPorID(strID);
            OrdenEstimacionBusiness.Borrar(strID);
            
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