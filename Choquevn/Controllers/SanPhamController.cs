using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class SanPhamController : BaseController
    {
        //
        // GET: /SanPham/

        public ShopDB db = new ShopDB();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ChiTietSanPham(int id)
        {
            
            var model = db.SanPhams.Find(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Search(string keyword, int page = 1, int pageSize = 8)
        {
            ViewBag.Keyword = keyword;
            var model = db.SanPhams.Where(x => x.TenSanPham.Contains(keyword) || x.Id.ToString().Contains(keyword)).ToList();
            return View(model);
        }
    }
}
