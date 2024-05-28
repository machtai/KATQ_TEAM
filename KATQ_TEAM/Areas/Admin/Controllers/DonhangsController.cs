using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using KATQ_TEAM.Models;

namespace KATQ_TEAM.Areas.Admin.Controllers
{
    public class DonHangsController : Controller
    {
        private Qldienthoai db = new Qldienthoai();

        public ActionResult Index()
        {
            var DonHangs = db.DonHangs.Where(d => d.delete_at == null);
            return View(DonHangs.ToList());
        }



        // GET: Admin/DonHangs/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoidung = new SelectList(db.Nguoidungs, "MaNguoiDung", "Anhdaidien");
            return View();
        }


        // POST: Admin/DonHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult Delete(int id)
        {
            DonHang DonHang = db.DonHangs.Find(id);
            if (DonHang != null)
            {
                DonHang.delete_at = DateTime.Now;
                db.Entry(DonHang).State = EntityState.Modified;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
