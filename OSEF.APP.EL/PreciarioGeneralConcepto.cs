﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OSEF.APP.EL
{
    /// <summary>
    /// Clase que controla la entidad de PreciarioGeneralConcepto
    /// </summary>
    public class PreciarioGeneralConcepto
    {
        #region Campos

        string id;
        string clave;
        string preciario;
        string descripcion;
        string categoria;
        string subcategoria;
        string subsubcategoria;
        string unidad;
        decimal costo;
        decimal cantidad;
        string usuario;
        string estatus;
        DateTime fechaalta;
        string tipo;
        string moneda;

        PreciarioGeneralCategoria rcategoria;
        PreciarioGeneralSubCategoria rsubcategoria;
        PreciarioGeneralSubSubCategoria rsubsubcategoria;

        #endregion

        #region Propiedades

        public string ID
        {
            get { return id; }
            set { id = value; }
        }

        public string Clave
        {
            get { return clave; }
            set { clave = value; }
        }

        public string Preciario
        {
            get { return preciario; }
            set { preciario = value; }
        }

        public string Descripcion
        {
            get { return descripcion; }
            set { descripcion = value; }
        }

        public string Categoria
        {
            get { return categoria; }
            set { categoria = value; }
        }

        public string SubCategoria
        {
            get { return subcategoria; }
            set { subcategoria = value; }
        }

        public string SubSubCategoria
        {
            get { return subsubcategoria; }
            set { subsubcategoria = value; }
        }

        public string Unidad
        {
            get { return unidad; }
            set { unidad = value; }
        }

        public decimal Costo
        {
            get { return costo; }
            set { costo = value; }
        }

        public decimal Cantidad
        {
            get { return cantidad; }
            set { cantidad = value; }
        }


        public string Tipo
        {
            get { return tipo; }
            set { tipo = value; }
        }

        public string Usuario
        {
            get { return usuario; }
            set { usuario = value; }
        }

        public string Estatus
        {
            get { return estatus; }
            set { estatus = value; }
        }

        public DateTime FechaAlta
        {
            get { return fechaalta; }
            set { fechaalta = value; }
        }

        public PreciarioGeneralCategoria RCategoria
        {
            get { return rcategoria; }
            set { rcategoria = value; }
        }

        public PreciarioGeneralSubCategoria RSubCategoria
        {
            get { return rsubcategoria; }
            set { rsubcategoria = value; }
        }

        public PreciarioGeneralSubSubCategoria RSubSubCategoria
        {
            get { return rsubsubcategoria; }
            set { rsubsubcategoria = value; }
        }


        public string Moneda
        {
            get { return moneda; }
            set { moneda = value; }
        }

        #endregion
    }
}
