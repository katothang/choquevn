using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CuaHangDoGo
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "chi tiết sản phẩm",
                url: "chi-tiet-san-pham/{id}",
                defaults: new { controller = "SanPham", action = "ChiTietSanPham", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Sản phẩm theo thể loại",
                url: "the-loai/{tendanhmuc}-{id}",
                defaults: new { controller = "DanhMucSanPham", action = "ProductByCategory", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Dăng nhập",
                url: "tai-khoan/dang-nhap",
                defaults: new { controller = "KhachHang", action = "Login", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Dăng xuất",
                url: "tai-khoan/dang-xuat",
                defaults: new { controller = "KhachHang", action = "Logout", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Đăng ký",
                url: "tai-khoan/dang-ky",
                defaults: new { controller = "KhachHang", action = "Register", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Liên hệ",
                url: "lien-he",
                defaults: new { controller = "Home", action = "Contact" },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Giới thiệu",
                url: "gioi-thieu",
                defaults: new { controller = "Home", action = "Introduce" },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                namespaces: new string[] { "BanHangDoGo.Controllers" }
            );

        }
    }
}
