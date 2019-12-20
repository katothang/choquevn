using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangDoGo.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        public ShopDB db = new ShopDB();
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password)
        {
            var temp = db.NguoiDungs.Where(x => x.TaiKhoan == username && x.MatKhau == password);
            if (temp.Count() == 1)
            {
                NguoiDung loginAccount = temp.SingleOrDefault();
                loginAccount.MatKhau = "";
                Session.Add("LoginAccount", loginAccount);
                return RedirectToAction("Index", "Dashboard", new { area = "Admin" });
            }
            else
            {
                TempData["Message"] = "Tài khoản hoặc mật khẩu không chính xác";
                return RedirectToAction("Index");
            }
        }
        public ActionResult Logout()
        {
            Session.Remove("LoginAccount");
            return Redirect("/");
        }
    }
}