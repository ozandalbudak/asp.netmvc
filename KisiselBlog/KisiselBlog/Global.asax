<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>
<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
     //   RegisterRoutes(RouteTable.Routes);
        // Code that runs on application startup

       // System.Web.Routing.RouteTable.Routes.MapPageRoute("Sayfalar", "{S_id}_{S_Baslik}.aspx", "~/Sayfa.aspx");
      System.Web.Routing.RouteTable.Routes.MapPageRoute("Sayfalar", "{B_id}/{B_Link}", "~/Sayfalar.aspx");
      System.Web.Routing.RouteTable.Routes.MapPageRoute("Kategoriler", "Kat/{K_id}/{K_Link}", "~/Kategoriler.aspx");
  //    System.Web.Routing.RouteTable.Routes.MapPageRoute("UyelerProfil", "Uye/{K_id}/{K_Adi}", "~/UyelerProfil.aspx");
     //System.Web.Routing.RouteTable.Routes.MapPageRoute("Sanatci", "{S_id}/{Sanatci}", "~/Sarkici.aspx");
      //  System.Web.Routing.RouteTable.Routes.MapPageRoute("UrunDetay", "Urun/{U_id}_{U_Adi}.aspx", "~/UrunDetay.aspx");

  
        
    }
  

    public void RegisterRoutes(RouteCollection Routes)
    {
    //   Routes.MapPageRoute("Sozler", "Soz/{Link}", "~/Sozler.aspx");
       // Routes.MapPageRoute("Sanatci", "{S_id}/{Sanatci}", "~/Sarkici.aspx");
      //  Routes.MapPageRoute("Sayfa", "Sayfa/{S_id}/{S_Baslik}", "~/Sayfa.aspx");
    }
    
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e) 
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
       
</script>
