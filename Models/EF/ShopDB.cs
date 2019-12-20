namespace Models.EF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ShopDB : DbContext
    {
        public ShopDB()
            : base("name=ShopDB")
        {
        }

        public virtual DbSet<ChiTietHoaDon> ChiTietHoaDons { get; set; }
        public virtual DbSet<ChiTietHopDong> ChiTietHopDongs { get; set; }
        public virtual DbSet<DanhMucSanPham> DanhMucSanPhams { get; set; }
        public virtual DbSet<DeXuat> DeXuats { get; set; }
        public virtual DbSet<HoaDon> HoaDons { get; set; }
        public virtual DbSet<HopDong> HopDongs { get; set; }
        public virtual DbSet<KhachHang> KhachHangs { get; set; }
        public virtual DbSet<LoaiTaiKhoan> LoaiTaiKhoans { get; set; }
        public virtual DbSet<NguoiDung> NguoiDungs { get; set; }
        public virtual DbSet<NhaCungCap> NhaCungCaps { get; set; }
        public virtual DbSet<SanPham> SanPhams { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.DonGia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietHoaDon>()
                .Property(e => e.MaHoaDon)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietHopDong>()
                .Property(e => e.DonGia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<ChiTietHopDong>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<DanhMucSanPham>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.DanhMucSanPham)
                .HasForeignKey(e => e.MaDanhMuc);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.MaHoaDon)
                .IsUnicode(false);

            modelBuilder.Entity<HoaDon>()
                .Property(e => e.TongTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<HopDong>()
                .Property(e => e.ThanhTien)
                .HasPrecision(18, 0);

            modelBuilder.Entity<HopDong>()
                .Property(e => e.LoaiHopDong)
                .IsUnicode(false);

            modelBuilder.Entity<HopDong>()
                .Property(e => e.ThoiGian)
                .IsUnicode(false);

            modelBuilder.Entity<HopDong>()
                .Property(e => e.TinhTrang)
                .IsUnicode(false);

            modelBuilder.Entity<HopDong>()
                .Property(e => e.NoiDung)
                .IsUnicode(true);

            modelBuilder.Entity<HopDong>()
                .HasMany(e => e.ChiTietHopDongs)
                .WithOptional(e => e.HopDong)
                .HasForeignKey(e => e.MaHopDong);

            modelBuilder.Entity<KhachHang>()
                .Property(e => e.DienThoai)
                .IsUnicode(false);

            modelBuilder.Entity<KhachHang>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.KhachHang)
                .HasForeignKey(e => e.MaKhachHang);

            modelBuilder.Entity<KhachHang>()
                .HasMany(e => e.HopDongs)
                .WithOptional(e => e.KhachHang)
                .HasForeignKey(e => e.MaKhachHang);

            modelBuilder.Entity<LoaiTaiKhoan>()
                .HasMany(e => e.NguoiDungs)
                .WithRequired(e => e.LoaiTaiKhoan)
                .HasForeignKey(e => e.MaLoai)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NguoiDung>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.DeXuats)
                .WithOptional(e => e.NguoiDung)
                .HasForeignKey(e => e.MaNguoiDeXuat);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.DeXuats1)
                .WithOptional(e => e.NguoiDung1)
                .HasForeignKey(e => e.MaNguoiXacNhan);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.HoaDons)
                .WithOptional(e => e.NguoiDung)
                .HasForeignKey(e => e.MaNguoiDung);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.HopDongs)
                .WithOptional(e => e.NguoiDung)
                .HasForeignKey(e => e.MaNhanVien);

            modelBuilder.Entity<NguoiDung>()
                .HasMany(e => e.HopDongs1)
                .WithOptional(e => e.NguoiDung1)
                .HasForeignKey(e => e.MaGiamDoc);

            modelBuilder.Entity<NhaCungCap>()
                .HasMany(e => e.SanPhams)
                .WithOptional(e => e.NhaCungCap)
                .HasForeignKey(e => e.MaCC);

            modelBuilder.Entity<SanPham>()
                .Property(e => e.DonGia)
                .HasPrecision(18, 0);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietHoaDons)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.MaSanPham);

            modelBuilder.Entity<SanPham>()
                .HasMany(e => e.ChiTietHopDongs)
                .WithOptional(e => e.SanPham)
                .HasForeignKey(e => e.MaSanPham);
        }
    }
}
