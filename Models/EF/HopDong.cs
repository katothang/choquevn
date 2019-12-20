namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HopDong")]
    public partial class HopDong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HopDong()
        {
            ChiTietHopDongs = new HashSet<ChiTietHopDong>();
        }

        public long Id { get; set; }

        public DateTime NgayTao { get; set; }

        public long? MaNhanVien { get; set; }

        public long? MaGiamDoc { get; set; }

        public long? MaKhachHang { get; set; }

        public decimal? ThanhTien { get; set; }

        public bool? KhachHangXacNhan { get; set; }

        public int? TienDatCoc { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayBatDau { get; set; }

        [Column(TypeName = "date")]
        public DateTime? NgayKetThuc { get; set; }

        public string LoaiHopDong { get; set; }

        public string ThoiGian { get; set; }

        [StringLength(255)]
        public string TinhTrang { get; set; }

        public string NoiDung { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHopDong> ChiTietHopDongs { get; set; }

        public virtual KhachHang KhachHang { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual NguoiDung NguoiDung1 { get; set; }
    }
}
