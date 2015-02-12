using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.AVANCES.SUCURSALES.Obra
{
    public partial class FormaVolumetriaPreciario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //1. Primer solicitud
            if (!X.IsAjaxRequest)
            {
                //2. Cargar sucursales
                sSucursales.DataSource = SucursalBusiness.ObtenerSucursales();
                sSucursales.DataBind();

                //2. Cargar sucursales
                sPreciario.DataSource = PreciarioBusiness.ObtenerPreciarios();
                sPreciario.DataBind();

            }
        }
        
        /// <summary>
        /// Evento que se lanza al cargar el store
        /// </summary>
        [DirectMethod]
        public void sVolumetria_Load()
        {
            //Obtener la cookie al cargar
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //Validar si es diferente de Nuevo
            if (!strcookieEditarVolumetria.Equals("Nuevo"))
            {
                //Cargar el encabezado del movimiento
                Volumetria oVolumetria = VolumetriaBusiness.ObtenerVolumetriaPorID(Convert.ToInt32(strcookieEditarVolumetria));

                sVolumetria.Add(new
                {
                    ID = oVolumetria.ID,
                    Mov = oVolumetria.Mov,
                    MovID = oVolumetria.MovID,
                    Sucursal = oVolumetria.Sucursal,
                    FechaEmision = oVolumetria.FechaEmision,
                    Observaciones = oVolumetria.Observaciones,
                    Estatus = oVolumetria.Estatus,
                    Preciario = oVolumetria.Preciario,
                    RPreciario= oVolumetria.RPreciario,
                    RSucursal = oVolumetria.RSucursal
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
            string strVolumetriaForma = e.ExtraParams["VolumetriaForma"];
            string strVolumetria = e.ExtraParams["Volumetria"];
            string strcookieEditarVolumetria = Cookies.GetCookie("cookieEditarVolumetria").Value;

            //2. Serializar el encabezado y el detalle
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strVolumetriaForma);
            Volumetria oFormaVolumetria = ObtenerObjetoDesdeForma(dRegistro);
            Volumetria oVolumetria = JSON.Deserialize<List<Volumetria>>(strVolumetria).FirstOrDefault();



            //3. Guardar o Actuaizar el Movimiento
            string strAccion = GuardarMovimiento(ref oFormaVolumetria, oVolumetria);

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
        private Volumetria ObtenerObjetoDesdeForma(Dictionary<string, string> dRegistro)
        {
            //1. Declarar objeto Volumetria donde se guardarán los valores
            Volumetria oVolumetriaForma = new Volumetria();

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    //4. Datos de la revisión
                    case "cmbMov":
                        oVolumetriaForma.Mov = sd.Value;
                        break;
                    case "cmbSucursal":
                        oVolumetriaForma.Sucursal = sd.Value;
                        break;
                    case "cmbPreciario":
                        oVolumetriaForma.Preciario = sd.Value;
                        break;
                    case "dfFechaEmision":
                        oVolumetriaForma.FechaEmision = Convert.ToDateTime(sd.Value);
                        break;
                    case "txtfObservaciones":
                        oVolumetriaForma.Observaciones = sd.Value;
                        break;
                }
            }
            oVolumetriaForma.Estatus = "BORRADOR";

            //3. Regresar la Revision
            return oVolumetriaForma;
        }


        /// <summary>
        /// Evento que Guarda o actualiza un Movimiento
        /// </summary>
        /// <param name="oVolumetriaForma"></param>
        /// <param name="oVolumetria"></param>
        /// <param name="lVolumetriaD"></param>
        private string GuardarMovimiento(ref Volumetria oVolumetriaForma, Volumetria oVolumetria)
        {
            //2. Lo que sucede cuando es nuevo y no se habia guardado
            if (oVolumetria == null)
            {
                oVolumetriaForma.Estatus = "BORRADOR";
                //3. Insertar en la base de datos
                oVolumetriaForma.ID = VolumetriaBusiness.insertarVolumetria(oVolumetriaForma);

                //4. Agregar el objeto al Store de Revisión
                sVolumetria.Add(new
                {
                    ID = oVolumetriaForma.ID,
                    Mov = oVolumetriaForma.Mov,
                    MovID = oVolumetriaForma.MovID,
                    Sucursal = oVolumetriaForma.Sucursal,
                    FechaEmision = oVolumetriaForma.FechaEmision,
                    Observaciones = oVolumetriaForma.Observaciones,
                    Preciario = oVolumetriaForma.Preciario,
                    RPreciario = oVolumetriaForma.RPreciario,
                    RSucursal = oVolumetriaForma.RSucursal,
                    Estatus = oVolumetriaForma.Estatus
                });

               
                return "insertar";
            }
            else
            {
                //6. Complementar datos y actualizar encabezado
                oVolumetriaForma.ID = oVolumetria.ID;
                VolumetriaBusiness.actualizarVolumetria(oVolumetriaForma);

                //7. Actualizar store de Revision
                sVolumetria.GetAt(0).Set("Mov", oVolumetriaForma.Mov);
                sVolumetria.GetAt(0).Set("Sucursal", oVolumetriaForma.Sucursal);
                sVolumetria.GetAt(0).Set("Preciario", oVolumetriaForma.Preciario);
                sVolumetria.GetAt(0).Set("FechaEmision", oVolumetriaForma.FechaEmision);
                sVolumetria.GetAt(0).Set("Observaciones", oVolumetriaForma.Observaciones);

               

                //9. Regresar valor
                return "modificar";
            }
        }


    }
}