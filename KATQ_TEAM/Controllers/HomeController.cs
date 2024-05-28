using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;

namespace KATQ_TEAM.Controllers
{
    public class HomeController : Controller
    {
        Qldienthoai db = new Qldienthoai();
        public ActionResult Index()
        {
       
            return View();

        }

        public ActionResult SlidePartial()
        {
            return PartialView();

        }
        

    }
}