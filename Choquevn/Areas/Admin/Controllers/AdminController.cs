using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class AdminController : Controller
    {
        protected override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            NguoiDung loginAccount = (NguoiDung)Session["LoginAccount"];
            if (loginAccount == null)
            {
                filterContext.Result = new RedirectResult("~/Admin/Login/Index");
            }
            base.OnActionExecuted(filterContext);
        }
    }
}