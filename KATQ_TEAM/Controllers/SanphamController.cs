    using System;
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
            var ip = db.Sanphams.Where(n => n.Mahang == 2).ToList();
            return PartialView(ip);
        }
        public ActionResult dtsamsungpartial()
        {
            var ss = db.Sanphams.Where(n => n.Mahang == 1).ToList();
            return PartialView(ss);
        }
        public ActionResult dtKhacpartial()
        {
            var khac = db.Sanphams.Where(n => n.Mahang == 3).ToList();
            return PartialView(khac);
        }
        public ActionResult dtAllpartial()
        {
            var result = db.Sanphams.ToList();
            return PartialView("dtAllpartial", result);
        }

        public ActionResult xemchitiet(int Masp = 0)
        {
            var chitiet = db.Sanphams.SingleOrDefault(n => n.Masp == Masp);
            if (chitiet == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(chitiet);
        }

        // In your SanphamController.cs
        public ActionResult FilterProductsByBrand(int brandId)
        {
            var filteredProducts = db.Sanphams.Where(n => n.Mahang == brandId).ToList();
            return PartialView("_ProductPartial", filteredProducts);
        }

        public ActionResult Search(string keyword)
        {
            var results = db.Sanphams
                .Where(sp => sp.Tensp.Contains(keyword))
                .ToList();

            ViewBag.Keyword = keyword; // Lưu từ khóa tìm kiếm vào ViewBag
            return View("Search", results); // Trả về View "Search"
        }


    }

}