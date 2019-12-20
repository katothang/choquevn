using CuaHangDoGo.Common;
using CuaHangDoGo.Models;
using Models.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BanHangDoGo.Controllers
{
    public class KhachHangController : BaseController
    {
        public ShopDB db = new ShopDB();
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public ActionResult Register(RegisterModel model)
        {
            if (ModelState.IsValid)
            {
                KhachHang customer = new KhachHang();
                customer.TaiKhoan = model.username;
                customer.MatKhau = Encryptor.MD5Hash(model.password);
                customer.TenKhachHang = model.fullname;
                customer.DiaChi = model.address;
                customer.DienThoai = model.phone;
                customer.Email = model.email;
                customer.NgaySinh = DateTime.Now;

                if (db.KhachHangs.Count(x => x.TaiKhoan == customer.TaiKhoan) > 0) {
                    ModelState.AddModelError("", "Tên đăng nhập đã tồn tại");
                } else if (db.KhachHangs.Count(x => x.Email == customer.Email) > 0)
                {
                    ModelState.AddModelError("", "Tên email đã tồn tại");
                }

                else
                {
                    //try
                    //{
                    
                        db.KhachHangs.Add(customer);
                        db.SaveChanges();
                        Session["Register"] = "Đăng ký";
                        return RedirectToAction("Login", "KhachHang");
                    //}
                    //catch (Exception)
                    //{
                    //    ModelState.AddModelError("", "Đăng ký không thành công");
                    //}
                }
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(LoginModel model)
        {
            if (ModelState.IsValid)
            {

                string hashPassword = Encryptor.MD5Hash(model.PassWord);
                var customer = db.KhachHangs.SingleOrDefault(x => x.TaiKhoan == model.UserName && x.MatKhau == hashPassword);
                if (customer != null)
                {
                    var userSession = new UserLogin();
                    userSession.UserID = customer.Id;
                    userSession.UserName = customer.TaiKhoan;
                    Session.Add(CommonConstants.CUSTOMER_SESSION, userSession);
                    return Redirect("/");
                }
                else
                {
                    ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không chính xác");
                }
            }

            return View(model);
        }

        public ActionResult Logout()
        {

            Session[CommonConstants.CUSTOMER_SESSION] = null;
            Session[CommonConstants.CART] = null;
            return Redirect("/");
        }

        public ActionResult Bill()
        {
            var customer = (UserLogin) Session[CommonConstants.CUSTOMER_SESSION];
            var model = db.HoaDons.Where(x=>x.MaKhachHang == customer.UserID).ToList();
            return View(model);
        }

        public ActionResult BillDetail(string id)
        {
            var model = db.HoaDons.Find(id);
            return View(model);
        }
    }
}
