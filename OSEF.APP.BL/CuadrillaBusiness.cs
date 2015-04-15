﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.DL;
using OSEF.APP.EL;

namespace OSEF.APP.BL
{
    public class CuadrillaBusiness
    {
        #region Consultar
        /// <summary>
        /// Obtener registros de cuadrillas
        /// </summary> 
        /// <returns>List<Cuadrilla></returns>
        public static List<Cuadrilla> ObtenerCuadrillas()
        {
            return CuadrillaDataAccess.ObtenerCuadrillas();
        }

        /// <summary>
        /// Obtener registros de cuadrillas por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns>List<Cuadrilla></returns>
        public static List<Cuadrilla> ObtenerCuadrillasPorID(string strID)
        {
            return CuadrillaDataAccess.ObtenerCuadrillasPorID(strID);
        }


        /// <summary>
        /// Obtener registros de cuadrillas por su ID
        /// </summary>
        /// <param name="strID"></param>
        /// <returns>List<Cuadrilla></returns>
        public static bool ObtenerRegistrosDeCuadrillaPorID(string strID)
        {
            return CuadrillaDataAccess.ObtenerRegistrosDeCuadrillaPorID(strID);
        }
        #endregion


        #region Eliminar

        /// <summary>
        /// Método que borrar una Cuadrilla por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return CuadrillaDataAccess.Borrar(dID);
        }

        #endregion
    }
}
