using Microsoft.AspNetCore.Mvc.ModelBinding;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace CarWebApplication.Models
{
    public class CarsDAL
    {
        string connectionString = "Server=.;Database=Cars;Trusted_Connection=True;";

        //-----------------------------GetAllCars-----------------------------
        public IEnumerable<CarModel> GetAllCars()
        {
            List<CarModel> carList = new List<CarModel>();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetAllGeneralInfo", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    CarModel carsTM = new CarModel();
                    carsTM.ModelID = Convert.ToInt32(dr["ModelID"].ToString());
                    carsTM.DetailsID = Convert.ToInt32(dr["DetailsID"].ToString());
                    carsTM.CompanyName = dr["CompanyName"].ToString();
                    carsTM.ModelName = dr["ModelName"].ToString();
                    carsTM.FuelType = dr["FuelType"].ToString();
                    carsTM.Colour = dr["Colour"].ToString();
                    carsTM.Transmission = dr["Transmission"].ToString();
                    carsTM.Mileage = Convert.ToDecimal(dr["Mileage"].ToString());
                    carsTM.FirstRegistration = Convert.ToDateTime(dr["FirstRegistration"].ToString());
                    carsTM.Price = Convert.ToDecimal(dr["Price"].ToString());

                    carList.Add(carsTM);

                }
                con.Close();
            }
            return carList;
        }
        //-----------------------------InsertCar-----------------------------
        public void AddCar(CarModel carsTM) 
        {
            using (SqlConnection con = new SqlConnection(connectionString)) 
            {
                SqlCommand cmd = new SqlCommand("InsertCarInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@CompanyName", carsTM.CompanyName);
                cmd.Parameters.AddWithValue("@ModelName", carsTM.ModelName);

                cmd.Parameters.AddWithValue("@FirstRegistration",carsTM.FirstRegistration);
                cmd.Parameters.AddWithValue("@Price",carsTM.Price);
                cmd.Parameters.AddWithValue("@FuelType",carsTM.FuelType);
                cmd.Parameters.AddWithValue("@Colour", carsTM.Colour);
                cmd.Parameters.AddWithValue("@Mileage",carsTM.Mileage);
                cmd.Parameters.AddWithValue("@Transmission", carsTM.Transmission);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //-----------------------------UpdateCar-----------------------------
        public void UpdateCar(CarModel carsTM)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UpdateCarInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ModelID", carsTM.ModelID);
                cmd.Parameters.AddWithValue("@DetailsID", carsTM.DetailsID);

                cmd.Parameters.AddWithValue("@CompanyName", carsTM.DetailsID);
                cmd.Parameters.AddWithValue("@ModelName", carsTM.ModelName);

                cmd.Parameters.AddWithValue("@FirstRegistration", carsTM.FirstRegistration);
                cmd.Parameters.AddWithValue("@Price", carsTM.Price);
                cmd.Parameters.AddWithValue("@FuelType", carsTM.FuelType);
                cmd.Parameters.AddWithValue("@Colour", carsTM.Colour);
                cmd.Parameters.AddWithValue("@Mileage", carsTM.Mileage);
                cmd.Parameters.AddWithValue("@Transmission", carsTM.Transmission);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        //-----------------------------DeleteCar-----------------------------
        public void DeleteCar(int? modelID)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("DeleteCarInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@ModelID", modelID);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        //-----------------------------GetCarByID-----------------------------
        public CarModel GetCarByID(int? modelID)
        {
            CarModel carsTM = new CarModel();

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("GetCarById", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@modelID", modelID);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    carsTM.ModelID = Convert.ToInt32(dr["modelID"].ToString());
                    carsTM.DetailsID = Convert.ToInt32(dr["DetailsID"].ToString());
                    carsTM.CompanyName = dr["CompanyName"].ToString();
                    carsTM.ModelName = dr["ModelName"].ToString();
                    carsTM.FuelType = dr["FuelType"].ToString();
                    carsTM.Colour = dr["Colour"].ToString();
                    carsTM.Transmission = dr["Transmission"].ToString();
                    carsTM.Mileage = Convert.ToDecimal(dr["Mileage"].ToString());
                    carsTM.FirstRegistration = Convert.ToDateTime(dr["FirstRegistration"].ToString());
                    carsTM.Price = Convert.ToDecimal(dr["Price"].ToString());
                }
                con.Close();
            }
            return carsTM;
        }
    }
}
