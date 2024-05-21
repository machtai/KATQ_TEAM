using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;
using System.Data.Entity;
namespace KATQ_TEAM.Areas.Admin.Controllers
{
    public class ThongkesController : Controller
    {
        private Qldienthoai db = new Qldienthoai();

        // GET: Admin/Thongkes
        public ActionResult Index()
        {
            var DonHangs = db.DonHangs.ToList();
            var dataThongke = (from s in db.DonHangs
                      join x in db.Nguoidungs on s.MaNguoidung equals x.MaNguoiDung
                      group s by s.MaNguoidung into g
                      select new Thongke
                      {
                          Tennguoidung = g.FirstOrDefault().Nguoidung.Hoten,
                          Tongtien = g.Sum(x => x.Tongtien),
                          Dienthoai = g.FirstOrDefault().Nguoidung.Dienthoai,
                          Soluong = g.Count()
                      });
            var dataFinal = dataThongke.OrderByDescending(s => s.Tongtien).Take(5).ToList();
            return View(dataFinal);
        }
    }
}