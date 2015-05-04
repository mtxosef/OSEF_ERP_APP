using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    public class Familias
    {
        #region Campos
        string id;
        string nombre;
        string especialidad;
        Especialidades respecialidad;
        #endregion

        #region Propiedades
        public string ID
        {
            get { return id; }
            set { id = value; }
        }
        public string Nombre
        {
            get { return nombre; }
            set { nombre = value; }
        }

        public string Especialidad
        {
            get { return especialidad; }
            set { especialidad = value; }
        }

        public Especialidades REspecialidad
        {
            get { return respecialidad; }
            set { respecialidad = value; }
        }
        #endregion
    }
}
