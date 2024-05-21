namespace KATQ_TEAM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChitietDonHang")]
    public partial class ChitietDonHang
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Madon { get; set; }

        [Key]
        [Column(Order = 1)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Masp { get; set; }
        [Display(Name = "Số lượng")]

        public int? Soluong { get; set; }
        [Display(Name = "Phương thức thanh toán")]

        public string PhuongThuc { get; set; }
        [Display(Name = "Đơn giá")]

        public decimal? Dongia { get; set; }
        [Display(Name = "Thành tiền")]

        public decimal? Thanhtien { get; set; }

        public virtual DonHang DonHang { get; set; }

        public virtual Sanpham Sanpham { get; set; }
    }
}
