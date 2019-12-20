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
    public class HopDongsController : AdminController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/HopDongs
        public ActionResult Index()
        {
            var hopDongs = db.HopDongs.Include(h => h.KhachHang).Include(h => h.NguoiDung).Include(h => h.NguoiDung1).OrderByDescending(x => x.Id); ;
            return View(hopDongs.ToList());
        }

        // GET: Admin/HopDongs/Details/5
        public ActionResult Details(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopDong hopDong = db.HopDongs.Find(id);
            if (hopDong == null)
            {
                return HttpNotFound();
            }
            return View(hopDong);
        }

        // GET: Admin/HopDongs/Create
        public ActionResult Create()
        {
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan");
            ViewBag.MaNhanVien = new SelectList(db.NguoiDungs, "Id", "TaiKhoan");
            ViewBag.MaGiamDoc = new SelectList(db.NguoiDungs, "Id", "TaiKhoan");
            return View();
        }

        // POST: Admin/HopDongs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        public ActionResult Create(HopDong hopDong)
        {
            if (ModelState.IsValid)
            {
                db.HopDongs.Add(hopDong);
                decimal total = 0;
                foreach (var item in hopDong.ChiTietHopDongs)
                {
                    var product = db.SanPhams.Find(item.MaSanPham);
                    item.ThanhTien = product.DonGia * item.SoLuong;
                    total += item.ThanhTien.Value;
                }
                hopDong.ThanhTien = total;

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hopDong.MaKhachHang);
            ViewBag.MaNhanVien = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaNhanVien);
            ViewBag.MaGiamDoc = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaGiamDoc);
            return View(hopDong);
        }

        // GET: Admin/HopDongs/Edit/5
        public ActionResult Edit(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopDong hopDong = db.HopDongs.Find(id);
            if (hopDong == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hopDong.MaKhachHang);
            ViewBag.MaNhanVien = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaNhanVien);
            ViewBag.MaGiamDoc = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaGiamDoc);
            return View(hopDong);
        }

        // POST: Admin/HopDongs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,NgayTao,MaNhanVien,MaGiamDoc,MaKhachHang,ThanhTien,KhachHangXacNhan,TienDatCoc,NgayBatDau,NgayKetThuc,LoaiHopDong,ThoiGian,TinhTrang,NoiDung")] HopDong hopDong)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hopDong).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hopDong.MaKhachHang);
            ViewBag.MaNhanVien = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaNhanVien);
            ViewBag.MaGiamDoc = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hopDong.MaGiamDoc);
            return View(hopDong);
        }

        // GET: Admin/HopDongs/Delete/5
        public ActionResult Delete(long? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HopDong hopDong = db.HopDongs.Find(id);
            if (hopDong == null)
            {
                return HttpNotFound();
            }
            return View(hopDong);
        }

        // POST: Admin/HopDongs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(long id)
        {
            HopDong hopDong = db.HopDongs.Find(id);
            db.HopDongs.Remove(hopDong);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult TaoHoaDon(long id)
        {
            HopDong contract = db.HopDongs.Find(id);
            HoaDon bill = new HoaDon();
            bill.HopDong = id;

            bill.ThoiGianTao = DateTime.Now;
            bill.MaHoaDon = "HD" + DateTime.Now.Ticks;
            bill.MaKhachHang = contract.MaKhachHang;
            if (contract.TienDatCoc == 0)
            {
                bill.NgayDatCoc = DateTime.Now;
            }
            List<ChiTietHoaDon> billDetailList = new List<ChiTietHoaDon>();

            foreach (var item in contract.ChiTietHopDongs)
            {
                ChiTietHoaDon billDetail = new ChiTietHoaDon();
                billDetail.MaSanPham = item.MaSanPham;
                billDetail.TenSanPham = item.SanPham.TenSanPham;
                billDetail.SoLuong = item.SoLuong;
                billDetail.DonGia = item.SanPham.DonGia;
                billDetail.TongTien = item.SanPham.DonGia * item.SoLuong;
                billDetail.SoLuongDaGiao = 0;
                billDetail.NgayGiaoHang = DateTime.Now;
                billDetailList.Add(billDetail);
            }
            bill.ChiTietHoaDons = billDetailList;
            db.HoaDons.Add(bill);
            db.SaveChanges();
            return Redirect("/Admin/HoaDons/Details/" + bill.MaHoaDon);
        }

        public ActionResult ListShip(long id)
        {
            HopDong contract = db.HopDongs.Find(id);
            ViewBag.ListHoaDon = db.HoaDons.Where(x => x.HopDong == id).ToList();
            return View(contract);
        }
        public ActionResult PhieuGiaoHang(long id)
        {
            ChiTietHoaDon orderDetail = db.ChiTietHoaDons.Find(id);
            return View(orderDetail);
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
