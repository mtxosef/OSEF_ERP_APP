using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;


namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de Volumetrias
    /// </summary>
    public class VolumetriaBusiness
    {
        #region insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Volumetrias
        /// </summary>
        /// <param name="iRevision"></param>
        public static int insertarVolumetria(Volumetria iVolumetria ) 
        {
           return VolumetriaDataAccess.Insertar(iVolumetria);
        }

        #endregion

        #region modificar
        /// <summary>
        /// Método que actualiza un registro en la tabla de Volumetrias
        /// </summary>
        /// <param name="iRevision"></param>
        public static int actualizarVolumetria(Volumetria uVolumetria) {
            return VolumetriaDataAccess.Actualizar(uVolumetria);
        }

        #endregion

        #region Eliminar

        /// <summary>
        /// Método que borrar alguna Volumetria por su ID
        /// </summary>
        /// <param name="iID"></param>
        public static int Borrar(int iID)
        {
            return VolumetriaDataAccess.Borrar(iID);
        }

        #endregion


        #region consultar

        /// <summary>
        /// Método que obtiene todos los regsitros de Volumetrias
        /// </summary>
        /// <returns></returns>
        public static List<Volumetria> ObtenerRevisiones()
        {
            //1. Obtener las revisiones en una lista
            List<Volumetria> lVolumetrias = VolumetriaDataAccess.ObtenerVolumetrias();

            //2. Complementarlas con sucursal
            foreach (Volumetria sd in lVolumetrias)
                sd.RSucursal = SucursalBusiness.ObtenerSucursalPorID(sd.Sucursal);
            return lVolumetrias;
        }

        /// <summary>
        /// Obtener un registro de Volumetrias por su ID
        /// </summary>
        /// <param name="iID"></param>
        /// <returns></returns>
        public static Volumetria ObtenerVolumetriaPorID(int iID)
        {
            //1. Inicializar objeto, complementarlo con la Sucursal
            Volumetria oVolumetria = VolumetriaDataAccess.ObtenerVolumetriaPorID(iID);
            oVolumetria.RSucursal = SucursalBusiness.ObtenerSucursalPorID(oVolumetria.Sucursal);

            return oVolumetria;
        }


        #endregion



    }
}
