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
    public class DanhMucSanPhamsController : AdminController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/DanhMucSanPhams
        public ActionResult Index()
        {
            return View(db.DanhMucSanPhams.ToList());
        }

        // GET: Admin/DanhMucSanPhams/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSanPham danhMucSanPham = db.DanhMucSanPhams.Find(id);
            if (danhMucSanPham == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSanPham);
        }

        // GET: Admin/DanhMucSanPhams/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/DanhMucSanPhams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,TenDanhMuc")] DanhMucSanPham danhMucSanPham)
        {
            if (ModelState.IsValid)
            {
                db.DanhMucSanPhams.Add(danhMucSanPham);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(danhMucSanPham);
        }

        // GET: Admin/DanhMucSanPhams/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSanPham danhMucSanPham = db.DanhMucSanPhams.Find(id);
            if (danhMucSanPham == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSanPham);
        }

        // POST: Admin/DanhMucSanPhams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,TenDanhMuc")] DanhMucSanPham danhMucSanPham)
        {
            if (ModelState.IsValid)
            {
                db.Entry(danhMucSanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(danhMucSanPham);
        }

        // GET: Admin/DanhMucSanPhams/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DanhMucSanPham danhMucSanPham = db.DanhMucSanPhams.Find(id);
            if (danhMucSanPham == null)
            {
                return HttpNotFound();
            }
            return View(danhMucSanPham);
        }

        // POST: Admin/DanhMucSanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            DanhMucSanPham danhMucSanPham = db.DanhMucSanPhams.Find(id);
            db.DanhMucSanPhams.Remove(danhMucSanPham);
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
