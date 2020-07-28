using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace CarWebApplication.Models
{
    public class CarModel
    {
        //-------------Base------------
        public int ModelID { get; set; }
        [Required(ErrorMessage = "Kérem válasszon egy gyártót.")]
        [DisplayName("Gyártó")]
        public string CompanyName { get; set; }
        [Required(ErrorMessage = "A modell típusát kötelező megadni.")]
        [DisplayName("Modell")]
        public string ModelName { get; set; }
        [Required (ErrorMessage = "Kérem válasszon üzemanyagtípust.")]
        [DisplayName("Üzemanyag")]
        public string FuelType { get; set; }
        [Required(ErrorMessage = "Kérem írja be az autó árát.")]
        [DisplayName("Vételár EUR")]
        public decimal Price { get; set; }
        //-----------Details-----------
        public int DetailsID { get; set; }
        [Required(ErrorMessage = "Kérem írja be az autó évjáratát.")]
        [DisplayName("Évjárat")]
        public DateTime FirstRegistration { get; set; }
        [Required (ErrorMessage = "Kérem írja be az autó színét.")]
        [DisplayName("Szín")]
        public string Colour { get; set; }
        [Required(ErrorMessage = "Kérem a  kilóméteróra állását.")]
        [DisplayName("Kilóméter állása")]
        public decimal Mileage { get; set; }
        [Required(ErrorMessage = "Kérem válassza ki a sebességváltó típusát.")]
        [DisplayName("Sebességváltó")]
        public string Transmission { get; set; }
    }
}
