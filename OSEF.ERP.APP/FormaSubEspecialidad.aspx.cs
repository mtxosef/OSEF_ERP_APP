using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.EL;
using OSEF.APP.BL;

namespace OSEF.ERP.APP
{
    public partial class FormaSubEspecialidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string cookieNuevaSubEspecialidad = Cookies.GetCookie("cookieNuevaSubEspecialidad").Value;
            if (!cookieNuevaSubEspecialidad.Equals("Nuevo"))
            {
                SubEspecialidades espe = SubEspecialidadesBusiness.ObtenerSubEspecialidadesPorID(cookieNuevaSubEspecialidad);
                txtID.SetValue(espe.ID);
                txtNombre.SetValue(espe.Nombre);
                FieldContainer1.Hidden = false;
            }
            else {
                FieldContainer1.Hidden = true;
            }
        }

        #region Guardar

        /// <summary>
        /// Evento de clic del botón Guardar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void imgbtnGuardar_Click(object sender, DirectEventArgs e)
        {
            //1. Obtener datos de la Forma y saber si es edición o nuevo
            string strRegistro = e.ExtraParams["registro"];

            //2. Por cada elemento del submit de la Forma detectar el campo y asignarlo al objeto correspondiente
            Dictionary<string, string> dRegistro = JSON.Deserialize<Dictionary<string, string>>(strRegistro);
            SubEspecialidades cf = new SubEspecialidades();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        cf.ID = sd.Value;
                        break;

                    case "txtNombre":
                        cf.Nombre = sd.Value;
                        break;

                }
            }
            string cookieNuevaSubEspecialidad = Cookies.GetCookie("cookieNuevaSubEspecialidad").Value;
            if (cookieNuevaSubEspecialidad.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                cf.ID = SubEspecialidadesBusiness.Insertar(cf);
                //4. Mandar mensaje con el código del codigo ppta
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
            else
            {
                SubEspecialidadesBusiness.Actualizar(cf);
                cf.ID = cookieNuevaSubEspecialidad;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
        }
        #endregion
    }
}