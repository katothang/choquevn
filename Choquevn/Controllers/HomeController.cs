
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class HomeController : BaseController
    {
        //
        // GET: /Home/
        public ShopDB db = new ShopDB();
        public ActionResult Index()
        {
            var model = db.SanPhams.OrderByDescending(x=>x.Id).Take(6).ToList();
            return View(model);
        }
        //chỉnh sửa lại link giới thiệu dẫn đến /gioi-thieu
        //xong xóa mục này nhé
        public ActionResult Introduce()
        {
            return View();
        }

        //còn đây là trang liên hệ
        public ActionResult Contact()
        {
            return View();
        }

    }
}
