using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;

namespace KATQ_TEAM.Controllers
{
    public class DanhmucController : Controller
    {
		Qldienthoai db = new Qldienthoai();
        // GET: Danhmuc
        public ActionResult DanhmucPartial()
        {
            var danhmuc = db.Hangsanxuats.ToList();
            return PartialView(danhmuc);
        }
    }
}