using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;
using OSEF.APP.BL;
using OSEF.APP.EL;

namespace OSEF.ERP.APP
{
    public partial class ConsultarPreciario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Store1.Data = this.Users;
        }

        /// <summary>
        /// Método que llena el Store de preciario con sus Categorias, SubCategorias y SubSubCategorias
        /// </summary>
        /// <param name="strPreciario"></param>
        [DirectMethod]
        public void CargarPreciario(string strPreciario)
        {
            //1. Llenar el store de Preciario
            Preciario oPreciario = PreciarioBusiness.ObtenerPreciarioPorID(strPreciario);
            oPreciario.RPreciarioCategorias = PreciarioCategoriaBuisness.ObtenerPreciarioCategoriasPorPreciario(strPreciario);

            sConsultarPreciario.Add(new { 
                ID = oPreciario.ID,
                Descripcion = oPreciario.Descripcion,
                Sucursal = oPreciario.Sucursal,
                Archivo = oPreciario.Archivo,
                Usuario = oPreciario.Usuario,
                Estatus = oPreciario.Estatus,
                FechaAlta = oPreciario.FechaAlta,
                RSucursal = oPreciario.RSucursal,
                RPreciarioCategorias = oPreciario.RPreciarioCategorias
            });
        }

        public List<User> Users
        {
            get
            {
                return new List<User>
                {
                    new User(1, "User1", new List<Product>{
                        new Product(1, "Product1 of User1"),
                        new Product(2, "Product2 of User1"),
                        new Product(3, "Product3 of User1"),
                    }),

                    new User(2, "User2", new List<Product>{
                        new Product(4, "Product1 of User2"),
                        new Product(5, "Product2 of User2"),
                        new Product(6, "Product3 of User2"),
                    }),

                    new User(3, "User3", new List<Product>{
                        new Product(7, "Product1 of User3"),
                        new Product(8, "Product2 of User3"),
                        new Product(9, "Product3 of User3"),
                    }),
                };
            }
        }

        public class Product
        {
            public Product(int id, string name)
            {
                this.Id = id;
                this.Name = name;
            }

            public int Id
            {
                get;
                private set;
            }

            public string Name
            {
                get;
                private set;
            }
        }

        public class User
        {
            public User(int id, string name, List<Product> products)
            {
                this.Id = id;
                this.Name = name;
                this.Products = products;
            }

            public int Id
            {
                get;
                private set;
            }

            public string Name
            {
                get;
                private set;
            }

            public List<Product> Products
            {
                get;
                private set;
            }
        }
    }
}