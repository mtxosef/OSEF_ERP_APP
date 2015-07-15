using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OSEF.APP.BL;
using Ext.Net;
using OSEF.APP.EL;
using Newtonsoft.Json;

namespace OSEF.ERP.APP
{
    public partial class fAhorro : System.Web.UI.Page
    {
        /// <summary>
        /// Evento que se lanza al cargar la página
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Revisa variables de Session
            UsuarioBusiness.checkValidSession(this);

            //2. Validar que no sea una petición Ajax
            if (!X.IsAjaxRequest)
            {
                //3. Cargar el ComboBox de Clientes, Artículos
                sCliente.DataSource = ClienteBusiness.ObtenerClientes();
                sCliente.DataBind();

                sArticulos.DataSource = ArticuloBusiness.ObtenerArticulos();
                sArticulos.DataBind();
            }
        }

        /// <summary>
        /// Evento clic para guardar el Movimiento
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strAhorroForma = e.ExtraParams["AhorroForma"];
            string strAhorro = e.ExtraParams["Ahorro"];
            string strAhorroD = e.ExtraParams["AhorroD"];
            string strcookieEditarAhorro = Cookies.GetCookie("cookieEditarAhorro").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strAhorroForma);
            Ahorro oAhorroForma = ObtenerObjetoDesdeForma(dRegistro);
            Ahorro oAhorro = JsonConvert.DeserializeObject<List<Ahorro>>(strAhorro).FirstOrDefault();
            List<AhorroD> lAhorroD = JsonConvert.DeserializeObject<List<AhorroD>>(strAhorroD);

            //3. Guardar o Actuaizar el Movimiento
            //string strAccion = GuardarMovimiento(ref oFormaOrdenEstimacion, oOrdenEstimacion, lOrdenEstimacionD);
        }

        /// <summary>
        /// Método que transforma los datos Control-Valor a objeto Ahorro
        /// </summary>
        /// <param name="dRegistro"></param>
        /// <returns></returns>
        private Ahorro ObtenerObjetoDesdeForma(Dictionary<string, string> dRegistro)
        {
            //1. Declarar objeto Ahorro donde se guardarán los valores
            Ahorro oAhorroForma = new Ahorro();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //3. Datos de la OrdenEstimacion
                    case "cmbMov":
                        oAhorroForma.Mov = sd.Value;
                        break;
                    case "cmbCliente":
                        oAhorroForma.Cliente = sd.Value;
                        break;
                }
            }
            //4. Regresar el objeto
            return oAhorroForma;
        }

        /// <summary>
        /// Evento que Guarda o actualiza un Movimiento
        /// </summary>
        /// <param name="oAhorroForma"></param>
        /// <param name="oAhorro"></param>
        /// <param name="lAhorroD"></param>
        /// <returns></returns>
        private string GuardarMovimiento(ref Ahorro oAhorroForma, Ahorro oAhorro, List<AhorroD> lAhorroD)
        {
            //1. Checar ticket de autenticación
            UsuarioBusiness.checkValidSession(this);

            //2. Traemeos el objeto de sesion para llenr el objeto con los datos de usuario
            Usuario oUsuario = (Usuario)Session["Usuario"];
            oAhorroForma.Usuario = oUsuario.ID;

            //3. Actualizamos el Estatus e Insertar en la base de datos
            oAhorroForma.Estatus = "BORRADOR";
            oAhorroForma.FechaEmision = DateTime.Now;

            //3. Lo que sucede cuando es nuevo y no se habia guardado
            //if (oAhorro == null)
            //{
            //    oAhorroForma.ID = AhorroBusiness.insertarOrdenEstimacion(oOrdenEstimacionForma);

            //    oOrdenEstimacionForma = OrdenEstimacionBusiness.ObtenerOrdenEstimacionPorID(oOrdenEstimacionForma.Id);

            //    //4. Agregar el objeto al Store de Revisión
            //    sOrdenEstimacion.Add(new
            //    {
            //        ID = oOrdenEstimacionForma.Id,
            //        Mov = oOrdenEstimacionForma.Mov,
            //        MovID = oOrdenEstimacionForma.MovID,
            //        Sucursal = oOrdenEstimacionForma.Sucursal,
            //        FechaEmision = oOrdenEstimacionForma.FechaEmision,
            //        Observaciones = oOrdenEstimacionForma.Observaciones,
            //        RSucursal = oOrdenEstimacionForma.RSucursal,
            //        Estatus = oOrdenEstimacionForma.Estatus,
            //        Usuario = oOrdenEstimacionForma.Usuario,
            //        Origen = oOrdenEstimacionForma.Origen,
            //        OrigenId = oOrdenEstimacionForma.OrigenId,
            //        Reporte = oOrdenEstimacionForma.Reporte,

            //        //5. Segunda parte
            //        Division = oOrdenEstimacionForma.Division,
            //        FechaOrigen = oOrdenEstimacionForma.FechaOrigen,
            //        FechaMaximaAtencion = oOrdenEstimacionForma.FechaMaximaAtencion,
            //        DiasAtencion = oOrdenEstimacionForma.DiasAtencion,
            //        Reporto = oOrdenEstimacionForma.Reporto,
            //        TrabajoRequerido = oOrdenEstimacionForma.TrabajoRequerido,

            //        //6. Tercera parte
            //        TrabajoRealizado = oOrdenEstimacionForma.TrabajoRealizado,
            //        CodigoFalla = oOrdenEstimacionForma.CodigoFalla,
            //        FechaLlegada = oOrdenEstimacionForma.FechaLlegada,
            //        HoraLlegada = oOrdenEstimacionForma.HoraLlegada,
            //        FechaFinActividad = oOrdenEstimacionForma.FechaFinActividad,
            //        HoraFinActividad = oOrdenEstimacionForma.HoraFinActividad,
            //        Cuadrilla = oOrdenEstimacionForma.Cuadrilla,
            //        ImporteFinal = oOrdenEstimacionForma.ImporteTotal,
            //        HoraOrigen = oOrdenEstimacionForma.HoraOrigen,
            //        RutaImagen = oOrdenEstimacionForma.RutaImagen,
            //        Atendido = oOrdenEstimacionForma.Atendido,
            //        NoOrden = oOrdenEstimacionForma.NoOrden,
            //        ReferenciaOrden = oOrdenEstimacionForma.ReferenciaOrden,
            //        Clasificacion = oOrdenEstimacionForma.Clasificacion == null ? oOrdenEstimacionForma.Clasificacion : ""
            //    });

            //    //7. Guardar Detalle y regresar valor
            //    GuardarDetalleOrdenEstimacion(lOrdenEstimacionD, oOrdenEstimacionForma);
            //    return "insertar";
            //}
            //else
            //{
            //    //8. Complementar datos y actualizar encabezado
            //    if (bandera.Equals("SI"))
            //    {
            //        string strDireccion = Server.MapPath(" ") + "\\imagenesReportes\\" + oOrdenEstimacionForma.Reporte;
            //        //2. Validar si existe el directorio donde se guardaran las imagenes
            //        if (Directory.Exists(strDireccion))
            //        {
            //            fufNormal.PostedFile.SaveAs(strDireccion + "\\" + fufNormal.FileName);
            //        }
            //        else
            //        {
            //            Directory.CreateDirectory(strDireccion);
            //            fufNormal.PostedFile.SaveAs(strDireccion + "\\" + fufNormal.FileName);
            //        }
            //        //Guardamos en la bd
            //        oOrdenEstimacionForma.RutaImagen = "imagenesReportes\\" + oOrdenEstimacionForma.Reporte + "\\" + fufNormal.FileName;

            //    }
            //    else
            //    {
            //        oOrdenEstimacionForma.RutaImagen = oOrdenEstimacion.RutaImagen;
            //    }

            //    oOrdenEstimacionForma.Id = oOrdenEstimacion.Id;
            //    OrdenEstimacionBusiness.ActualizarOrdenEstimacion(oOrdenEstimacionForma);

            //    //9. Actualizar store de OrdenesEstimaciones
            //    sOrdenEstimacion.GetAt(0).Set("Mov", oOrdenEstimacionForma.Mov);
            //    sOrdenEstimacion.GetAt(0).Set("Sucursal", oOrdenEstimacionForma.Sucursal);
            //    sOrdenEstimacion.GetAt(0).Set("FechaEmision", oOrdenEstimacionForma.FechaEmision);
            //    sOrdenEstimacion.GetAt(0).Set("Estaus", oOrdenEstimacionForma.Estatus);
            //    sOrdenEstimacion.GetAt(0).Set("Observaciones", oOrdenEstimacionForma.Observaciones);

            //    //10. Campos extras de reporte
            //    sOrdenEstimacion.GetAt(0).Set("Reporte", oOrdenEstimacionForma.Reporte);
            //    sOrdenEstimacion.GetAt(0).Set("Division", oOrdenEstimacionForma.Division);
            //    sOrdenEstimacion.GetAt(0).Set("FechaOrigen", oOrdenEstimacionForma.FechaOrigen);
            //    sOrdenEstimacion.GetAt(0).Set("FechaMaximaAtencion", oOrdenEstimacionForma.FechaMaximaAtencion);
            //    sOrdenEstimacion.GetAt(0).Set("DiasAtencion", oOrdenEstimacionForma.DiasAtencion);
            //    sOrdenEstimacion.GetAt(0).Set("Reporto", oOrdenEstimacionForma.Reporto);
            //    sOrdenEstimacion.GetAt(0).Set("TrabajoRequerido", oOrdenEstimacionForma.TrabajoRequerido);

            //    //11. Campos extras 2
            //    sOrdenEstimacion.GetAt(0).Set("TrabajoRealizado", oOrdenEstimacionForma.TrabajoRealizado);
            //    sOrdenEstimacion.GetAt(0).Set("CodigoFalla", oOrdenEstimacionForma.CodigoFalla);
            //    sOrdenEstimacion.GetAt(0).Set("FechaLlegada", oOrdenEstimacionForma.FechaLlegada);
            //    sOrdenEstimacion.GetAt(0).Set("HoraLlegada", oOrdenEstimacionForma.HoraLlegada);
            //    sOrdenEstimacion.GetAt(0).Set("FechaFinActividad", oOrdenEstimacionForma.FechaFinActividad);
            //    sOrdenEstimacion.GetAt(0).Set("HoraFinActividad", oOrdenEstimacionForma.HoraFinActividad);
            //    sOrdenEstimacion.GetAt(0).Set("Cuadrilla", oOrdenEstimacionForma.Cuadrilla);

            //    //12. Importe
            //    sOrdenEstimacion.GetAt(0).Set("ImporteFinal", oOrdenEstimacionForma.ImporteTotal);
            //    sOrdenEstimacion.GetAt(0).Set("HoraOrigen", oOrdenEstimacionForma.HoraOrigen);
            //    sOrdenEstimacion.GetAt(0).Set("RutaImagen", oOrdenEstimacionForma.RutaImagen);
            //    sOrdenEstimacion.GetAt(0).Set("NoOrden", oOrdenEstimacionForma.NoOrden);
            //    sOrdenEstimacion.GetAt(0).Set("ReferenciaOrden", oOrdenEstimacionForma.ReferenciaOrden);
            //    sOrdenEstimacion.GetAt(0).Set("Clasificacion", oOrdenEstimacionForma.Clasificacion);
            //    //13. Borrar todo el detalle e insertarlo de nuevo
            //    OrdenEstimacionDBusiness.BorrarPorID(oOrdenEstimacionForma.Id);
            //    GuardarDetalleOrdenEstimacion(lOrdenEstimacionD, oOrdenEstimacionForma);

                //14. Regresar valor
                return "modificar";
            //}
        }
    }
}