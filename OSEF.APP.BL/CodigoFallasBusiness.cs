using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL; 
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    public class CodigoFallasBusiness
    {
        #region Consultar 
        
        /// <summary>
        /// Obtener registros de CodigoFalla
        /// </summary> 
        /// <returns>List<CodigoFalla></returns>
        public static List<CodigoFalla> ObtenerCodigoFallas()
        {
            return CodigoFallasDataAccess.ObtenerCodigoFallas();
        }

        /// <summary>
        /// Obtener registros de cuadrillas por su ID
        /// </summary>
        /// <param name="strID"></param> 
        public static bool ObtenerRegistrosDeCodigoFallasPorID(string strID)
        {
            return CodigoFallasDataAccess.ObtenerRegistrosDeCodigoFallasPorID(strID);
        }

        #endregion

        #region Insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de CodigoFallas
        /// </summary>
        /// <param name="iCodigoFallas"></param>
        public static string Insertar(CodigoFalla iCodigoFallas)
        {
            return CodigoFallasDataAccess.Insertar(iCodigoFallas);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar algun Codigo De Falla por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Borrar(string dID)
        {
            return CodigoFallasDataAccess.Borrar(dID);
        }

        #endregion

        #region Modificar
        /// <summary>
        /// Método que actualiza algun Codigo De Falla por su ID
        /// </summary>
        /// <param name="dID"></param>
        public static int Actualizar(CodigoFalla cp)
        {
            return CodigoFallasDataAccess.Actualizar(cp);
        }

        #endregion
    }
}
