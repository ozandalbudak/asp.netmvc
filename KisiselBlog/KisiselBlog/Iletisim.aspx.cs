﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Iletisim : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        ((UserControl)this.Master.FindControl("Kategoriler1")).Visible = false;
    }
    
}