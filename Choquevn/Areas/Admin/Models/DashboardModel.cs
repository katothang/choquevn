using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CuaHangDoGo.Areas.Admin.Models
{
    public class DashboardModel
    {
        public int KhachHangNo { get; set; }
        public int LoaiTaiKhoanNo { get; set; }
        public int NguoiDungNo { get; set; }
        public int NhaCungCapNo { get; set; }
        public int DanhMucSanPhamNo { get; set; }
        public int SanPhamNo { get; set; }
        public int HopDongNo { get; set; }
        public int HoaDonNo { get; set; }
    }
}