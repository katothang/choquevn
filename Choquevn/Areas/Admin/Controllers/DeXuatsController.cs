using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Models.EF;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class DeXuatsController : AdminController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/DeXuats
        public ActionResult Index()
        {
            var deXuats = db.DeXuats.Include(d => d.NguoiDung).Include(d => d.NguoiDung1);
            return View(deXuats.ToList());
        }

        // GET: Admin/DeXuats/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeXuat deXuat = db.DeXuats.Find(id);
            if (deXuat == null)
            {
                return HttpNotFound();
            }
            return View(deXuat);
        }

        // GET: Admin/DeXuats/Create
        public ActionResult Create()
        {
            ViewBag.MaNguoiDeXuat = new SelectList(db.NguoiDungs, "Id", "TaiKhoan");
            ViewBag.MaNguoiXacNhan = new SelectList(db.NguoiDungs, "Id", "TaiKhoan");
            return View();
        }

        // POST: Admin/DeXuats/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,DeXuat1,MaNguoiDeXuat,MaNguoiXacNhan,KetQua")] DeXuat deXuat)
        {
            if (ModelState.IsValid)
            {
                db.DeXuats.Add(deXuat);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaNguoiDeXuat = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiDeXuat);
            ViewBag.MaNguoiXacNhan = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiXacNhan);
            return View(deXuat);
        }

        // GET: Admin/DeXuats/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeXuat deXuat = db.DeXuats.Find(id);
            if (deXuat == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaNguoiDeXuat = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiDeXuat);
            ViewBag.MaNguoiXacNhan = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiXacNhan);
            return View(deXuat);
        }

        // POST: Admin/DeXuats/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,DeXuat1,MaNguoiDeXuat,MaNguoiXacNhan,KetQua")] DeXuat deXuat)
        {
            if (ModelState.IsValid)
            {
                db.Entry(deXuat).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaNguoiDeXuat = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiDeXuat);
            ViewBag.MaNguoiXacNhan = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", deXuat.MaNguoiXacNhan);
            return View(deXuat);
        }

        // GET: Admin/DeXuats/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DeXuat deXuat = db.DeXuats.Find(id);
            if (deXuat == null)
            {
                return HttpNotFound();
            }
            return View(deXuat);
        }

        // POST: Admin/DeXuats/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            DeXuat deXuat = db.DeXuats.Find(id);
            db.DeXuats.Remove(deXuat);
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
