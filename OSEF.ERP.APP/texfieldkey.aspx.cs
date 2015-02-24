using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ext.Net;

namespace OSEF.ERP.APP
{
    public partial class texfieldkey : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void txtfEnviarCorreo_SpecialKey(object sender, DirectEventArgs e)
        {
            lblTest.Text = "Here My Event";
        
        }

    }
}