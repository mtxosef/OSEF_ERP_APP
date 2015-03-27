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

                //Cargar el detalle del movimiento
                //Cargar el detalle del movimiento
                sConceptos.DataSource = OrdenEstimacionDBusiness.ObtenerOrdenEstimacionDPorOrdenEstimacion(oOrdenEstimacion.Id);
                sConceptos.DataBind();

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

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strOrdenEstimacionForma);
            OrdenEstimacion oFormaOrdenEstimacion = ObtenerObjetoDesdeForma(dRegistro);
            OrdenEstimacion oOrdenEstimacion = JSON.Deserialize<List<OrdenEstimacion>>(strOrdenEstimacion).FirstOrDefault();
            List<OrdenEstimacionD> lOrdenEstimacionD = JSON.Deserialize<List<OrdenEstimacionD>>(strOrdenEstimacionD);

            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD);

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
        private string GuardarMovimiento(ref OrdenEstimacion oOrdenEstimacionForma, OrdenEstimacion oOrdenEstimacion, List<OrdenEstimacionD> lOrdenEstimacionD)
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
                OrdenEstimacionBusiness.ActualizarOrdenEstimacion(oOrdenEstimacionForma);

                //7. Actualizar store de OrdenesEstimaciones
                sOrdenEstimacion.GetAt(0).Set("Mov", oOrdenEstimacionForma.Mov);
                sOrdenEstimacion.GetAt(0).Set("Sucursal", oOrdenEstimacionForma.Sucursal);
                sOrdenEstimacion.GetAt(0).Set("FechaEmision", oOrdenEstimacionForma.FechaEmision);
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

    }
}