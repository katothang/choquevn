using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class BaseController : Controller
    {
        public ShopDB db = new ShopDB();
        protected override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            List<DanhMucSanPham> menu = db.DanhMucSanPhams.Take(7).ToList();      
            ViewData["Menu"] = menu;
            base.OnActionExecuting(filterContext);
        } 

    }
}
