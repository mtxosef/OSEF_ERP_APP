﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que manipulo la clase de OrdenEstimacionD
    /// </summary>
    public class OrdenEstimacionD
    {

        #region Campos

        int id;
        short renglon;
        string conceptoID;
        decimal cantidad;
        string unidad;
        decimal precio;
        decimal importe;
        PreciarioGeneralConcepto rpreciarioconceptos;
        OrdenEstimacion rmovimiento;

        string intext;

     
        #endregion

        #region Propiedades
        public int Id
        {
            get { return id; }
            set { id = value; }
        }


        public short Renglon
        {
            get { return renglon; }
            set { renglon = value; }
        }

        public string ConceptoID
        {
            get { return conceptoID; }
            set { conceptoID = value; }
        }


        public decimal Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }


        public string Unidad
        {
            get { return unidad; }
            set { unidad = value; }
        }


        public decimal Precio
        {
            get { return precio; }
            set { precio = value; }
        }

        public decimal Importe
        {
            get { return importe; }
            set { importe = value; }
        }

        public PreciarioGeneralConcepto RPreciarioConceptos
        {
            get { return rpreciarioconceptos; }
            set { rpreciarioconceptos = value; }
        }

        public OrdenEstimacion RMovimiento
        {
            get { return rmovimiento; }
            set { rmovimiento = value; }
        }

        public string IntExt
        {
            get { return intext; }
            set { intext = value; }
        }


        #endregion
    }
}
