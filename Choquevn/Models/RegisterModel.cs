using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace CuaHangDoGo.Models
{
    public class RegisterModel
    {
        [Key]
        public int makh { set; get; }

        [Display(Name = "Tài khoản")]
        [Required(ErrorMessage = "Vui lòng nhập tài khoản")]
        public string username { set; get; }

        [Display(Name = "Mật khẩu")]
        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        [StringLength(20, MinimumLength = 6, ErrorMessage = "Độ dài mật khẩu ít nhất 6 ký tự ")]

        public string password { set; get; }

        [Display(Name = "Xác nhận mật khẩu")]
        [Compare("password", ErrorMessage = "Xác nhận mật khẩu không đúng")]
        [Required(ErrorMessage = "Vui lòng nhập xác nhận mật khẩu")]
        public string repassword { set; get; }

        [Display(Name = "Họ tên")]
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string fullname { set; get; }

        [Display(Name = "Địa chỉ")]
        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string address { set; get; }

        [Display(Name = "Điện thoại")]
        [Required(ErrorMessage = "Vui lòng nhập điện thoại")]
        public string phone { set; get; }

        [Display(Name = "Email")]
        [Required(ErrorMessage = "Vui lòng nhập email")]
        public string email { set; get; }

    }
}