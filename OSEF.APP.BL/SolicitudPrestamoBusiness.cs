using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que administra la información de Solicitudes De Prestamos
    /// </summary>
    public class SolicitudPrestamoBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Solicitudes de Prestamo
        /// </summary>
        /// <param name="iSolicitudPrestamo"></param>
        public static string Insertar(SolicitudPrestamo iSolicitudPrestamo)
        {
            return SolicitudPrestamoDataAccess.Insertar(iSolicitudPrestamo);
        }

        #endregion
    }
}
