using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using OSEF.APP.EL;
using OSEF.APP.DL;
namespace OSEF.APP.BL
{
    public class EspecialidadesBusiness
    {
        #region Consultar
        public static List<Especialidades> ObtenerEspecialidades()
        {
            return EspecialidadesDataAccess.ObtenerEspecialidades();
        }

        public static Especialidades ObtenerEspecialidadesPorID(string ID)
        {
            return EspecialidadesDataAccess.ObtenerEspecialidadesPorID(ID);
        }
        #endregion

        #region Insertar
        /// <summary>
        /// Método que inserta un nuevo registro a la tabla de Especialidades
        /// </summary>
        /// <param name="iEspecialidades"></param>
        public static string Insertar(Especialidades iEspecialidades)
        {
            return EspecialidadesDataAccess.Insertar(iEspecialidades);
        }
        #endregion 

        #region Modificar
        /// <summary>
        /// Método que actualiza alguna especialidad por su ID
        /// </summary>
        /// <param name="espe"></param>
        public static int Actualizar(Especialidades espe)
        {
            return EspecialidadesDataAccess.Actualizar(espe);
        }

        #endregion
    }
}
