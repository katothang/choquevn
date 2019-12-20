namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietHoaDon")]
    public partial class ChiTietHoaDon
    {
        public long Id { get; set; }

        public long? MaSanPham { get; set; }

        [StringLength(50)]
        public string TenSanPham { get; set; }

        public int? SoLuong { get; set; }

        public decimal? DonGia { get; set; }

        public decimal? TongTien { get; set; }

        [StringLength(50)]
        public string MaHoaDon { get; set; }

        public DateTime? NgayGiaoHang { get; set; }

        public int? SoLuongDaGiao { get; set; }

        public virtual HoaDon HoaDon { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
