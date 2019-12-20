
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
    public class SanPhamsController : AdminController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/SanPhams
        public ActionResult Index()
        {
            var sanPhams = db.SanPhams.Include(s => s.DanhMucSanPham).Include(s => s.NhaCungCap);
            return View(sanPhams.ToList());
        }

        // GET: Admin/SanPhams/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public ActionResult Create()
        {
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucSanPhams, "Id", "TenDanhMuc");
            ViewBag.MaCC = new SelectList(db.NhaCungCaps, "Id", "TenNhaCungCap");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create([Bind(Include = "Id,MetaTitle,TenSanPham,MoTa,DonGia,DonVi,MaCC,MaDanhMuc,HinhAnh")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                sanPham.MoTa = HttpUtility.HtmlDecode(sanPham.MoTa.Replace(System.Environment.NewLine, ""));
                SanPham product = db.SanPhams.Add(sanPham);
                db.SaveChanges();
                if (Request.Files.Count > 0 && Request.Files[0].FileName.Trim() != "")
                {
                    string[] _arr = Request.Files[0].FileName.Split('.');
                    string type = _arr[_arr.Length - 1];
                    product.HinhAnh = product.Id + "." + type;
                    Request.Files[0].SaveAs(Server.MapPath("~/Public/Upload/Product/") + product.HinhAnh);
                }

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaDanhMuc = new SelectList(db.DanhMucSanPhams, "Id", "TenDanhMuc", sanPham.MaDanhMuc);
            ViewBag.MaCC = new SelectList(db.NhaCungCaps, "Id", "TenNhaCungCap", sanPham.MaCC);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucSanPhams, "Id", "TenDanhMuc", sanPham.MaDanhMuc);
            ViewBag.MaCC = new SelectList(db.NhaCungCaps, "Id", "TenNhaCungCap", sanPham.MaCC);
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Edit([Bind(Include = "Id,MetaTitle,TenSanPham,MoTa,DonGia,DonVi,MaCC,MaDanhMuc,HinhAnh")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                sanPham.MoTa = HttpUtility.HtmlDecode(sanPham.MoTa.Replace(System.Environment.NewLine, ""));
                if (Request.Files.Count > 0 && Request.Files[0].FileName.Trim() != "")
                {
                    string[] _arr = Request.Files[0].FileName.Split('.');
                    string type = _arr[_arr.Length - 1];

                    sanPham.HinhAnh = sanPham.Id + "." + type;
                    Request.Files[0].SaveAs(Server.MapPath("~/Public/Upload/Product/") + sanPham.HinhAnh);
                }

                db.Entry(sanPham).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaDanhMuc = new SelectList(db.DanhMucSanPhams, "Id", "TenDanhMuc", sanPham.MaDanhMuc);
            ViewBag.MaCC = new SelectList(db.NhaCungCaps, "Id", "TenNhaCungCap", sanPham.MaCC);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SanPham sanPham = db.SanPhams.Find(id);
            if (sanPham == null)
            {
                return HttpNotFound();
            }
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            SanPham sanPham = db.SanPhams.Find(id);
            db.SanPhams.Remove(sanPham);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ProductAPI()
        {
            var products = db.SanPhams.Select(x=> new { x.TenSanPham, x.Id}).ToList();

            List<string> result = new List<string>();
            foreach (var item in products)
            {
                result.Add(item.TenSanPham + "-" + item.Id);
            }
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult ProductDetailAPI(long? id)
        {
            SanPham product = db.SanPhams.Find(id);
            return Json(new {
                TenDanhMuc = product.DanhMucSanPham.TenDanhMuc,
                TenNhaCungCap = product.NhaCungCap.TenNhaCungCap,
                TenSanPham = product.TenSanPham,
                MoTa = product.MoTa,
                DonGia = product.DonGia,
                DonVi = product.DonVi,
                HinhAnh = product.HinhAnh
            }, JsonRequestBehavior.AllowGet);
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
