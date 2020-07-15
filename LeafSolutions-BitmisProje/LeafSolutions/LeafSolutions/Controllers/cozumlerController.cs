using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace LeafSolutions.Controllers
{
    public class cozumlerController : Controller
    {
        //
        // GET: /cozumler/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult bireysel()
        {
            return View();
        }

        public ActionResult kurumsal()
        {
            return View();
        }

    }
}
