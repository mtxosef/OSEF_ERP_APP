using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class CodigoFalla
    {

        #region Campos

        string id;
        string especialidad;
        string familia;
        string especialidades;
        string codigomainsaver;
        string descripcion;
        string dias;
        string prioridad;
        string tiempoestimado;

        #endregion

        #region Propiedades 
        
        public string ID
        {
            get { return id; }
            set { id = value; }
        }
        public string Especialidad
        {
            get { return especialidad; }
            set { especialidad = value; }
        }
        public string Familia
        {
            get { return familia; }
            set { familia = value; }
        }
        public string Especialidades
        {
            get { return especialidades; }
            set { especialidades = value; }
        }
        public string CodigoMainSaver
        {
            get { return codigomainsaver; }
            set { codigomainsaver = value; }
        }
        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }
        public string Dias
        {
            get { return dias; }
            set { dias = value; }
        }
        public string Prioridad
        {
            get { return prioridad; }
            set { prioridad = value; }
        }
        public string TiempoEstimado
        {
            get { return tiempoestimado; }
            set { tiempoestimado = value; }
        }  

        #endregion
    }
}
