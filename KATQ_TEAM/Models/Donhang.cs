﻿namespace KATQ_TEAM.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DonHang")]
    public partial class DonHang
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DonHang()
        {
            ChitietDonHang = new HashSet<ChitietDonHang>();  
        }

        [Key]
        //[DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Madon { get; set; }

        [Display(Name = "Ngày đặt hàng")]
        public DateTime? Ngaydat { get; set; }

        public int? Tinhtrang { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        public int? Thanhtoan { get; set; }

        [Display(Name = "Tổng tiền")]
        public decimal? Tongtien { get; set; }

        [Display(Name = "Tên người dùng")]
        public int? MaNguoidung { get; set; }

        [Display(Name = "Địa chỉ nhận hàng")]
        public string Diachinhanhang { get; set; }

        [Display(Name = "Phương thức thanh toán")]
        public string PhuongThuc { get; set; } 

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChitietDonHang> ChitietDonHang { get; set; }
        public DateTime? delete_at { get; set; }
        public virtual Nguoidung Nguoidung { get; set; }
    }
}
