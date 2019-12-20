using CuaHangDoGo.Areas.Admin.Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class DashboardController : AdminController
    {
        public ShopDB db = new ShopDB();
        // GET: Admin/Dashboard
        public ActionResult Index()
        {
            DashboardModel model = new DashboardModel();
            model.DanhMucSanPhamNo = db.DanhMucSanPhams.Count();
            model.HoaDonNo = db.HoaDons.Count();
            model.HopDongNo = db.HopDongs.Count();
            model.LoaiTaiKhoanNo = db.LoaiTaiKhoans.Count();
            model.KhachHangNo = db.KhachHangs.Count();
            model.NguoiDungNo = db.NguoiDungs.Count();
            model.NhaCungCapNo = db.NhaCungCaps.Count();
            model.SanPhamNo = db.SanPhams.Count();
            return View(model);
        }
    }
}