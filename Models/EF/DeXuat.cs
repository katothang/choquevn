namespace Models.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DeXuat")]
    public partial class DeXuat
    {
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long Id { get; set; }

        [Column("DeXuat")]
        [StringLength(50)]
        public string DeXuat1 { get; set; }

        public long? MaNguoiDeXuat { get; set; }

        public long? MaNguoiXacNhan { get; set; }

        public bool? KetQua { get; set; }

        public virtual NguoiDung NguoiDung { get; set; }

        public virtual NguoiDung NguoiDung1 { get; set; }
    }
}
