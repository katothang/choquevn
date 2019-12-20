using CuaHangDoGo.Common;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class HopDongController : BaseController
    {
        public ShopDB db = new ShopDB();
        public ActionResult Index(string searchString)
        {
            var sessionKhachHang = (UserLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if (sessionKhachHang == null)
                return RedirectToAction("Login", "KhachHang");
            var model = db.HopDongs.Where(x => x.MaKhachHang == sessionKhachHang.UserID).OrderByDescending(x => x.Id).ToList();
            return View(model);
        }

        [HttpGet]
        public ActionResult XacNhanHopDong(long id)
        {
            var sessionKhachHang = (UserLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if (sessionKhachHang == null)
                return RedirectToAction("Login", "KhachHang");

            var model = db.HopDongs.SingleOrDefault(x => x.Id == id);
            return View(model);
        }

        [HttpPost]
        public ActionResult XacNhanHopDong(long id, long? nvt = null)
        {

            var sessionKhachHang = (UserLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if (sessionKhachHang == null)
                return RedirectToAction("Login", "KhachHang");

            HopDong contract = db.HopDongs.Find(id);
            contract.KhachHangXacNhan = true;
            try
            {
                ViewBag.ThanhCong = "Xác nhận hợp đồng thành công!";
                db.SaveChanges();
            }
            catch (Exception)
            {
                ViewBag.Loi = "Xác nhận hợp đồng thất bại";
                throw;
            }
            return View(contract);
        }

    }
}
