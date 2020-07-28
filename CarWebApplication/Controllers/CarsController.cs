using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Threading.Tasks;
using CarWebApplication.Models;
using Microsoft.AspNetCore.Mvc;

namespace CarWebApplication.Controllers
{
    public class CarsController : Controller
    {
        CarsDAL carsDAL = new CarsDAL();
        public IActionResult Index(string searchString, string sortOrder)
        {
            List<CarModel> carList = new List<CarModel>();
            carList = carsDAL.GetAllCars().ToList();
            //--------------------------------Sorting logic--------------------------------
            ViewBag.CompanySortParam = String.IsNullOrEmpty(sortOrder)?"company_desc":"";
            ViewBag.ModelSortParam = String.IsNullOrEmpty(sortOrder)?"model_desc":"";
            ViewBag.FuelTypeSortParam = String.IsNullOrEmpty(sortOrder)? "fuelType_desc" : "";
            ViewBag.PriceSortParam = String.IsNullOrEmpty(sortOrder)? "price_desc" : "";

            switch (sortOrder)
            {
                case "company_desc":
                    carList = carList.OrderBy(s => s.CompanyName).ToList();
                    break;
                case "model_desc":
                    carList = carList.OrderBy(s => s.ModelName).ToList();
                    break;
                case "fuelType_desc":
                    carList = carList.OrderBy(s => s.FuelType).ToList();
                    break;
                case "price_desc":
                    carList = carList.OrderBy(s => s.Price).ToList();
                    break;
            }

            //--------------------------------Search logic--------------------------------
            if (!String.IsNullOrEmpty(searchString))
            {
                carList = carList.Where(b=>b.CompanyName.Contains(searchString)
                                        || b.ModelName.Contains(searchString)
                                        || b.FuelType.Contains(searchString)
                                        || b.Price.ToString().Contains(searchString)).ToList();
            }

            return View(carList);
        }

        [HttpGet]
        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create([Bind] CarModel objCar)
        {
            if (ModelState.IsValid)
            {
                carsDAL.AddCar(objCar);
                return RedirectToAction("Index");
            }
            return View(objCar);
        }

       
        public IActionResult Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            CarModel car = carsDAL.GetCarByID(id);
            if (car == null)
            {
                return NotFound();
            }
            return View(car);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int? id,[Bind] CarModel objCar)
        {
            if (id == null)
            {
                return NotFound();
            }
            if (ModelState.IsValid) 
            {
                carsDAL.UpdateCar(objCar);
                return RedirectToAction("Index");
            }
            return View(carsDAL);
        }

        [HttpGet]
        public IActionResult Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            CarModel car = carsDAL.GetCarByID(id);
            if (car == null)
            {
                return NotFound();
            }
            return View(car);
        }

        public IActionResult Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            CarModel car = carsDAL.GetCarByID(id);
            if (car == null)
            {
                return NotFound();
            }
            return View(car);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteCar(int? id)
        {
            carsDAL.DeleteCar(id);
            return RedirectToAction("Index");
        }
    }
}
