using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class LoginAdminController : AdminController
    {
        // GET: Admin/LoginAdmin
        public ActionResult Index()
        {
            return View();
        }
    }
}