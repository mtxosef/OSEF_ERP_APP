using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;

namespace OSEF.APP.BL
{
    /// <summary>
    /// Clase que se encarga de la manipulación de capa de negocio de ImagenesVolumetriasD
    /// </summary>
    public class ImagenVolumetriaDBusiness
    {
        #region Insertar

        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de ImagenesVolumetriasD
        /// </summary>
        /// <param name="iImagenVolumetriaD"></param>
        public static int Insertar(ImagenVolumetriaD iImagenVolumetriaD)
        {
            return ImagenVolumetriaDDataAccess.Insertar(iImagenVolumetriaD);
        }

        #endregion
    }
}
