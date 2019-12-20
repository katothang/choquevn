using CuaHangDoGo.Areas.Admin.Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class StatisticController : AdminController
    {
        public ShopDB db = new ShopDB();
        // GET: Admin/Statistic
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult StatisticApi(DateTime fromDate, DateTime toDate)
        {
            StatisticModel model = new StatisticModel();
            model.billNumber = db.HoaDons.Count(x => x.ThoiGianTao.Value > fromDate && x.ThoiGianTao.Value < toDate);
            model.contractNumber = db.HopDongs.Count(x => x.NgayTao > fromDate && x.NgayTao < toDate);
            model.quantityNumber = 0;
            foreach (var item in db.ChiTietHoaDons.Where(x => x.HoaDon.ThoiGianTao.Value > fromDate && x.HoaDon.ThoiGianTao.Value < toDate))
            {
                model.quantityNumber += item.SoLuongDaGiao.Value;
            }

            model.total = 0;
            foreach (var item in db.HoaDons.Where(x => x.ThoiGianTao.Value > fromDate && x.ThoiGianTao.Value < toDate))
            {
                if(item.TongTien != null)
                {
                    model.total += item.TongTien.Value;
                }
            }
            return Json(model, JsonRequestBehavior.AllowGet);
        }
    }
}