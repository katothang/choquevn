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
    public class HoaDonsController : AdminController
    {
        private ShopDB db = new ShopDB();

        // GET: Admin/HoaDons
        public ActionResult Index()
        {
            var hoaDons = db.HoaDons.Include(h => h.KhachHang).Include(h => h.NguoiDung).OrderByDescending(x=>x.MaHoaDon);
            return View(hoaDons.ToList());
        }

        // GET: Admin/HoaDons/Details/5
        public ActionResult Details(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);

            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        public ActionResult Export(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Create
        public ActionResult Create()
        {
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan");
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "Id", "TaiKhoan");
            return View();
        }

        // POST: Admin/HoaDons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "MaHoaDon,ThoiGianTao,TongTien,MaNguoiDung,MaKhachHang,DaThanhToan,NgayGiaoHang,NgayDatCoc,NgayThanhToan,HopDong,GiaiDoanGiaoHang")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                db.HoaDons.Add(hoaDon);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hoaDon.MaKhachHang);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hoaDon.MaNguoiDung);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Edit/5
        public ActionResult Edit(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hoaDon.MaKhachHang);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hoaDon.MaNguoiDung);
            return View(hoaDon);
        }
        
        public ActionResult DatCoc(string id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            hoaDon.NgayDatCoc = DateTime.Now;
            db.SaveChanges();

            return Redirect("/Admin/HoaDons");
        }
        
        public ActionResult ThanhToan(string id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            hoaDon.NgayThanhToan = DateTime.Now;
            db.SaveChanges();

            return Redirect("/Admin/HoaDons/Export/" + id);
        }

        public ActionResult ChangeStatus(string id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            return Redirect("/Admin/HoaDons/Export/" + id);
        }

        // POST: Admin/HoaDons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "MaHoaDon,ThoiGianTao,TongTien,MaNguoiDung,MaKhachHang,DaThanhToan,NgayGiaoHang,NgayDatCoc,NgayThanhToan,HopDong,GiaiDoanGiaoHang")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                db.Entry(hoaDon).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.MaKhachHang = new SelectList(db.KhachHangs, "Id", "TaiKhoan", hoaDon.MaKhachHang);
            ViewBag.MaNguoiDung = new SelectList(db.NguoiDungs, "Id", "TaiKhoan", hoaDon.MaNguoiDung);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Delete/5
        public ActionResult Delete(string id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            HoaDon hoaDon = db.HoaDons.Find(id);
            if (hoaDon == null)
            {
                return HttpNotFound();
            }
            return View(hoaDon);
        }

        // POST: Admin/HoaDons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(string id)
        {
            HoaDon hoaDon = db.HoaDons.Find(id);
            db.HoaDons.Remove(hoaDon);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ShipAll(string id)
        {
            
            HoaDon order = db.HoaDons.Find(id);
            HopDong contract = db.HopDongs.Find(order.HopDong);

            foreach (var item in contract.ChiTietHopDongs)
            {
                ChiTietHoaDon billDetail = new ChiTietHoaDon();
                billDetail.MaSanPham = item.MaSanPham;
                billDetail.TenSanPham = item.SanPham.TenSanPham;
                billDetail.SoLuong = item.SoLuong;
                billDetail.DonGia = item.SanPham.DonGia;
                billDetail.TongTien = item.SanPham.DonGia * item.SoLuong;

                int soLuongDaGiao = 0;
                foreach (var _orderDetail in order.ChiTietHoaDons.Where(x => x.MaSanPham == item.MaSanPham).ToList())
                {
                    if(_orderDetail.SoLuongDaGiao != null)
                    {
                        soLuongDaGiao += _orderDetail.SoLuongDaGiao.Value;
                    }
                }
                billDetail.SoLuongDaGiao = billDetail.SoLuong - soLuongDaGiao;
                billDetail.NgayGiaoHang = DateTime.Now;
                order.ChiTietHoaDons.Add(billDetail);
            }
            decimal total = 0;
            foreach (var item in order.ChiTietHoaDons)
            {
                if(item.TongTien != null)
                {
                    total += item.TongTien.Value;
                }
            }

            contract.TinhTrang = "Hoàn thành";

            order.NgayGiaoHang = DateTime.Now;
            order.GiaiDoanGiaoHang = "Hoàn thành";
            order.TongTien = total;
            db.SaveChanges();
            return Redirect("/Admin/HopDongs/ListShip/" + contract.Id);
        }
        public ActionResult AddQty(long maCTHD, int soLuong)
        {
            ChiTietHoaDon orderDetail = db.ChiTietHoaDons.Find(maCTHD);
            if(orderDetail.SoLuongDaGiao == null)
            {
                orderDetail.SoLuongDaGiao = 0;
            }
            orderDetail.SoLuongDaGiao += soLuong;
            orderDetail.NgayGiaoHang = DateTime.Now;

            double _totalPlus = soLuong * (double)orderDetail.DonGia.Value;

            HoaDon bill = db.HoaDons.Find(orderDetail.HoaDon.MaHoaDon);

            decimal total = 0;
            decimal totalMax = 0;
            foreach(var item in bill.ChiTietHoaDons)
            {
                totalMax += item.TongTien.Value;
                if(item.SoLuongDaGiao == null)
                {
                    item.SoLuongDaGiao = 0;
                }
                total += item.SoLuongDaGiao.Value * item.DonGia.Value;
            }
            if(total == 0)
            {
                bill.GiaiDoanGiaoHang = "Đã tiếp nhận";
            }
            else 
            {
                bill.GiaiDoanGiaoHang = "Đang giao hàng";
            }
            if(total == totalMax)
            {
                bill.GiaiDoanGiaoHang = "Hoàn thành";
                HopDong contract = db.HopDongs.Find(bill.HopDong);
                contract.TinhTrang = "Hoàn thành";
            }

            if(bill.TongTien == null)
            {
                bill.TongTien = 0;
            }
            bill.TongTien += (decimal)_totalPlus;


            db.SaveChanges();
            return Redirect("/Admin/HoaDons/Details/" + orderDetail.MaHoaDon);
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
