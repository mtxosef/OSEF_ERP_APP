﻿using System;
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
    public partial class FormaCodigoPTTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcookieEditarCodigoPPTA = Cookies.GetCookie("cookieEditarCodigoPPTA").Value;
            onLoadData();
            if (!strcookieEditarCodigoPPTA.Equals("Nuevo"))
            {
                CodigoFalla cf = CodigoFallasBusiness.ObtenerCodigoFallaPorID(strcookieEditarCodigoPPTA);
                txtID.SetValue(cf.ID);
                cmbEspecialidad.SelectedItem.Text = cf.REspecialidad.Nombre;
                cmbFamilia.SelectedItem.Text = cf.RFamilias.Nombre;
                cmbSubEspecialidad.SelectedItem.Text = cf.RSubespecialidad.Nombre;
                txtCodigoMainSaver.SetValue(cf.CodigoMainSaver);
                txtDescripcion.SetValue(cf.Descripcion);
                txtDias.SetValue(cf.Dias);
                txtPrioridad.SetValue(cf.Prioridad);
                txtTiempoEstimado.SetValue(cf.TiempoEstimado);
            }
            else
            {
                FieldContainer2.Hidden = true;
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
            CodigoFalla cf = new CodigoFalla();
            foreach (KeyValuePair<string, string> sd in dRegistro)
            {
                switch (sd.Key)
                {
                    case "txtID":
                        cf.ID = sd.Value;
                        break;

                    case "cmbEspecialidad":
                        cf.Especialidad = sd.Value;
                        break;

                    case "cmbFamilia":
                        cf.Familia = sd.Value;
                        break;

                    case "cmbSubEspecialidad":
                        cf.Subespecialidad = sd.Value;
                        break;

                    case "txtCodigoMainSaver":
                        cf.CodigoMainSaver = sd.Value;
                        break;

                    case "txtDescripcion":
                        cf.Descripcion = sd.Value;
                        break;

                    case "txtDias":
                        cf.Dias = sd.Value;
                        break;

                    case "txtPrioridad":
                        cf.Prioridad = sd.Value;
                        break;

                    case "txtTiempoEstimado":
                        cf.TiempoEstimado = sd.Value;
                        break;
                }
            }
            string strcookieEditarCodigoPPTA = Cookies.GetCookie("cookieEditarCodigoPPTA").Value;
            if (strcookieEditarCodigoPPTA.Equals("Nuevo"))
            {
                //3. Insertar en la base de datos
                cf.ID = CodigoFallasBusiness.Insertar(cf);
                //4. Mandar mensaje con el código del codigo ppta
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
            else
            {
                CodigoFallasBusiness.Actualizar(cf);
                cf.ID = strcookieEditarCodigoPPTA;
                e.ExtraParamsResponse.Add(new Ext.Net.Parameter("data", cf.ID, ParameterMode.Value));
            }
        }

        #endregion

        #region Consultar
        public void onLoadData() {
            sEspecialidad.DataSource = EspecialidadesBusiness.ObtenerEspecialidades();
            sEspecialidad.DataBind();
            sFamilias.DataSource = FamiliasBusiness.ObtenerFamilias();
            sFamilias.DataBind();
            sSubEspecialidad.DataSource = SubEspecialidadesBusiness.ObtenerSubEspecialidades();
            sSubEspecialidad.DataBind();
        }
        #endregion
    }
}