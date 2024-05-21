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

        // GET: Admin/DonHangs
        public ActionResult Index()
        {
            var DonHangs = db.DonHangs.Include(d => d.Nguoidung);
            return View(DonHangs.ToList());
        }

        // GET: Admin/DonHangs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang DonHang = db.DonHangs.Find(id);
            if (DonHang == null)
            {
                return HttpNotFound();
            }
            return View(DonHang);
        }

        // GET: Admin/DonHangs/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoidung = new SelectList(db.Nguoidungs, "MaNguoiDung", "Anhdaidien");
            return View();
        }

        public ActionResult Xacnhan(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang DonHang = db.DonHangs.Find(id);
            DonHang.Tinhtrang = 1;
            db.SaveChanges();
            if (DonHang == null)
            {
                return HttpNotFound();
            }
            return RedirectToAction("Index");
        }

        // POST: Admin/DonHangs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Madon,Ngaydat,Tinhtrang,Thanhtoan,MaNguoidung,Diachinhanhang")] DonHang DonHang)
        {
            if (ModelState.IsValid)
            {
                db.DonHangs.Add(DonHang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNguoidung = new SelectList(db.Nguoidungs, "MaNguoiDung", "Anhdaidien", DonHang.MaNguoidung);
            return View(DonHang);
        }

        // GET: Admin/DonHangs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang DonHang = db.DonHangs.Find(id);
            if (DonHang == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNguoidung = new SelectList(db.Nguoidungs, "MaNguoiDung", "Anhdaidien", DonHang.MaNguoidung);
            return View(DonHang);
        }

        // POST: Admin/DonHangs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Madon,Ngaydat,Tinhtrang,Thanhtoan,MaNguoidung,Diachinhanhang")] DonHang DonHang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(DonHang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNguoidung = new SelectList(db.Nguoidungs, "MaNguoiDung", "Anhdaidien", DonHang.MaNguoidung);
            return View(DonHang);
        }

        // GET: Admin/DonHangs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DonHang DonHang = db.DonHangs.Find(id);
            if (DonHang == null)
            {
                return HttpNotFound();
            }
            return View(DonHang);
        }

        // POST: Admin/DonHangs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DonHang DonHang = db.DonHangs.Find(id);
            db.DonHangs.Remove(DonHang);
            db.SaveChanges();
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
