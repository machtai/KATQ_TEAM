﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;

namespace KATQ_TEAM.Controllers
{
    public class SanphamController : Controller
    {
        Qldienthoai db = new Qldienthoai();

        // GET: Sanpham
        public ActionResult dtiphonepartial()
        {
            var ip = db.Sanphams.Where(n=>n.Mahang==2).Take(4).ToList();
           return PartialView(ip);
        }
        public ActionResult dtsamsungpartial()
        {
            var ss = db.Sanphams.Where(n => n.Mahang == 1).Take(4).ToList();
            return PartialView(ss);
        }
        public ActionResult dtxiaomipartial()
        {
            var mi = db.Sanphams.Where(n => n.Mahang == 3).Take(4).ToList();
            return PartialView(mi);
        }
        //public ActionResult dttheohang()
        //{
        //    var mi = db.Sanphams.Where(n => n.Mahang == 5).Take(4).ToList();
        //    return PartialView(mi);
        //}
        public ActionResult xemchitiet(int Masp=0)
        {
            var chitiet = db.Sanphams.SingleOrDefault(n=>n.Masp==Masp);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }

    }

}