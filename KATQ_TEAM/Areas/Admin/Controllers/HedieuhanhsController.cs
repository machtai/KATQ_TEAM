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
    public class HedieuhanhsController : Controller
    {
        private Qldienthoai db = new Qldienthoai();

        // GET: Admin/Hedieuhanhs
        public ActionResult Index()
        {
            return View(db.Hedieuhanhs.Where(d => d.delete_at == null).ToList());
        }

        // GET: Admin/Hedieuhanhs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hedieuhanh hedieuhanh = db.Hedieuhanhs.Find(id);
            if (hedieuhanh == null)
            {
                return HttpNotFound();
            }
            return View(hedieuhanh);
        }

        // GET: Admin/Hedieuhanhs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Hedieuhanhs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Mahdh,Tenhdh")] Hedieuhanh hedieuhanh)
        {
            if (ModelState.IsValid)
            {
                db.Hedieuhanhs.Add(hedieuhanh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(hedieuhanh);
        }

        // GET: Admin/Hedieuhanhs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Hedieuhanh hedieuhanh = db.Hedieuhanhs.Find(id);
            if (hedieuhanh == null)
            {
                return HttpNotFound();
            }
            return View(hedieuhanh);
        }

        // POST: Admin/Hedieuhanhs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Mahdh,Tenhdh")] Hedieuhanh hedieuhanh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hedieuhanh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(hedieuhanh);
        }


        // POST: Admin/Hedieuhanhs/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Hedieuhanh hedieuhanh = db.Hedieuhanhs.Find(id);
            if (hedieuhanh != null)
            {
                hedieuhanh.delete_at = DateTime.Now;
                db.Entry(hedieuhanh).State = EntityState.Modified;
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
