<%@ WebHandler Language="C#" Class="Upload" %>

using System;
using System.Web;
public class Upload : IHttpHandler
{



    
    public void ProcessRequest(HttpContext context)
    {
        HttpPostedFile uploads = context.Request.Files["upload"];
        string CKEditorFuncNum = context.Request["CKEditorFuncNum"];
        string file = System.IO.Path.GetFileName(uploads.FileName);
        string uzan = System.IO.Path.GetExtension(uploads.FileName).ToLower();
        if (uzan == ".jpg" | uzan == ".gif" | uzan == ".png" | uzan == "jpeg")
        {
          //  Random rnd = new Random();
           // string sayi = rnd.Next(1000000).ToString();
            string sonresimadi = Guid.NewGuid().ToString();
            uploads.SaveAs(context.Server.MapPath(".") + "\\/resimler\\" + sonresimadi + file);
            string url = "../Resimler/" + sonresimadi + file; 
            context.Response.Write("<script>window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ", \"" + url + "\");</script>");
            context.Response.End();
        }
        else
        {
            context.Response.Write("Desteklenmeyen dosya tipi...");
            context.Response.End();
        }
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}
