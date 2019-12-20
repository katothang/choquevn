namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HoaDon")]
    public partial class HoaDon
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HoaDon()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
        }

        [Key]
        [StringLength(50)]
        public string MaHoaDon { get; set; }

        public DateTime? ThoiGianTao { get; set; }

        public decimal? TongTien { get; set; }

        public long? MaNguoiDung { get; set; }

        public long? MaKhachHang { get; set; }

        public bool? DaThanhToan { get; set; }

        public DateTime? NgayGiaoHang { get; set; }

        public DateTime? NgayDatCoc { get; set; }

        public DateTime? NgayThanhToan { get; set; }

        public long? HopDong { get; set; }

        [StringLength(255)]
        public string GiaiDoanGiaoHang { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }
    }
}
