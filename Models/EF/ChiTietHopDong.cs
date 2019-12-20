namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietHopDong")]
    public partial class ChiTietHopDong
    {
        public long Id { get; set; }

        public long? MaHopDong { get; set; }

        public long? MaSanPham { get; set; }

        [StringLength(50)]
        public string TenSanPham { get; set; }

        public int? SoLuong { get; set; }

        public decimal? DonGia { get; set; }

        public decimal? ThanhTien { get; set; }

        public virtual HopDong HopDong { get; set; }

        public virtual SanPham SanPham { get; set; }
    }
}
