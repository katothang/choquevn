namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("SanPham")]
    [Serializable]
    public partial class SanPham
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public SanPham()
        {
            ChiTietHoaDons = new HashSet<ChiTietHoaDon>();
            ChiTietHopDongs = new HashSet<ChiTietHopDong>();
        }

        public long Id { get; set; }

        [Column(TypeName = "ntext")]
        public string MetaTitle { get; set; }

        [StringLength(50)]
        public string TenSanPham { get; set; }

        [Column(TypeName = "ntext")]
        public string MoTa { get; set; }

        public decimal? DonGia { get; set; }

        [StringLength(50)]
        public string DonVi { get; set; }

        public long? MaCC { get; set; }

        public long? MaDanhMuc { get; set; }

        [StringLength(100)]
        public string HinhAnh { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHoaDon> ChiTietHoaDons { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietHopDong> ChiTietHopDongs { get; set; }

        public virtual DanhMucSanPham DanhMucSanPham { get; set; }

        public virtual NhaCungCap NhaCungCap { get; set; }
    }
}
