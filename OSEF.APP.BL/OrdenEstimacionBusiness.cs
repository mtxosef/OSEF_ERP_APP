using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Calse que se encarga de la capa de negocio de OrdenEstimacionBusiness
    /// </summary>
    public class OrdenEstimacionBusiness
    {


        #region insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iRevision"></param>
        public static int insertarOrdenEstimacion(OrdenEstimacion iOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.Insertar(iOrdenEstimacion);
        }

        #endregion

        #region Actualizar
        /// <summary>
        /// Método que actualiza un registro a la tabla de OrdenEstimacion
        /// </summary>
        /// <param name="iRevision"></param>
        public static int ActualizarOrdenEstimacion(OrdenEstimacion uOrdenEstimacion)
        {
            return OrdenEstimacionDataAccess.Actualizar(uOrdenEstimacion);
        }

        #endregion



        #region Eliminar

        /// <summary>
        /// Método que borrar alguna OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return OrdenEstimacionDataAccess.Borrar(iID);
        }

        #endregion

        #region Consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de OrdenEstimacion
        /// </summary>
        /// <returns></returns>
        public static List<OrdenEstimacion> ObtenerOrdenesEstimaciones()
        {
            //1. Obtener las OrdenesEstimaciones en una lista
            List<OrdenEstimacion> lOrdenesEstimaciones = OrdenEstimacionDataAccess.ObtenerOrdenesEstimaciones();

            //2. Complementarlas con sucursal
            foreach (OrdenEstimacion sd in lOrdenesEstimaciones)
            {
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);

            }
            return lOrdenesEstimaciones;
        }

        /// <summary>
        /// Obtener un registro de OrdenEstimacion por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static OrdenEstimacion ObtenerOrdenEstimacionPorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal
            OrdenEstimacion oOrdenEstimacion = OrdenEstimacionDataAccess.ObtenerOrdenEstimacionaPorID(iID);
            oOrdenEstimacion.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oOrdenEstimacion.Sucursal);

            return oOrdenEstimacion;
        }


        #endregion
    }
}
