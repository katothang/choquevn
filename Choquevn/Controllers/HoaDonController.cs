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
    public class HoaDonController : BaseController
    {
        //
        // GET: /HoaDon/
        public ShopDB db = new ShopDB();
        public ActionResult Index()
        {
            var session = (List<CartModel>)Session[CommonConstants.CART];
            if(session == null)
            {
                session = new List<CartModel>();
            }
            return View(session);
        }

        public ActionResult Order(string product_name, string unit, decimal price, int amount, int id)
        {
            CartModel cart = new CartModel();
            cart.id = id;
            cart.amount = amount;
            cart.price = price;
            cart.unit = unit;
            cart.product_name = product_name;
            cart.totalprice = price * amount;

            var session = (List<CartModel>)Session[CommonConstants.CART];
            if (session == null)
                session = new List<CartModel>();
            session.Add(cart);
            Session[CommonConstants.CART] = session;
            return RedirectToAction("Index", "HoaDon");
        }

        public ActionResult Payment()
        {
            var sessionKhachHang = (UserLogin)Session[CommonConstants.CUSTOMER_SESSION];
            if (sessionKhachHang == null)
                return RedirectToAction("Login", "KhachHang");

            var ssCarts = (List<CartModel>)Session[CommonConstants.CART];
            if (ssCarts.Sum(o => o.totalprice) == 0)
            {
                ViewBag.Warn = "Vui lòng mua hàng trước khi thanh toán";
                return View();
            }
            
            KhachHang customer = db.KhachHangs.SingleOrDefault(x => x.Id == sessionKhachHang.UserID);
            ViewBag.KhachHang = customer;
            return View();
        }

        public ActionResult PaymentDetail()
        {
            var sessionKhachHang = (UserLogin)Session[CommonConstants.CUSTOMER_SESSION];
            var ssCarts = (List<CartModel>)Session[CommonConstants.CART];
            if (sessionKhachHang == null && ssCarts == null)
                return RedirectToAction("Index", "Home");

            KhachHang customer = db.KhachHangs.SingleOrDefault(x => x.Id == sessionKhachHang.UserID);
            ViewBag.KhachHang = customer;

            //Tạo hóa đơn
            string billCode = CreateHoaDonCode();
            HoaDon bill = new HoaDon();
            bill.MaKhachHang = sessionKhachHang.UserID;
            bill.MaHoaDon = billCode;
            bill.ThoiGianTao = DateTime.Now;
            bill.TongTien = ssCarts.Sum(o => o.totalprice);
            foreach (var item in ssCarts)
            {
                ChiTietHoaDon order = new ChiTietHoaDon();
                order.SoLuong = item.amount;
                order.DonGia = item.price;
                order.TongTien = item.totalprice;
                order.MaSanPham = item.id;
                order.TenSanPham = item.product_name;
                bill.ChiTietHoaDons.Add(order);
            }
            db.HoaDons.Add(bill);
            db.SaveChanges();
            return View();
        }

        private string CreateHoaDonCode()
        {
            Random rd = new Random();
            //return "HD" + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9) + rd.Next(0, 9);
            return "HD" + DateTime.Now.Ticks;
        }

    }
}
